# NOTE: no support for Makefile

# Leave only errors and warnings on error file and removes known linker warning
handle_output() {
    warn_msg='warning: link\.res contains output sections; did you forget -T\?'
    COMPILATION_ERROR=`cat ../${compilation_error}`
    echo ${COMPILATION_ERROR} |\
        grep -v ${warn_msg} |\
        egrep 'error:|warning:' >../${compilation_error}
}

compilation_command="fpc -vewr -o${user_bin} ${src_file}"
run_command="./${user_bin}"

compile "$compilation_command" '' handle_output

# Bail if there are any compilation errors
if [ -s ${compilation_error} ]
then
    exit 1
fi

run_tests "$run_command"
