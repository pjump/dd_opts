cd "$(dirname "${BASH_SOURCE[0]}")"
source "spec.bash"
source "dd_opts.bash"

it "should set nontrivial dd_opts correctly" <<'eof'
  set 'Foo_Bar33=1 2;3`4"5~6!7@8#9$0 1%2^3&4*5(6)7-8=9+0' '1 2;3`4"5~6!7@8#9$0 1%2^3&4*5(6)7-8=9+0=33'

  expected_opt='1 2;3`4"5~6!7@8#9$0 1%2^3&4*5(6)7-8=9+0'
  expected_arg='1 2;3`4"5~6!7@8#9$0 1%2^3&4*5(6)7-8=9+0=33'

  eval "$DD_OPTS_PARSE"
  echo "$DD_OPT_Foo_Bar33"
  [[ "$DD_OPT_Foo_Bar33" == "$expected_opt" && "$1" == "$expected_arg" ]]
eof

it "should stop at the first non-dd-opt argument" <<'eof'
  set a=1 b=2 c d=4

  eval "$DD_OPTS_PARSE"

  [[ "$DD_OPT_a" == "1" && "$DD_OPT_b" == "2" && "$1" == c && "$2" == "d=4" ]]
eof

