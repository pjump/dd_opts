# DD_OPTS

## Setting arguments, dd-style; arg1=’hello world’

### Usage:

```bash
  your_script_or_function_using_dd_opts arg1=val1 arg2=’7*(%78^^)’ first_non_option_argument arg3=”this won’t set a value"
```
`arg1=val1` will set `DD_OPT_arg1=val1` etc. in a completely safe manner.

to achieve this:

```bash
  source dd_opts.bash
  eval “$DD_OPTS_PARSE”
  
  #eval “$DD_OPTS_PARSE_LOCAL” 
  #^ if you’re inside a function and don’t want different functions using DD_OPTS to clash
```

### Examples
Read `dd_opts_spec.bash` for examles or run it to ensure the examples work.

### Authors and inspiration
http://unix.stackexchange.com/questions/207585/dd-style-parameters-to-a-bash-script
