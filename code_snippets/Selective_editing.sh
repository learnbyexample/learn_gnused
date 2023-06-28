## REGEXP filtering

printf '1,2,3,4\na,b,c,d\n' | sed '/2/ s/,/-/g'

printf '1,2,3,4\na,b,c,d\n' | sed '/2/! s/,/-/g'

## Delete command

printf 'sea\neat\ndrop\n' | sed '/at/d'

printf 'sea\neat\ndrop\n' | sed '/at/!d'

sed '!d' greeting.txt

## Print command

cat rhymes.txt

sed -n '/warm/p' rhymes.txt

sed -n '/n t/p' rhymes.txt

sed -n 's/warm/cool/gp' rhymes.txt

sed -n '/the/ s/ark/ARK/gp' rhymes.txt

printf 'sea\neat\ndrop\n' | sed -n '/at/!p'

seq 2 | sed 'p'

## Quit commands

sed '/say/q' rhymes.txt

sed '/say/Q' rhymes.txt

tac rhymes.txt | sed '/an/q' | tac

printf 'sea\neat\ndrop\n' | sed '/at/q2'

echo $?

printf 'sea\neat\ndrop\n' | sed '/at/Q3'

echo $?

## Multiple commands

printf 'sea\neat\ndrop\n' | sed -n -e 'p' -e 's/at/AT/p'

printf 'sea\neat\ndrop\n' | sed -n 'p; s/at/AT/p'

sed -n '
/the/ s/ark/ARK/gp
s/warm/cool/gp
s/Bread/Cake/gp
' rhymes.txt

sed -ne '/play/p' -e '/ark/p' rhymes.txt

printf 'gates\nnot\nused\n' | sed '/e/{s/s/*/g; s/t/*/g}'

sed -n '/the/{s/for/FOR/gp; /play/{p; s/park/PARK/gp}}' rhymes.txt

sed -n '/ark/{/play/p}' rhymes.txt

sed -n '/the/{/for/{/urn/p}}' rhymes.txt

sed -n '/for/{/sky/!p}' rhymes.txt

## Line addressing

sed -n '3p' rhymes.txt

sed -n '2p; 6p' rhymes.txt

printf 'gates\nnot\nused\n' | sed '2 s/t/*/g'

sed -n '$p' rhymes.txt

seq 3542 4623452 | sed -n '2452{p; q}'

seq 3542 4623452 | sed -n '250p; 2452{p; q}'

time seq 3542 4623452 | sed -n '2452{p; q}' > f1

time seq 3542 4623452 | sed -n '2452p' > f2

rm f1 f2

seq 23 45 | sed '5q'

## Print only the line number

grep -n 'the' rhymes.txt

sed -n '/the/=' rhymes.txt

sed -n '/what/{=; p}' rhymes.txt

sed -n '/what/{p; =}' rhymes.txt

## Address range

sed -n '/to/,/pl/p' rhymes.txt

seq 15 24 | sed '3,8d'

sed -n '6,/utter/p' rhymes.txt

sed '/play/,$d' rhymes.txt

sed -n '/Banana/,/XYZ/p' rhymes.txt

sed -n '/w/,/w/p' rhymes.txt

sed -n '7,/Cherry/p' rhymes.txt

sed -n '0,/cozy/p' rhymes.txt

sed -n '0,/say/p' rhymes.txt

## Relative addressing

sed -n '/the/,+1p' rhymes.txt

sed -n '6,+2p' rhymes.txt

seq 10 | sed -n '2~2p'

seq 7 | sed '2~4d'

seq 10 | sed -n '2,~4p'

seq 10 | sed -n '5,~4p'

sed -n '/many/,~3p' rhymes.txt

## n and N commands

seq 10 | sed -n 'n; p'

printf 'gates\nnot\nused\n' | sed '/t/{n; s/t/TTT/g}'

seq 7 | sed 'N; s/\n/:/'

printf 'gates\nnot\nused\n' | sed '/at/{N; s/s\nnot/d/}'

