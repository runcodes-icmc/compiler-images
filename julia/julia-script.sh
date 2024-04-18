if [ ! -f src/?akefile ]
then
    compilation_command=''
    run_command="julia ${src_file}"
fi

monitor_max_fs=67108864
monitor_max_ms=1073741824
compilation_timeout=60

run_tests "$run_command"
