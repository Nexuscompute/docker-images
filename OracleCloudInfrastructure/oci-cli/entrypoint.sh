#!/bin/bash
# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

_cli_version=$(oci --version)
if [ ! -f "$HOME/cli-verbs-$_cli_version" ]; then
  COMP_WORDS="oci" COMP_WORD=0 _OCI_COMPLETE=complete oci > "$HOME/cli-verbs-$_cli_version" 2>/dev/null
fi

_cli_verbs=$(<"$HOME/cli-verbs-$_cli_version")

# if the user passes "oci" or an argument or a verb, run the oci command
# if not, run what they pass instead, e.g. /bin/bash
if [ "$1" == "oci" ]; then
  exec oci "${@:2}"
elif [ "${1:0:1}" == "-" ] || [[ "$_cli_verbs" =~ $1 ]]; then
  exec oci "$@"
else
  exec bash "$@"
fi
