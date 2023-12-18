if [ ! -f src/?akefile ]
then
    cp "./src/${src_file}" ./src/Main.java
    compilation_command="javac -g Main.java"
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
