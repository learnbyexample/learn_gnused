## With backup

cat colors.txt

sed -i.bkp 's/blue/green/' colors.txt

cat colors.txt

cat colors.txt.bkp

## Without backup

cat fruits.txt

sed -i 's/an/AN/g' fruits.txt

cat fruits.txt

## Multiple files

cat f1.txt

cat f2.txt

sed -i.bkp 's/bad/good/' f1.txt f2.txt

ls f?.*

cat f1.txt

cat f2.txt

## Prefix backup name

ls *colors*

sed -i'bkp.*' 's/green/yellow/' colors.txt

ls *colors*

## Place backups in different directory

mkdir backups

sed -i'backups/*' 's/good/nice/' f1.txt f2.txt

ls backups/

