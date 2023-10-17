if [ ! -f src/?akefile ]; then
    compilation_command="dotnet new console -o . && cp ${src_file} Program.cs && dotnet build"
    run_command="dotnet run"
fi

monitor_max_fs=67108864
monitor_max_ms=1073741824
compilation_timeout=60

compile "$compilation_command"

# Bail if there are any compilation errors
if [ -s ${compilation_error} ]; then
    exit 1
fi

run_tests "$run_command"
