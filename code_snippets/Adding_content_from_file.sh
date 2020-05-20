## r for entire file

cat ip.txt

cat fav_colors.txt

sed '/red/r ip.txt' fav_colors.txt

text='good\tone\nfood\tpun'

echo "$text" | sed '1r /dev/stdin' ip.txt

seq 2 | sed '2r /dev/stdin' ip.txt

printf '123' | sed '1r /dev/stdin' ip.txt

items='    * blue\n    * green\n'

printf '%b' "$items" | sed -e '2 {r /dev/stdin' -e 'd}' ip.txt

sed -e '/^red/r ip.txt' -e '/yellow/,//d' fav_colors.txt

## Using e and cat command

sed '/red/e cat ip.txt' fav_colors.txt

text='good\tone\nfood\tpun'

echo "$text" | sed '1e cat /dev/stdin' ip.txt

## R for line by line

sed '/red/R ip.txt' fav_colors.txt

seq 4 | sed 'R /dev/stdin' fav_colors.txt

