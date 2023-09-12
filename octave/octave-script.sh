fix_warnings() {
    test_id=$1
    cp ../${test_id}.error ../tmp
    sed 1,2d <../tmp >../${test_id}.error
    rm ../tmp
}

monitor_max_ms=0

run_command="octave-cli -H -W -q ${src_file}"

export OPENBLAS_NUM_THREADS=1
run_tests "$run_command" '' fix_warnings
