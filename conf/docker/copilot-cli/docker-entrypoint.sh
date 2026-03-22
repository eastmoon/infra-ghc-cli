#!/bin/bash
set -e

if [ "$1" = "bash" ] || [ "$1" = "sh" ]; then
    exec "$@"
elif [ "$1" = "prompt" ]; then
    args=(${@})
    echo "${args[@]:1}" > /tmp/prompt
    cat /tmp/prompt | copilot --silent
elif [ "$1" = "plan" ]; then
    if [ -f /plan/${2} ]; then
        cat /plan/${2} | copilot --silent
    else
        echo "'${2}' not in plan folder."
    fi
else
    copilot "${@}"
fi
