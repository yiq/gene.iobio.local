#!/bin/bash

fetch_gz() {
    if [ ! -e data-vol/.${1}.fetched ]; then
        echo "Fetching ${1}"
        curl -L\# https://s3.amazonaws.com/iobio/assets/data-vol/v1.0/${1}.tar.gz | tar -C data-vol -xzf -
        touch data-vol/.${1}.fetched
    fi
}

fetch_bz2() {
    if [ ! -e data-vol/.${1}.fetched ]; then
        echo "Fetching ${1}"
        curl -L\# https://s3.amazonaws.com/iobio/assets/data-vol/v1.0/${1}.tar.bz2 | tar -C data-vol -xjf -
        touch data-vol/.${1}.fetched
    fi
}

fetch_gz afdata
fetch_gz gene2pheno
fetch_gz geneinfo
fetch_gz hpo
fetch_gz ref
fetch_bz2 vep-cache


