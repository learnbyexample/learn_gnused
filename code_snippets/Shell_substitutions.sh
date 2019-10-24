start=5; step=1

sed -n "${start},+${step}p" programming_quotes.txt

step=4

sed -n "${start},+${step}p" programming_quotes.txt

word='at'

printf 'sea\neat\ndrop\n' | sed "/${word}/!d"

printf 'sea\neat\ndrop\n' | sed '/'"${word}"'/!d'

echo 'home path is:' | sed 's/$/ '"${HOME}"'/'

echo 'home path is:' | sed 's|$| '"${HOME}"'|'

home=${HOME//\//\\/}

echo 'home path is:' | sed 's/$/ '"${home}"'/'

c='&'

echo 'a and b and c' | sed 's/and/'"${c}"'/g'

c1=${c//&/\\&}

echo 'a and b and c' | sed 's/and/'"${c1}"'/g'

echo 'today is date.' | sed 's/date/'"$(date -I)"'/'

printf 'f1.txt\nf2.txt\n' | sed 's|^|'"$(pwd)"'/|'

p=$(pwd | sed 's|/|\\/|g')

printf 'f1.txt\nf2.txt\n' | sed 's/^/'"${p}"'\//'

echo '123' | sed 's/2/'"$(seq 5)"'/'

