#!/bin/bash
# Returns true if only the docs have been modified

set -x

DOCS_REPO="docs/"

cd $(dirname $0)

FILES_CHANGED=$(git log --name-only --pretty=format: origin/develop..HEAD)

for word in $FILES_CHANGED
do
    if [[ $word != ${DOCS_REPO}* ]]; then
        exit 1;
    fi
done

cat <<EOF
======================================================
We detected only docs changes, take appropriate action
======================================================
EOF

exit 0
