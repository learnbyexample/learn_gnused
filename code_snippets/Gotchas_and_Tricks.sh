echo 'a sunny day' | sed s/sunny day/cloudy day/

echo 'a sunny day' | sed 's/sunny day/cloudy evening/'

echo 'User name: ' | sed 's/$/$USER/'

echo 'User name: ' | sed "s/$/$USER/"

word='at'

printf 'sea\neat\ndrop\n' | sed "/${word}/!d"

printf 'sea\neat\ndrop\n' | sed '/'"${word}"'/!d'

printf 'home\n' | sed 's/$/: '"$HOME"'/'

printf 'home\n' | sed 's|$|: '"$HOME"'|'

printf 'boat\nsite\nfoot\n' > temp.txt

sed -n '/[aeo]+t/p' temp.txt

sed -n '/[aeo]+t/p' temp.txt -E

echo 'hi hello' > -dash.txt

sed 's/hi/HI/' -dash.txt

sed -- 's/hi/HI/' -dash.txt

rm -- -dash.txt

printf 'hi there\r\ngood day\r\n' | sed -E 's/\w+$/123/'

printf 'hi there\r\ngood day\r\n' | sed -E 's/\w+(\r?)$/123\1/'

printf 'good,bad,42,24\n' | sed -E 's/([^,]+),([^,]+)/\2,\1/g'

printf 'good,bad,42,24\r\n' | sed -E 's/([^,]+),([^,]+)/\2,\1/g'

printf 'sea\neat\ndrop' | grep -v 'at'

printf 'sea\neat\ndrop' | sed '/at/d'

seq 3 | sed '2{s/^/*/; a hi}'

seq 3 | sed '2{s/^/*/; a hi' -e '}'

seq 3 | sed -e '2{s/^/*/; a hi' -e '}'

s='food land bark sand band cue combat'

echo "$s" | sed 's/foo.*ba/X/'

echo "$s" | perl -pe 's/foo.*?ba/X/'

echo '{52} apples and {31} mangoes' | sed 's/{.*}/42/g'

echo '{52} apples and {31} mangoes' | sed 's/{[^}]*}/42/g'

echo '42,,,,,hello,bye,,,hi' | sed 's/,*/,/g'

echo '42,,,,,hello,bye,,,hi' | sed -E 's/,+/,/g'

echo '52 apples and 31234 mangoes' | sed 's/[0-9]+/[&]/g'

echo '52 apples and 31234 mangoes' | sed 's/[0-9]\+/[&]/g'

echo 'get {} set' | sed 's/\{\}/[]/'

echo 'get {} set' | sed 's/{}/[]/'

echo '1,,,two,,3' | sed -E 's/,\K(?=,)/NA/g'

echo '1,,,two,,3' | perl -pe 's/,\K(?=,)/NA/g'

echo '52 apples and 31234 mangoes' | sed -E 's/\d+/[&]/g'

echo '52 apples and 31234 mangoes' | perl -pe 's/\d+/[$&]/g'

printf 'food bark \n1234 6789\t\n'

printf 'food bark \n1234 6789\t\n' | sed -E 's/\w+$/xyz/'

printf 'food bark \n1234 6789\t\n' | cat -A

printf 'food bark \n1234 6789\t\n' | sed -E 's/\w+\s*$/xyz/'

echo 'I have 12, he has 2!' | sed 's/\b..\b/[&]/g'

echo 'I have 12, he has 2!' | sed 's/\<..\>/[&]/g'

echo 'hi log_42 12b' | sed 's/\b/:/g'

echo 'hi log_42 12b' | sed 's/\</:/g'

echo 'hi log_42 12b' | sed 's/\>/:/g'

printf '1423\n214\n   425\n' | sed -E 's/^\s*(.*42)/Error: \1/'

printf '1423\n214\n   425\n' | sed '/42/ s/^\s*/Error: /'

printf '3.14\nhi\n42\n' | sed '1 s/^/start: /; $ s/$/ :end/'

echo '3.14' | sed '1 s/^/start: /; $ s/$/ :end/'

echo '3.14' | sed '1{s/^/start: /; b}; $ s/$/ :end/'

echo '3.14' | sed '${s/$/ :end/; b}; 1 s/^/start: /'

printf 'red\nblue\ncredible\n' | sed '/red/{N; s/e.*e/2/}'

printf 'red\nblue\ncredible\n' | sed '/red/{$!N; s/e.*e/2/}'

time sed -nE '/^([a-d][r-z]){3}$/p' /usr/share/dict/words > f1

time LC_ALL=C sed -nE '/^([a-d][r-z]){3}$/p' /usr/share/dict/words > f2

diff -s f1 f2

time sed -nE '/^([a-z]..)\1$/p' /usr/share/dict/words > f1

time LC_ALL=C sed -nE '/^([a-z]..)\1$/p' /usr/share/dict/words > f2

rm f[12]

rg --passthru -N 'e' -r 'E' greeting.txt

s='food land bark sand band cue combat'

echo "$s" | rg --passthru 'foo.*?ba' -r 'X'

printf '42\nHi there\nHave a Nice Day' | rg --passthru -U '(?s)the.*ice' -r ''

printf '2.3/[4]*6\nfoo\n5.3-[4]*9\n' | rg --passthru -F '[4]*' -r '2'

echo 'fox:αλεπού,eagle:αετός' | rg '\p{L}+' -r '($0)'

echo 'car bat cod map' | rg -P '(bat|map)(*SKIP)(*F)|\w+' -r '[$0]'

