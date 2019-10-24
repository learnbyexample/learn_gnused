cat nums.txt

sed '/^-/{s///; b}; s/^/-/' nums.txt

sed '/^-/ s///; t; s/^/-/' nums.txt

echo '12345 hello42' | sed -E ':a s/^(\**)[0-9]/\1*/; ta'

echo '123x45 hello42' | sed -E ':a s/^(\**)[0-9]/\1*/; ta'

echo 'hi 12345 hello42' | sed -E ':a s/^(\**)[0-9]/\1*/; ta'

echo 'he be me,1 2 3 4,nice slice' | sed -E ':b s/^([^,]*,[^ ,]*) /\1_/; tb'

echo '1,,,two,,3' | sed 's/,,/,NA,/g'

echo '1,,,two,,3' | sed -E ':c s/,,/,NA,/g; tc'

echo 'coffining' | sed 's/fin//'

echo 'coffining' | sed 's/fin//; s///'

echo 'coffining' | sed ':d s/fin//; td'

