if [ ! -f src/?akefile ]; then
  compilation_command="gcc ${src_file} -o ${user_bin} -w -O2 -lm"
  run_command="./${user_bin}"
fi

export OMPI_ALLOW_RUN_AS_ROOT=1
export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1

compile "$compilation_command"

# Bail if there are any compilation errors
if [ -s ${compilation_error} ]; then
  exit 1
fi

run_tests "$run_command"
