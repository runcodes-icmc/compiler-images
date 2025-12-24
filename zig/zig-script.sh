if [ ! -f src/?akefile ]; then
  compilation_command="zig build-exe ${src_file} --name ${user_bin} -O ReleaseSafe"
  run_command="./${user_bin}"
fi

monitor_max_fs=67108864
monitor_max_ms=1073741824
compilation_timeout=20

compile "$compilation_command"

# Bail if there are any compilation errors
if [ -s ${compilation_error} ]; then
  exit 1
fi

run_tests "$run_command"
