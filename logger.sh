#!/bin/bash

logfile="$0.log"
loglevel="INFO"
readonly levels="DEBUG INFO WARN ERROR"

logger.log() {
    local timestamp=$(date +"%D %T")
    local level="$1"
    local message="$2"
    local out="$timestamp|$level|$message"

    echo -e "$level: $message" >&2
    [[ -n "$logfile" ]] &&
        echo -e "$out" >> "$logfile"

    return 0
}

logger.is_valid() {
    [[ $(echo $levels | grep -oP "$loglevel.*" ) =~ "$1" ]]
}

logger.debug() {
    logger.is_valid "DEBUG"\
    && logger.log "DEBUG" "$1"\
    || true
}
logger.info() {
    logger.is_valid "INFO"\
    && logger.log "INFO" "$1"\
    || true
}
logger.warn() {
    logger.is_valid "WARN"\
    && logger.log "WARN" "$1"\
    || true
}
logger.error() {
    logger.is_valid "ERROR"\
    && {
        logger.log "ERROR" "$1"
        exit 1
    }\
    || true
}
