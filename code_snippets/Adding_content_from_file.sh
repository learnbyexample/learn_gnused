## Append entire file using r

cat ip.txt

cat fav_color.txt

sed '/red/r ip.txt' fav_color.txt

text='good\tone\nfood\tpun'

echo "$text" | sed '1r /dev/stdin' ip.txt

seq 2 | sed '2r /dev/stdin' ip.txt

printf '123' | sed '1r /dev/stdin' ip.txt

sed '0r ip.txt' greeting.txt

items='    * blue\n    * green\n'

printf '%b' "$items" | sed -e '2 {r /dev/stdin' -e 'd}' ip.txt

sed -e '/yellow/r ip.txt' -e '//,/^red/d' fav_color.txt

## Insert file using e and cat

sed '/red/e cat ip.txt' fav_color.txt

## Append line by line using R

sed '/red/R ip.txt' fav_color.txt

seq 4 | sed 'R /dev/stdin' fav_color.txt

