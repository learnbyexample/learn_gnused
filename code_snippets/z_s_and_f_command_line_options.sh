## NUL separated lines

printf 'earn xerox\0at\nmare\npart\0learn eye\n' | sed -nz '/are/p'

printf 'earn xerox\0at\nmare\npart\0learn eye\n' | sed -nz '/are/p' | od -c

printf 'earn xerox\0at\nmare\npart\0learn eye\n' | sed -nz '/eye/p' | od -c

printf 'cater\ndog\ncoat\ncutter\nmat\n' | sed -z 's/\nc/;&/g'

## Separate files

sed '1F' cols.txt 5.txt

sed -s '1F' cols.txt 5.txt

## File as source of sed commands

cat sample.txt

cat word_mapping.sed

sed -f word_mapping.sed sample.txt

sed -E -f word_mapping.sed sample.txt

type sed

cat executable.sed

chmod +x executable.sed

./executable.sed sample.txt

