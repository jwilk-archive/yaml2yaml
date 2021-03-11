#!/usr/bin/env bash

# Copyright © 2020-2021 Jakub Wilk <jwilk@jwilk.net>
# SPDX-License-Identifier: MIT

set -e -u
pdir="${0%/*}/.."
prog="$pdir/yaml2yaml"
echo 1..1
in="{'a': 'b'}"
xout='a: b'
out=$("$prog" <<< "$in")
diff=$(diff -u <(cat <<< "$xout") <(cat <<< "$out")) || true
if [ -z "$diff" ]
then
    echo 'ok 1'
else
    sed -e 's/^/# /' <<< "$diff"
    echo 'not ok 1'
fi

# vim:ts=4 sts=4 sw=4 et ft=sh
