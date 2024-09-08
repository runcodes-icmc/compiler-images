if [ ! -f src/?akefile ]; then
  compilation_command="g++ -std=c++17 ${src_file} -o ${user_bin} -w -O2 -lm -fopenmp"
  run_command="./${user_bin}"
fi

compile "$compilation_command"

# Bail if there are any compilation errors
if [ -s ${compilation_error} ]; then
  exit 1
fi

run_tests "$run_command"
