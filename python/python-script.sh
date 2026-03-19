if ! compgen -G "src/?akefile" >/dev/null; then
    compilation_command=''
    run_command="python ${src_file}"
fi

monitor_max_ms=1048576000 #1G

run_tests "$run_command"
