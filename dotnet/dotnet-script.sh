if ! compgen -G "src/?akefile" >/dev/null; then
    pre_compilation_command="dotnet new console -o . --force &>/dev/null && rm Program.cs"
    compilation_command="dotnet build -c Release"
    run_command="./bin/Release/net10.0/src"
fi

monitor_max_fs=2684354560000
monitor_max_ms=7516192768
compilation_timeout=60

compile "${compilation_command}" "${pre_compilation_command}"

# Bail if there are any compilation errors
if [ -s "${compilation_error}" ]; then
    exit 1
fi

run_tests "${run_command}"
