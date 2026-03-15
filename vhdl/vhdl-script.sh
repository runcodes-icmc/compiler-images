if ! compgen -G "src/?akefile" >/dev/null; then
    run_command="ghdl -a ${src_file} && ghdl --elab-run ${src_file%.vhd}"
fi

run_tests "$run_command"
