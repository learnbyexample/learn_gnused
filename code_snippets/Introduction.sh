## Installation

wget https://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz

tar -Jxf sed-4.8.tar.xz

cd sed-4.8/

./configure 

make

sudo make install

type -a sed

sed --version | head -n1

## Documentation and options overview

man sed

sed --help

## Editing standard input

printf '1,2,3,4\na,b,c,d\n'

printf '1,2,3,4\na,b,c,d\n' | sed 's/,/-/'

printf '1,2,3,4\na,b,c,d\n' | sed 's/,/-/g'

## Editing file input

cat greeting.txt

sed 's/day/weekend/' greeting.txt

sed 's/e/E/g' greeting.txt > out.txt

cat out.txt

