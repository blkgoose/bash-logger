# bash-logger
A logger library for standard loggin in bash

## Example

```bash
logfile="file.log" # file where to log on.
loglevel="INFO"    # minimum level to allow logging for [DEBUG, INFO, WARN, ERROR].

log "<level>" "<message>"
# on stdout  -> "<level>: <message>"
# on logfile -> "<timestamp>|<level>|<message>"
```

### Useful functions

```bash
debug "<message>" # debug log
info  "<message>" # info log
warn  "<message>" # warn on stderr
error "<message>" # error on stderr and exit with 1
```

#### Special cases

to avoid file logging use
```bash
logfile=""
```
