# Copyright 2020 Intel Corporation
#
# SPDX-License-Identifier: Apache-2.0

set -e

###########################################################
# define_to_variable
#   input:  file with C #define, #define string as parameters
#   output: variable named #define string
###########################################################
function define_to_variable() {
    if [[ ! -f $1 ]]; then
        echo "no file $1 to extract define"
        exit -1
    fi
    printf -v $2 "$(grep -w "$2" $1 | awk '{print $3}' | sed 's/"//g')"
}
