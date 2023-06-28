## Case insensitive matching

printf 'Cat\ncOnCaT\nscatter\ncot\n' | sed -n '/cat/p'

printf 'Cat\ncOnCaT\nscatter\ncot\n' | sed -n '/cat/Ip'

printf 'Cat\ncOnCaT\nscatter\ncot\n' | sed 's/cat/dog/I'

## Changing case in the replacement section

echo 'hello there. how are you?' | sed 's/\b\w/\u&/g'

echo 'HELLO THERE. HOW ARE YOU?' | sed 's/\b\w/\l&/g'

echo '_fig aug_price next_line' | sed -E 's/([a-z])_([a-z])/\1\u\2/g'

echo 'HaVE a nICe dAy' | sed 's/.*/\L&/'

echo 'HaVE a nICe dAy' | sed 's/.*/\U&/'

echo 'fig_ aug_price next_line' | sed -E 's/([a-z]+)(_[a-z]+)/\U\1\E\2/g'

echo 'HeLLo:bYe gOoD:beTTEr' | sed -E 's/([a-z]+)(:[a-z]+)/\L\1\U\2/Ig'

echo 'HeLLo:bYe gOoD:beTTEr' | sed -E 's/[a-z]+/\L\u&/Ig'

echo 'HeLLo:bYe gOoD:beTTEr' | sed -E 's/[a-z]+/\U\l&/Ig'

## Global replace

printf '1,2,3,4\na,b,c,d\n' | sed 's/,/-/'

printf '1,2,3,4\na,b,c,d\n' | sed 's/,/-/g'

## Replace specific occurrences

s='apple:banana:cherry:fig:mango'

echo "$s" | sed 's/:/---/2'

echo "$s" | sed -E 's/[^:]+/"&"/2'

echo "$s" | sed 's/:/---/3'

echo "$s" | sed -E 's/[^:]+/"&"/3'

s='car,art,pot,tap,urn,ray,ear'

echo "$s" | sed -E 's/(.*),/\1[]/'

echo "$s" | sed -E 's/(.*),(.*,)/\1[]\2/'

echo "$s" | sed -E 's/(.*),((.*,){3})/\1[]\2/'

s='apple:banana:cherry:fig:mango'

echo "$s" | sed -E 's/:/---/2g'

echo "$s" | sed -E 's/:/---/4g'

s='car,art,pot,tap,urn,ray,ear'

echo "$s" | sed 's/,/[]/3; s/,/[]/2'

echo "$s" | sed 's/,/[]/5; s/,/[]/3; s/,/[]/2'

## Print flag

echo 'hi there. have a nice day' | sed -n 's/xyz/XYZ/p'

echo 'hi there. have a nice day' | sed -n 's/\bh/H/pg'

## Write to a file

seq 20 | sed -n 's/3/three/w 3.txt'

cat 3.txt

printf '1,2,3,4\na,b,c,d\n' | sed 's/,/:/gw cols.txt'

cat cols.txt

seq 20 | sed -n -e 's/5/five/w 5.txt' -e 's/7/seven/w 7.txt'

cat 5.txt

cat 7.txt

sed -i 's/three/3/w /dev/stdout' 3.txt

cat 3.txt

## Executing external commands

printf 'Date:\nreplace this line\n'

printf 'Date:\nreplace this line\n' | sed 's/^replace.*/date/e'

printf 'Date:\nreplace this line\n' | sed -n 's/^replace.*/date/ep'

printf 'Date:\nreplace this line\n' | sed -n 's/^replace.*/date/pe'

echo 'xyz 5' | sed 's/xyz/seq/e'

printf 'date\ndate -I\n' | sed '/date/e'

printf 'date\ndate -I\n' | sed '2e'

printf 'show\nexample\n' | sed '/am/e seq 2'

## Multiline mode

printf 'Hi there\nHave a Nice Day\n' | sed 'N; s/H.*e/X/'

printf 'Hi there\nHave a Nice Day\n' | sed 'N; s/H.*e/X/gm'

printf 'Hi there\nHave a Nice Day\n' | sed 'N; s/^/* /g'

printf 'Hi there\nHave a Nice Day\n' | sed 'N; s/$/./g'

printf 'Hi there\nHave a Nice Day\n' | sed 'N; s/^/* /gm'

printf 'Hi there\nHave a Nice Day\n' | sed 'N; s/$/./gm'

printf 'Hi there\nHave a Nice Day\n' | sed 'N; s/\`/* /gm'

printf 'Hi there\nHave a Nice Day\n' | sed "N; s/\'/./gm"

printf 'Hi there\nHave a Nice Day\n' | sed -E 'N; s/H(\s|\S)*e/X/m'

printf 'Hi there\nHave a Nice Day\n' | sed -E 'N; s/H(.*\n.*)*e/X/m'

