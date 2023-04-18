#!/bin/bash

pr_path="/opt/odoo16/addons/PR"
l10n_italy_path="/opt/odoo16/addons/OCA/l10n-italy"

pr_list=$(ls -d $pr_path/* 2>/dev/null)
l10n_italy_list=$(ls -d $l10n_italy_path/* 2>/dev/null)

for folder in $pr_list; do
  pr_array+=("$folder")
done

for folder in $l10n_italy_list; do
  l10n_italy_array+=("$folder")
done

i=0

for folder in $pr_list; do
 if [[ " ${l10n_italy_array[*]} " =~ " ${pr_array[i]} " ]]; then
   elementi_comuni+=($pr_array);
   i++
 fi
done

echo ${elementi_comuni[*]}

va tolto il path iniziale per il confronto

#echo ${pr_array[2]}
#echo ${l10n_italy_array[3]}
