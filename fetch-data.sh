#!/bin/bash

fetch() {
    if [ ! -e data-vol/.${1}.fetched ]; then
        echo "Fetching ${1}"
        curl -L\# https://s3.amazonaws.com/iobio/assets/data-vol/v2.0/${1}.tar.gz | tar -C data-vol -xzf -
        if [ $? -eq 0 ]; then touch data-vol/.${1}.fetched; fi
    fi
}

fetch afdata
fetch gene2pheno
fetch geneinfo
fetch hpo
fetch ref
fetch vep-cache
fetch local_cache


