if ! compgen -G "src/?akefile" >/dev/null; then
    compilation_command=''
    run_command="python ${src_file}"
fi

run_tests "$run_command"
