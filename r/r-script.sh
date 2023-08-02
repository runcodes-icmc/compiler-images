# NOTE: no support for Makefile

make_src() {
    cat /bin/run_codes_functions.r ${src_file} > /tmp/src.r
    mv /tmp/src.r > ${src_file}
}

pre_run_commmand=make_src
run_command="Rscript --silent --slave --vanilla ${src_file}"

run_tests "$run_command"
