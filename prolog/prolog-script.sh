if [ ! -f src/?akefile ]
then
    compilation_command=''
    run_command="swipl -q -s $src_file"
fi

run_tests "$run_command"
