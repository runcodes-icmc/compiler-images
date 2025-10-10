if [ ! -f src/?akefile ]; then
    compilation_command=""
    run_command="octave-cli -H -W -q ${src_file}"
fi

export OPENBLAS_NUM_THREADS=1

monitor_max_ms=1048576000 #1G
# certas funcionalidades do octave necessitam de muita memória, então 256MB não é o suficiente nesse caso.
# No caso especifico que eu testei, observei que 900MB era o suficiente, porém coloque 1G aqui para dar uma margem

run_tests "$run_command"
