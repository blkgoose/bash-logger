#!/bin/bash

logfile="$0.log"
loglevel="INFO"
readonly levels="DEBUG INFO WARN ERROR"

log() {
    timestamp=$(date +"%D %T")
    level="$1"
    message="$2"
    out="$timestamp|$level|$message"

    echo -e "$level: $message"
    [[ -n "$logfile" ]] &&
        echo -e "$out" >> "$logfile"
}

is_valid() {
    [[ $(echo $levels | grep -oP "$loglevel.*" ) =~ "$1" ]]
}

debug() {
    is_valid "DEBUG" &&
        log "DEBUG" "$1"
}
info() {
    is_valid "INFO" &&
        log "INFO" "$1"
}
warn() {
    is_valid "WARN" &&
        log "WARN" "$1"  >&2
}
error() {
    is_valid "ERROR" && {
        log "ERROR" "$1" >&2
        exit
    }
}
