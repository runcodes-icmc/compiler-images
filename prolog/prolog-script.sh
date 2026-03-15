if ! compgen -G "src/?akefile" >/dev/null; then
  compilation_command=''
  run_command="swipl -q -f ${src_file}"
fi

run_tests "$run_command"
