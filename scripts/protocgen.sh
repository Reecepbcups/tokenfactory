#!/usr/bin/env bash

set -eo pipefail

echo "Generating gogo proto code"
cd proto

buf generate --template buf.gen.gogo.yaml $file

cd ..

# move proto files to the right places
cp -r ./github.com/reecepbcups/tokenfactory/x/* x/
rm -rf ./github.com

go mod tidy