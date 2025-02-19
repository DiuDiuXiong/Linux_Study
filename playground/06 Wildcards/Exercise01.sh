#!/bin/bash

shopt -s nullglob # won't raise if ls didn't match anything

for file in $(ls *.jpg);
do
  mv "$file" "$(date +%F)-${file}"
done

read -p "Give an extension of file you want to rename" EXTENSION
read -p "Give a prefix you want to add" PREFIX

[ -z "$PREFIX" ] && PREFIX=$(date +%F)

for file in $(ls [!E]*.${EXTENSION});
do
  mv "$file" "${PREFIX}-${file}"
done
