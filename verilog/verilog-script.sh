if ! compgen -G "src/?akefile" >/dev/null; then
    pre_run_command="iverilog -o ${user_bin} ${src_file} ../\$1.in"
    run_command="./${user_bin}"
fi

run_tests "$run_command" "$pre_run_command"
