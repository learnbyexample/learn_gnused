printf '1,2,3,4\na,b,c,d\n' | sed '/2/ s/,/-/g'

printf '1,2,3,4\na,b,c,d\n' | sed '/2/! s/,/-/g'

printf 'sea\neat\ndrop\n' | sed '/at/d'

printf 'sea\neat\ndrop\n' | sed '/at/!d'

cat programming_quotes.txt

sed -n '/twice/p' programming_quotes.txt

sed -n '/e th/p' programming_quotes.txt

sed -n 's/1/one/gp' programming_quotes.txt

sed -n '/not/ s/in/**/gp' programming_quotes.txt

printf 'sea\neat\ndrop\n' | sed -n '/at/!p'

seq 2 | sed 'p'

sed '/if/q' programming_quotes.txt

sed '/if/Q' programming_quotes.txt

tac programming_quotes.txt | sed '/not/q' | tac

printf 'sea\neat\ndrop\n' | sed '/at/q2'

echo $?

printf 'sea\neat\ndrop\n' | sed '/at/Q3'

echo $?

printf 'sea\neat\ndrop\n' | sed -n -e 'p' -e 's/at/AT/p'

printf 'sea\neat\ndrop\n' | sed -n 'p; s/at/AT/p'

sed -n '
/not/ s/in/**/gp
s/1/one/gp
s/2/two/gp
' programming_quotes.txt

printf 'sea\neat\ndrop\n' | sed '/at/{p; s/at/AT/}'

printf 'gates\nnot\nused\n' | sed '/e/{s/s/*/g; s/t/*/g}'

sed -n '/in/{/not/p}' programming_quotes.txt

sed -n '/in/{/not/{/you/p}}' programming_quotes.txt

sed -n '/not/{/you/!p}' programming_quotes.txt

sed -n '3p' programming_quotes.txt

sed -n '2p; 5p' programming_quotes.txt

printf 'gates\nnot\nused\n' | sed '2 s/t/*/g'

sed -n '$p' programming_quotes.txt

seq 3542 4623452 | sed -n '2452{p; q}'

seq 3542 4623452 | sed -n '250p; 2452{p; q}'

time seq 3542 4623452 | sed -n '2452{p; q}' > f1

time seq 3542 4623452 | sed -n '2452p' > f2

seq 23 45 | sed '5q'

grep -n 'not' programming_quotes.txt

sed -n '/not/=' programming_quotes.txt

sed -n '/off/{=; p}' programming_quotes.txt

sed -n '/off/{p; =}' programming_quotes.txt

sed -n '/are/,/by/p' programming_quotes.txt

seq 15 24 | sed '3,8d'

sed -n '5,/use/p' programming_quotes.txt

sed '/smart/,$d' programming_quotes.txt

sed -n '/affect/,/XYZ/p' programming_quotes.txt

sed -n '9,/worth/p' programming_quotes.txt

sed -n '0,/in/p' programming_quotes.txt

sed -n '0,/not/p' programming_quotes.txt

sed -n '/not/,+2p' programming_quotes.txt

sed -n '5,+1p' programming_quotes.txt

seq 10 | sed -n '2~2p'

seq 7 | sed '2~4d'

seq 10 | sed -n '2,~4p'

seq 10 | sed -n '5,~4p'

sed -n '/regular/,~3p' programming_quotes.txt

seq 10 | sed -n 'n; p'

printf 'gates\nnot\nused\n' | sed '/t/{n; s/t/TTT/g}'

seq 7 | sed 'N; s/\n/:/'

printf 'gates\nnot\nused\n' | sed '/at/{N; s/s\nnot/d/}'

