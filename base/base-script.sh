#!/bin/bash

# Configuration variables shared by all containers
container_config_file=container.config
compilation_monitor_error=compilation.monitor_err
compilation_monitor_output=compilation.monitor_out
compilation_error=compilation.err
compilation_output=compilation.out
outputfiles_dir=outputfiles
monitor_bin=/usr/bin/monitor
user_bin=executable

# Variables we expect to be inside ${container_config_file}:
# monitor_max_fs, monitor_max_ms, compilation_timeout, src_file
# We also set defaults here just in case :)
monitor_max_fs=5242880   # 5MB
monitor_max_ms=268435456 #256MB
compilation_timeout=10
src_file=''
make_file=false
[[ -e ${container_config_file} ]] && source ${container_config_file}

# Messages sent for notifying of current status
compilation_start_msg='compilation.start'
compilation_done_msg='compilation.done'
run_start_msg='run.start'
run_done_msg='run.done'

compile() {
    compilation_command=$1
    pre_compilation_command=$2
    post_compilation_command=$3

    echo ${compilation_start_msg}

    # Save working dir to return to it later
    wd=$(pwd)
    cd src || exit

    [ -z "${pre_compilation_command}" ] || ${pre_compilation_command}

    ${monitor_bin} -f ${monitor_max_fs} \
        -m ${monitor_max_ms} \
        -o ../${compilation_output} \
        -e ../${compilation_error} \
        -c "timeout --signal=SIGKILL ${compilation_timeout} ${compilation_command}" \
        >../${compilation_monitor_output} \
        2>../${compilation_monitor_error}

    [ -z "${post_compilation_command}" ] || ${post_compilation_command}

    # Back to original working dir
    cd "$wd" || exit

    cp ${compilation_monitor_output} ${outputfiles_dir}
    cp ${compilation_monitor_error} ${outputfiles_dir}
    cp ${compilation_output} ${outputfiles_dir}
    cp ${compilation_error} ${outputfiles_dir}

    echo ${compilation_done_msg}
}

run_tests() {
    run_command=$1
    pre_run_command=$2
    post_run_command=$3

    echo ${run_start_msg}

    # Save working dir to return to it later
    wd=$(pwd)

    while IFS= read -r -d '' test_dir; do
        test_id=${test_dir#./test_}
        cp -rn src/* "${test_dir}"

        cd "${test_dir}" || exit

        # This should have a value set in ${container_config_file}
        var=t_${test_id}
        [ -z "${!var}" ] && timeout=3 || timeout=${!var}

        [ -z "${pre_run_command}" ] || ${pre_run_command} "${test_id}"

        # Save output files outside of the test dir
        ${monitor_bin} -f $monitor_max_fs \
            -m $monitor_max_ms \
            -i "../${test_id}.in" \
            -o "../${test_id}.output" \
            -e "../${test_id}.error" \
            -c "timeout --signal=SIGKILL ${timeout} ${run_command}" \
            >"../${test_id}.monitor_out" \
            2>"../${test_id}.monitor_err"

        [ -z "${post_run_command}" ] || ${post_run_command} "${test_id}"

        # Back to original working dir
        cd "$wd" || exit

        cp "${test_id}.monitor_out" "${outputfiles_dir}"
        cp "${test_id}.monitor_err" "${outputfiles_dir}"
        cp "${test_id}.output" "${outputfiles_dir}"
        cp "${test_id}.error" "${outputfiles_dir}"
    done < <(find . -maxdepth 1 -type d -name 'test_*' -print0)

    echo ${run_done_msg}
}

# Make sure we have our directory for output files
mkdir -p ${outputfiles_dir}

# Standard commands for a Makefile-based submission. This can change depending
# on the particular needs of each language.
for file in src/?akefile; do
    if [ -f "$file" ]; then
        make_file=true
        compilation_command='make all'
        run_command='make -s run'
        break
    fi
done
