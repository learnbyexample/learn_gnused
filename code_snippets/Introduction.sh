## Installation

wget https://ftp.gnu.org/gnu/sed/sed-4.9.tar.xz

tar -Jxf sed-4.9.tar.xz

cd sed-4.9/

./configure

make

sudo make install

sed --version | head -n1

## Documentation

man sed

## Options overview

sed --help

## Editing standard input

printf '1,2,3,4\na,b,c,d\n'

printf '1,2,3,4\na,b,c,d\n' | sed 's/,/-/'

printf '1,2,3,4\na,b,c,d\n' | sed 's/,/-/g'

printf '42\n' | file -

printf '42\r\n' | file -

## Editing file input

cat greeting.txt

sed 's/day/weekend/' greeting.txt

sed 's/e/E/g' greeting.txt > out.txt

cat out.txt

