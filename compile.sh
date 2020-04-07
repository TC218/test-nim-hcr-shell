
indent() {
  local indentSize=2
  local indent=1
  if [ -n "$1" ]; then indent=$1; fi
  pr -to $(($indent * $indentSize))
}


rm -rf ~/.cache/nim/test_nim_hcr_shell_d/
nim c --outdir:f --hotcodereloading:on  --hints:off test_nim_hcr_shell.nim 

cache_dir=~/.cache/nim/test_nim_hcr_shell_d

echo
cmd="objdump -t $cache_dir/lib@mf@sshell@sshell.nim.c.so | grep defaultDebugConfig"

echo $cmd
eval $cmd | indent


cmd="gcc   -o f/test_nim_hcr_shell $cache_dir/@mtest_nim_hcr_shell.nim.c.o  $cache_dir/lib@mf@sshell@sshell.nim.c.so   -lm -lrt   -ldl"

echo
echo $cmd 
eval $cmd | indent
 
echo
ls -l f/test_nim_hcr_shell | indent

echo 
./f/test_nim_hcr_shell
