# NOTE: no support for Makefile

compilation_command="java -jar /bin/portugol/portugol-compiler-2.6.9.jar ${src_file}"

custom_run_command() {
    test_id=$1

    # FIXME: Overriding timeout
    timeout=$(($timeout+3))
    run_command="java -jar /bin/portugol/portugol-console-2.6.9.jar ${src_file} -no-wait -in=../${test_id}.in -out=../${test_id}.output -err=../${test_id}.error"
}

# FIXME: Overriding settings
monitor_max_fs=209715200 # 200MB
monitor_max_ms=0 # 0 means no memory limit

compile "$compilation_command"

# Bail if there are any compilation errors
if [ -s ${compilation_error} ]
then
    exit 1
fi

run_tests '' custom_run_command
