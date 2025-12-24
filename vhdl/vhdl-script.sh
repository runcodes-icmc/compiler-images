for file in src/?akefile; do
    if [ -f "$file" ]; then
        found=true
        break
    fi
done

if [ "$found" = "" ]; then
    export compilation_command=''
    run_command="ghdl -a ${src_file} && ghdl --elab-run ${src_file%.vhd}"
fi

run_tests "$run_command"
