#!/bin/bash

VERSION="0.0.1";
CLOUD_TABS_DB="${HOME}/Library/Safari/CloudTabs.db";

function pf_fail() {
    echo "Failed preflight: ${@}" &>2;
}

function preflight() {
    if [ -z "$(which sqlite3)" ]; then
        pf_fail "Need sqlite3" && exit 1;
    fi
}

function usage() {
    echo "Usage: ${0} [<flags>] <section>";
    echo "Flags:";
    echo "  --alias       - Generate alias";
    echo "  -h, --help    - This help";
    echo "  -V, --version - Version Info";
    echo "Available sections:";
    echo "  tabs          - iCloud tabs";
}

function file_exists_or_fatal() {
    if [ ! -f "${1}" ]; then
        echo "Could not find ${1}";
        exit 1;
    fi
}

function export_tabs() {
    file_exists_or_fatal "${CLOUD_TABS_DB}" || exit 1;

    echo 'select title,url from cloud_tabs' \
        | sqlite3 -separator "$(echo -e "\t")" "${CLOUD_TABS_DB}";
}

function cmd_alias() {
    echo "alias icloud-export=\"$(cd $(dirname $0); pwd)/$(basename $0)\"";
}

function cmd_version() {
    echo "icloud-export version: ${VERSION}";
}

function main() {
    preflight;

    local section="${1}";

    if [ -z "${section}" ]; then
        usage;
        exit 1;
    fi

    case "${section}" in
    "--alias")
        cmd_alias;
        ;;
    "-h"|"--help")
        usage;
        ;;
    "-V"|"--version")
        cmd_version;
        ;;
    tabs)
        export_tabs;
        ;;
    *)
        usage;
        exit 1;
    esac
}

main "$*"
