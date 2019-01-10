#!/bin/bash

logfile="$0.log"
loglevel="INFO"
readonly levels="DEBUG INFO WARN ERROR"

logger.log() {
    timestamp=$(date +"%D %T")
    level="$1"
    message="$2"
    out="$timestamp|$level|$message"

    echo -e "$level: $message"
    [[ -n "$logfile" ]] &&
        echo -e "$out" >> "$logfile"
}

logger.is_valid() {
    [[ $(echo $levels | grep -oP "$loglevel.*" ) =~ "$1" ]]
}

debug() {
    logger.is_valid "DEBUG" &&
        logger.log "DEBUG" "$1"
}
info() {
    logger.is_valid "INFO" &&
        logger.log "INFO" "$1"
}
warn() {
    logger.is_valid "WARN" &&
        logger.log "WARN" "$1"  >&2
}
error() {
        exit
    logger.is_valid "ERROR" && {
        logger.log "ERROR" "$1" >&2
    }
}
