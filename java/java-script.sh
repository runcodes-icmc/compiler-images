if [ ! -f src/?akefile ]
then
    compilation_command="javac -g ${src_file}"
    run_command="java Main"
fi

# FIXME: Overriding settings
monitor_max_ms=0

compile "$compilation_command"

# Bail if there are any compilation errors
if [ -s ${compilation_error} ]
then
    exit 1
fi

run_tests "$run_command"
