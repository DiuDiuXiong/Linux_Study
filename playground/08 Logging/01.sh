#!/bin/bash

RANDOM_NUMBER=$RANDOM

echo $RANDOM_NUMBER
logger -s -p user.info "$RANDOM_NUMBER"