#!/bin/bash

__FILE__="$PWD/${BASH_SOURCE[0]}"
__DIR__=$(dirname "$__FILE__")
TMPDIR="$__DIR__/tmp"
mkdir -p $TMPDIR
STDOUT=`mktemp`
STDERR=`mktemp`
DEBUG_STDOUT=true
DEBUG_STDERR=true

original_pwd="$PWD"

trap 'cd "$original_pwd"; rm -rf "$STDOUT"; rm -rf "$TDERR"; rm -rf "$TMPDIR"' exit

before_each() {
 echo -n;
}
after_each() {
 echo -n ;
}

it(){
  local msg="$1"
  local cmd="_(){ "$(cat)"; };_" #wrap into an immediately invokable function so we can use return
  local ret=0
  before_each
  : >| "$STDERR" >| "$STDOUT"

  (
  set -e
  eval "$cmd" >| "$STDOUT" 2>| "$STDERR" 
  )

  if [[ $? == 0 ]]; then
    echo -en "OK\t"
    ret=0
  else
    echo -en "FAIL\t"
    [[ ! -z "$DEBUG_STDOUT" ]] && {
      echo "STDOUT------------"
      cat "$STDOUT"
      echo "------------------"
    }
    [[ ! -z "$DEBUG_STDERR" ]] && {
      echo "STDERR------------"
      cat "$STDERR"
      echo "------------------"
    }
    ret=1
  fi;
  echo "$msg"
  after_each
  return "$ret"
}
