if [ ! -f src/?akefile ]
then
    compilation_command="luac -o ${user_bin} ${src_file}"
    run_command="lua ${user_bin}"
fi

compile "$compilation_command"

# Bail if there are any compilation errors
if [ -s ${compilation_error} ]
then
    exit 1
fi

run_tests "$run_command"
