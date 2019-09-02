#!/bin/bash

# colors
logger.color.reset() {
    echo -n "\e[0m"
}


logger.color.fg.default() {
    echo -n "\e[39m"
}

logger.color.fg.black() {
    echo -n "\e[30m"
}

logger.color.fg.red() {
    echo -n "\e[31m"
}

logger.color.fg.green() {
    echo -n "\e[32m"
}

logger.color.fg.yellow() {
    echo -n "\e[33m"
}

logger.color.fg.blue() {
    echo -n "\e[34m"
}

logger.color.fg.magenta() {
    echo -n "\e[35m"
}

logger.color.fg.cyan() {
    echo -n "\e[36m"
}

logger.color.fg.light_gray() {
    echo -n "\e[37m"
}

logger.color.fg.dark_gray() {
    echo -n "\e[90m"
}

logger.color.fg.light_red() {
    echo -n "\e[91m"
}

logger.color.fg.light_green() {
    echo -n "\e[92m"
}

logger.color.fg.light_yellow() {
    echo -n "\e[93m"
}

logger.color.fg.light_blue() {
    echo -n "\e[94m"
}

logger.color.fg.light_magenta() {
    echo -n "\e[95m"
}

logger.color.fg.light_cyan() {
    echo -n "\e[96m"
}

logger.color.fg.white() {
    echo -n "\e[97m"
}


logger.color.bg.default() {
    echo -n "\e[49m"
}

logger.color.bg.black() {
    echo -n "\e[40m"
}

logger.color.bg.red() {
    echo -n "\e[41m"
}

logger.color.bg.green() {
    echo -n "\e[42m"
}

logger.color.bg.yellow() {
    echo -n "\e[43m"
}

logger.color.bg.blue() {
    echo -n "\e[44m"
}

logger.color.bg.magenta() {
    echo -n "\e[45m"
}

logger.color.bg.cyan() {
    echo -n "\e[46m"
}

logger.color.bg.light_gray() {
    echo -n "\e[47m"
}

logger.color.bg.dark_gray() {
    echo -n "\e[100m"
}

logger.color.bg.light_red() {
    echo -n "\e[101m"
}

logger.color.bg.light_green() {
    echo -n "\e[102m"
}

logger.color.bg.light_yellow() {
    echo -n "\e[103m"
}

logger.color.bg.light_blue() {
    echo -n "\e[104m"
}

logger.color.bg.light_magenta() {
    echo -n "\e[105m"
}

logger.color.bg.light_cyan() {
    echo -n "\e[106m"
}

logger.color.bg.white() {
    echo -n "\e[107m"
}


logger.colorize() {
    local color="$1"
    local text="$2"

    echo -e "$color$text$(logger.color.reset)"
}

# logger
logfile="$0.log"
loglevel="INFO"
readonly levels="DEBUG INFO WARN ERROR"

logger.log() {
    local timestamp=$(date +"%D %T")
    local level="$1"
    local message="$2"
    local out="$timestamp|$level|$message"
    local color="$3"

    colorized_level=$(logger.colorize $color $level)

    echo -e "$colorized_level: $message" >&2
    [[ -n "$logfile" ]] &&
        echo -e "$out" >> "$logfile"

    return 0
}

logger.is_valid() {
    [[ $(echo $levels | grep -oP "$loglevel.*" ) =~ "$1" ]]
}

logger.debug() {
    logger.is_valid "DEBUG"\
    && logger.log "DEBUG" "$1" "$(logger.color.fg.cyan)" \
    || true
}

logger.info() {
    logger.is_valid "INFO"\
    && logger.log "INFO" "$1" "$(logger.color.fg.white)" \
    || true
}

logger.warn() {
    logger.is_valid "WARN"\
    && logger.log "WARN" "$1" "$(logger.color.fg.light_red)" \
    || true
}

logger.error() {
    logger.is_valid "ERROR"\
    && {
        logger.log "ERROR" "$1" "$(logger.color.fg.red)"
        exit 1
    }\
    || true
}
