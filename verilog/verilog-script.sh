if ! "$make_file"; then
    compilation_command=''

    # script that will be called as pre_run to compile the design file along with the test bench (test case)
    echo "iverilog -o ${user_bin} ${src_file} ../\$1.in" >pre_run.sh && chmod +x pre_run.sh

    pre_run_command="../pre_run.sh"
    run_command="./${user_bin}"
fi

run_tests "$run_command" "$pre_run_command"
