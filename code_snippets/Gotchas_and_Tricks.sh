## Shell quoting

echo 'a sunny day' | sed s/sunny day/cloudy day/

echo 'a sunny day' | sed 's/sunny day/cloudy evening/'

echo 'User name: ' | sed 's/$/$USER/'

echo 'User name: ' | sed "s/$/$USER/"

word='at'

printf 'sea\neat\ndrop\n' | sed "/${word}/!d"

printf 'sea\neat\ndrop\n' | sed '/'"${word}"'/!d'

## Escaping metacharacters

printf 'path\n' | sed 's/$/: '"$HOME"'/'

printf 'path\n' | sed 's|$|: '"$HOME"'|'

## Options at the end of the command

printf 'boat\nsite\nfoot\n' | sed -n 's/[aeo]+t/(&)/p'

printf 'boat\nsite\nfoot\n' | sed -n 's/[aeo]+t/(&)/p' -E

echo 'hi hello' > -dash.txt

sed 's/hi/HI/' -dash.txt

sed -- 's/hi/HI/' -dash.txt

rm -- -dash.txt

## DOS style line endings

printf 'hi there\r\ngood day\r\n' | sed -E 's/\w+$/123/'

printf 'hi there\r\ngood day\r\n' | sed -E 's/\w+(\r?)$/123\1/'

printf 'good,bad,42,24\n' | sed -E 's/([^,]+),([^,]+)/\2,\1/g'

printf 'good,bad,42,24\r\n' | sed -E 's/([^,]+),([^,]+)/\2,\1/g'

## No newline at the end of the last input line

printf 'sea\neat\ndrop' | grep -v 'at'

printf 'sea\neat\ndrop' | sed '/at/d'

## Command grouping and -e option

seq 3 | sed '2{s/^/*/; a hi}'

seq 3 | sed -e '2{s/^/*/; a hi' -e '}'

## Longest match wins

s='food land bark sand band cue combat'

echo "$s" | sed 's/foo.*ba/X/'

echo "$s" | perl -pe 's/foo.*?ba/X/'

echo '{52} apples and {31} mangoes' | sed 's/{.*}/42/g'

echo '{52} apples and {31} mangoes' | sed 's/{[^}]*}/42/g'

## Empty matches with * quantifier

echo '42,,,,,hello,bye,,,hi' | sed 's/,*/,/g'

echo '42,,,,,hello,bye,,,hi' | sed -E 's/,+/,/g'

## BRE vs ERE

echo '52 apples and 31234 mangoes' | sed 's/[0-9]+/[&]/g'

echo '52 apples and 31234 mangoes' | sed 's/[0-9]\+/[&]/g'

echo 'get {} set' | sed 's/\{\}/[]/'

echo 'get {} set' | sed 's/{}/[]/'

## Using online regexp tools

echo '1,,,two,,3' | sed -E 's/,\K(?=,)/NA/g'

echo '1,,,two,,3' | perl -pe 's/,\K(?=,)/NA/g'

echo '52 apples and 31234 mangoes' | sed -E 's/\d+/[&]/g'

echo '52 apples and 31234 mangoes' | perl -pe 's/\d+/[$&]/g'

## End of line matching

printf 'food bark \n1234 6789\t\n'

printf 'food bark \n1234 6789\t\n' | sed -E 's/\w+$/xyz/'

printf 'food bark \n1234 6789\t\n' | cat -A

printf 'food bark \n1234 6789\t\n' | sed -E 's/\w+\s*$/xyz/'

## Word boundary differences

echo 'I have 12, he has 2!' | sed 's/\b..\b/[&]/g'

echo 'I have 12, he has 2!' | sed 's/\<..\>/[&]/g'

echo 'hi log_42 12b' | sed 's/\b/:/g'

echo 'hi log_42 12b' | sed 's/\</:/g'

echo 'hi log_42 12b' | sed 's/\>/:/g'

## Filter and then substitute

printf '1423\n214\n   425\n' | sed -E 's/^\s*(.*42)/Error: \1/'

printf '1423\n214\n   425\n' | sed '/42/ s/^\s*/Error: /'

## Addressing input that only has a single line

printf '3.14\nhi\n42\n' | sed '1 s/^/start: /; $ s/$/ :end/'

echo '3.14' | sed '1 s/^/start: /; $ s/$/ :end/'

echo '3.14' | sed '1{s/^/start: /; b}; $ s/$/ :end/'

echo '3.14' | sed '${s/$/ :end/; b}; 1 s/^/start: /'

## Behavior of n and N commands at the end of input

printf 'red\nblue\ncredible\n' | sed '/red/{N; s/e.*e/2/}'

printf 'red\nblue\ncredible\n' | sed '/red/{$!N; s/e.*e/2/}'

## Faster execution for ASCII input

time sed -nE '/^([a-d][r-z]){3}$/p' words.txt > f1

time LC_ALL=C sed -nE '/^([a-d][r-z]){3}$/p' words.txt > f2

diff -s f1 f2

time sed -nE '/^([a-z]..)\1$/p' words.txt > f1

time LC_ALL=C sed -nE '/^([a-z]..)\1$/p' words.txt > f2

rm f[12]

## Substitution with ripgrep command

rg --passthru -N 'e' -r 'E' greeting.txt

s='food land bark sand band cue combat'

echo "$s" | rg --passthru 'foo.*?ba' -r 'X'

printf '42\nHi there\nHave a Nice Day' | rg --passthru -U '(?s)the.*ice' -r ''

printf '2.3/[4]*6\nfig\n5.3-[4]*9\n' | rg --passthru -F '[4]*' -r '2'

echo 'fox:αλεπού,eagle:αετός' | rg '\p{L}+' -r '($0)'

echo 'car bat cod map' | rg -Pw '(bat|map)(*SKIP)(*F)|\w+' -r '[$0]'

