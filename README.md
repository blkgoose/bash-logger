# bash-logger
A logger library for standard loggin in bash

## Example

```bash
logfile="file.log" # file where to log on.
loglevel="INFO"    # minimum level to allow logging for [DEBUG, INFO, WARN, ERROR].

logger.<level> "<message>"
# on stdout  -> "<level>: <message>"
# on logfile -> "<timestamp>|<level>|<message>"
```

### Useful functions

```bash
logger.debug "<message>"   # debug log
logger.info  "<message>"   # info log
logger.warn  "<message>"   # warn log
logger.error "<message>"   # error log with exit 1
logger.error "<message>" N # error log with exit N
```

#### Special cases

to avoid file logging use
```bash
logfile=""
```
