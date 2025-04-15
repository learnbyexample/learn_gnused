## Variable substitution

start=6; step=1

sed -n "${start},+${step}p" rhymes.txt

step=3

sed -n "${start},+${step}p" rhymes.txt

word='at'

printf 'sea\neat\ndrop\n' | sed "/${word}/!d"

printf 'sea\neat\ndrop\n' | sed '/'"${word}"'/!d'

echo 'home path is:' | sed 's/$/ '"${HOME}"'/'

echo 'home path is:' | sed 's|$| '"${HOME}"'|'

home=${HOME//\//\\/}

echo 'home path is:' | sed 's/$/ '"${home}"'/'

## Escaping metacharacters

c='&'

echo 'a and b and c' | sed 's/and/['"${c}"']/g'

c1=${c//&/\\&}

echo 'a and b and c' | sed 's/and/['"${c1}"']/g'

r='a/b&c\d'

r=$(printf '%s' "$r" | sed 's#[\&/]#\\&#g')

s='{[(\ta^b/d).*+?^$|]}'

s=$(printf '%s' "$s" | sed 's#[{[()^$*?+.\|/]#\\&#g')

printf '%s\n' 'f*{[(\ta^b/d).*+?^$|]} - 3' | sed -E 's/'"$s"'/'"$r"'/g'

s='{[(\ta^b/d).*+?^$|]}'

s=$(printf '%s' "$s" | sed 's#[[^$*.\/]#\\&#g')

printf '%s\n' 'f*{[(\ta^b/d).*+?^$|]} - 3' | sed 's/'"$s"'/'"$r"'/g'

## Command substitution

echo 'today is date.' | sed 's/date/'"$(date -I)"'/'

printf 'f1.txt\nf2.txt\n' | sed 's|^|'"$(pwd)"'/|'

p=$(pwd | sed 's|/|\\/|g')

printf 'f1.txt\nf2.txt\n' | sed 's/^/'"${p}"'\//'

printf 'a\n[x]\nb\n' | sed 's/x/'"$(seq 3)"'/'

printf 'a\n[x]\nb\n' | sed 's/x/'"$(seq 3 | sed '$!s/$/\\/' )"'/'

