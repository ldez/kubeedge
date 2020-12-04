#!/usr/bin/env bash

###
#Copyright 2020 The KubeEdge Authors.
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.
###

set -o errexit
set -o nounset
set -o pipefail
set -x


kubeedge::lint::check() {
    cd ${KUBEEDGE_ROOT}

    echo "check any issue by golangci-lint ..."
    GOOS="linux" golangci-lint run -v

    # only check format issue under staging dir
    echo "check any issue under staging dir by gofmt ..."
    gofmt -l -w staging
}
