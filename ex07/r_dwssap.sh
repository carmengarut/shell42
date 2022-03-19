#!/bin/bash
cat /etc/passwd | sed "/^[[:blank:]]*#/d" | sed "s/#.*//g" | sed -n "n;p" | sed "s/:.*//g" | rev | sort -r | awk 'NR>= ENVIRON["FT_LINE1"] && NR<= ENVIRON["FT_LINE2"]' | tr "\n" "," | sed "s/, */, /g" | sed "s/.$//g" | sed "s/.\{2\}$//g" | sed "s/$/_./g" | tr -d "\n"
