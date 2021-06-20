#!/bin/bash 
docker run -d --rm \
    -p 4000:4000 \
    --mount type=bind,source="$(pwd)",target=/app \
    --name tindandelion-blog \
    gh-pages:latest