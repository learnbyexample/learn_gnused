wget https://ftp.gnu.org/gnu/sed/sed-4.7.tar.xz

tar -Jxf sed-4.7.tar.xz

cd sed-4.7/

./configure 

make

sudo make install

type -a sed

sed --version | head -n1

man sed

sed --help

printf '1,2,3,4\na,b,c,d\n'

printf '1,2,3,4\na,b,c,d\n' | sed 's/,/-/'

printf '1,2,3,4\na,b,c,d\n' | sed 's/,/-/g'

cat greeting.txt

sed 's/day/weekend/' greeting.txt

sed 's/e/E/g' greeting.txt > out.txt

cat out.txt

