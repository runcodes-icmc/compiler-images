if [ ! -f src/?akefile ]
then
    compilation_command=""
    run_command="octave-cli -H -W -q ${src_file}"
fi

export OPENBLAS_NUM_THREADS=1
run_tests "$run_command"


# https://ftp.gnu.org/gnu/octave/octave-8.3.0.tar.xz