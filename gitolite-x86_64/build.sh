#!/bin/bash

sudo docker build -t arcamael/gitolite .
sudo docker tag arcamael/gitolite arcamael/gitolite:$(git rev-parse --abbrev-ref HEAD)
