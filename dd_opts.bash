DD_OPTS_PARSE=$(cat <<'EOF'
  while [[ $1 =~ ^[[:alpha:]_][[:alnum:]_]*= ]]; do
    eval "DD_OPT_${1%%=*}"='${1#*=}';
    shift;
  done
EOF
)
DD_OPTS_PARSE_LOCAL="${PARSE_AND_REMOVE_DD_OPTS/DD_OPT_/local DD_OPT_}"
