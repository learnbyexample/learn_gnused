## Basic usage

seq 3 | sed '2a hello'

seq 5 | sed '/[24]/c hello'

seq 3 | sed '2i hello'

seq 5 | sed '2,4i hi there!'

seq 5 | sed '2,4c hi there!'

seq 5 | sed '2,4 s/.*/hi there!/'

## Escape sequences

seq 3 | sed '2c rat\tdog\nwolf'

seq 3 | sed '2a fruit: \x27mango\x27'

seq 3 | sed '2c         hello'

seq 3 | sed '2c\         hello'

seq 3 | sed '2c\nhi'

seq 3 | sed '2c\\nhi'

## Multiple commands

seq 4 | sed '2c hi ; 3a bye'

seq 3 | sed '2{s/^/*/; a hi}'

seq 4 | sed -e '2c hi' -e '3a bye'

seq 3 | sed '2{s/^/*/; a hi
}'

## Shell substitution

text='good\tone\nfood\tpun'

seq 13 15 | sed '2c'"$text"

seq 13 15 | sed '3i'"$(date +%A)"

seq 13 15 | sed '3i'"$(printf 'hi\n123')"

seq 13 15 | sed '3i'"$(printf 'hi\ns/5/five/')"

