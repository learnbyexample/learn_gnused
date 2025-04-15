## Line Anchors

cat anchors.txt

sed -n '/^s/p' anchors.txt

sed -n '/rt$/p' anchors.txt

printf 'spared no one\npar\nspar\n' | sed 's/^par$/PAR/'

printf 'spared no one\npar\nspar\n' | sed 's/^/* /'

printf 'spared no one\npar\nspar\n' | sed '/ /! s/$/./'

## Word Anchors

cat anchors.txt

sed -n '/\bpar/p' anchors.txt

sed -n '/par\b/p' anchors.txt

sed -n 's/\bpar\b/***/p' anchors.txt

## Opposite Word Anchor

sed -n '/\Bpar\B/p' anchors.txt

sed -n '/\Bpar/p' anchors.txt

sed -n '/par\B/p' anchors.txt

echo 'copper' | sed 's/\b/:/g'

echo 'copper' | sed 's/\B/:/g'

## Alternation

sed -n '/two\|sub/p' anchors.txt

sed -nE '/two|sub/p' anchors.txt

echo 'cats dog bee parrot foxed' | sed -E 's/cat|dog|fox/--/g'

sed -nE '/\bpar\b|s$/p' anchors.txt

## Alternation precedence

echo 'cats dog bee parrot foxed' | sed -E 's/bee|parrot|at/--/'

echo 'cats dog bee parrot foxed' | sed -E 's/parrot|at|bee/--/'

echo 'spared party parent' | sed -E 's/spa|spared/**/g'

echo 'spared party parent' | sed -E 's/spared|spa/**/g'

echo 'spared party parent' | perl -pe 's/spa|spared/**/'

## Grouping

printf 'red\nreform\nread\ncrest\n' | sed -nE '/reform|rest/p'

printf 'red\nreform\nread\ncrest\n' | sed -nE '/re(form|st)/p'

sed -nE '/\bpar\b|\bpart\b/p' anchors.txt

sed -nE '/\b(par|part)\b/p' anchors.txt

sed -nE '/\bpar(|t)\b/p' anchors.txt

## Matching the metacharacters

printf 'a^2 + b^2 - C*3\nd = c^2' | sed -n '/b^2/p'

printf '$a = $b + $c\n$x = 4' | sed -n '/$b/p'

echo '$a = $b + $c' | sed 's/\$//g'

printf '(a/b) + c\n3 + (a/b) - c\n' | sed -n '/^(a\/b)/p'

printf '(a/b) + c\n3 + (a/b) - c\n' | sed -nE '/^\(a\/b\)/p'

## Using different delimiters

echo '/home/learnbyexample/reports' | sed 's/\/home\/learnbyexample\//~\//'

echo '/home/learnbyexample/reports' | sed 's#/home/learnbyexample/#~/#'

echo 'a/b/c/d' | sed 'y/a\/d/1-4/'

echo 'a/b/c/d' | sed 'y,a/d,1-4,'

printf '/home/joe/1\n/home/john/1\n'

printf '/home/joe/1\n/home/john/1\n' | sed -n '\;/home/joe/;p'

## The dot meta character

echo 'tac tin cot abc:tyz excited' | sed 's/c.t/-/g'

printf '42\t3500\n' | sed 's/.3.//'

printf 'abc\nxyz\n' | sed 'N; s/c.x/ /'

## Quantifiers

echo 'fed fold fe:d feeder' | sed -E 's/\bfe.?d\b/X/g'

sed -nE '/\bpart?\b/p' anchors.txt

echo 'par part parrot parent' | sed -E 's/par(ro)?t/X/g'

echo 'par part parrot parent' | sed -E 's/par(en|ro)?t/X/g'

echo 'apple \< fig ice < apple cream <' | sed -E 's/\\?</\\</g'

echo 'fd fed fod fe:d feeeeder' | sed 's/fe*d/X/g'

echo '3111111111125111142' | sed 's/1*2/-/g'

echo 'fd fed fod fe:d feeeeder' | sed -E 's/fe+d/X/g'

echo '3111111111125111142' | sed -E 's/1+4?2/-/g'

echo 'ac abc abbc abbbc abbbbbbbbc' | sed -E 's/ab{1,4}c/X/g'

echo 'ac abc abbc abbbc abbbbbbbbc' | sed -E 's/ab{3,}c/X/g'

echo 'ac abc abbc abbbc abbbbbbbbc' | sed -E 's/ab{,2}c/X/g'

echo 'ac abc abbc abbbc abbbbbbbbc' | sed -E 's/ab{3}c/X/g'

echo 'a{5} = 10' | sed -E 's/a\{5}/x/'

echo 'report_{a,b}.txt' | sed -E 's/_{a,b}/_c/'

echo 'report_{a,b}.txt' | sed -E 's/_\{a,b}/_c/'

## Conditional AND

echo 'Error: not a valid input' | sed -n '/Error.*valid/p'

echo 'two cats and a dog' | sed -E 's/cat.*dog|dog.*cat/pets/'

echo 'two dogs and a cat' | sed -E 's/cat.*dog|dog.*cat/pets/'

## Longest match wins

echo 'foot' | sed -E 's/f.?o/X/'

echo 'car bat cod map scat dot abacus' | sed 's/.*/X/'

echo 'fig123312apple' | sed -E 's/g(1|2|3)+(12apple)?/X/'

echo 'fig123312apple' | perl -pe 's/g(1|2|3)+(12apple)?/X/'

echo 'car bat cod map scat dot abacus' | sed 's/.*b/-/'

echo 'car bat cod map scat dot abacus' | sed 's/b.*t/-/'

echo 'car bat cod map scat dot abacus' | sed 's/b.*at/-/'

echo 'car bat cod map scat dot abacus' | sed 's/a.*m*/-/'

## Character classes

printf 'cute\ncat\ncot\ncoat\ncost\nscuttle\n' | sed -n '/c[ou]t/p'

printf 'meeting\ncute\nboat\nat\nfoot\n' | sed -n '/.[aeo]t/p'

echo 'no so in to do on' | sed 's/\b[sot][on]\b/X/g'

sed -nE '/^[on]{2,}$/p' words.txt

## Character class metacharacters

echo 'Sample123string42with777numbers' | sed -E 's/[0-9]+/-/g'

echo 'coat Bin food tar12 best' | sed -E 's/\b[a-z0-9]+\b/X/g'

echo 'road i post grip read eat pit' | sed -E 's/\b[p-z][a-z]*\b/X/g'

echo '23 154 12 26 34' | sed -E 's/\b[12][0-9]\b/X/g'

echo '0501 035 154 12 26 98234' | sed -E 's/\b0*[1-9][0-9]{2,}\b/X/g'

echo 'Sample123string42with777numbers' | sed -E 's/[^0-9]+/-/g'

echo 'apple:123:banana:cherry' | sed -E 's/(:[^:]+){2}$//'

echo 'I like "mango" and "guava"' | sed -E 's/"[^"]+"/X/g'

printf 'tryst\nfun\nglyph\npity\nwhy\n' | sed '/[aeiou]/d'

## Escape sequence sets

printf '%s\n' 'load;err_msg--\nant,r2..not' | sed -E 's/\W+/-/g'

printf 'hi  \v\f  there.\thave   \ra nice\t\tday\n' | sed -E 's/\s+/ /g'

printf '%s\n' 'w=y\x+9*3' | sed 's/[\w=]//g'

printf '%s\n' '42\d123' | sed -E 's/\d+/-/g'

printf '%s\n' '42\d123' | perl -pe 's/\d+/-/g'

## Named character sets

s='err_msg xerox ant m_2 P2 load1 eel'

echo "$s" | sed -E 's/\b[[:lower:]]+\b/X/g'

echo "$s" | sed -E 's/\b[[:lower:]_]+\b/X/g'

echo "$s" | sed -E 's/\b[[:alnum:]]+\b/X/g'

echo ',pie tie#ink-eat_42' | sed -E 's/[^[:punct:]]+//g'

## Matching character class metacharacters literally

echo 'ab-cd gh-c 12-423' | sed -E 's/[a-z-]{2,}/X/g'

printf 'int a[5]\nfig\n1+1=2\n' | sed -n '/[=]]/p'

printf 'int a[5]\nfig\n1+1=2\n' | sed -n '/[]=]/p'

echo 'int a[5]' | sed -n '/[x[.y]/p'

echo 'int a[5]' | sed -n '/[x[y.]/p'

echo 'f*(a^b) - 3*(a+b)/(a-b)' | sed 's/a[+^]b/c/g'

## Escape sequences

printf 'apple\tbanana\tcherry\n' | sed 's/\t/ /g'

echo 'a b c' | sed 's/ /\t/g'

printf 'a\t\r\fb\vc\n' | sed -E 's/[\t\v\f\r]+/:/g'

echo "universe: '42'" | sed 's/\x27/"/g'

echo 'universe: "42"' | sed 's/"/\x27/g'

printf 'cute\ncot\ncat\ncoat\n' | sed -n '/\x5eco/p'

echo 'hello world' | sed 's/.*/"&"/'

echo 'hello world' | sed 's/.*/"\x26"/'

## Backreferences

echo 'effort flee facade oddball rat tool' | sed -E 's/\w*(\w)\1\w*/X/g'

printf '%s\n' '\[\] and \\w and \[a-zA-Z0-9\_\]' | sed -E 's/(\\?)\\/\1/g'

echo 'aa a a a 42 f_1 f_1 f_13.14' | sed -E 's/\b(\w+)( \1)+\b/\1/g'

sed -nE '/^([a-z]{3})..\1$/p' words.txt

echo 'one,2,3.14,42' | sed -E 's/^([^,]+).*/&,\1/'

echo 'hello world' | sed 's/.*/"&"/'

echo 'hello world' | sed 's/.*/Hi. &. Have a nice day/'

echo 'one,2,3.14,42' | sed -E 's/^(([^,]+,){2})([^,]+)/\u\1"\3"/'

s='tryst,fun,glyph,pity,why,group'

echo "$s" | sed -E 's/\b\w+\b|(\b[gp]\w*y\w*\b)/\1/g'

echo "$s" | sed -E 's/(\b[gp]\w*y\w*\b)|\b\w+\b/\1/g'

echo 'apple and fig' | sed 's/and/[&]/'

echo 'apple and fig' | sed 's/and/[\&]/'

echo 'apple and fig' | sed 's/and/\\/'

## Known Bugs

sed -nE '/^(\w*(\w)\2\w*){2}$/p' words.txt | head -n5

sed -nE '/^\w*(\w)\1\w*(\w)\2\w*$/p' words.txt | head -n5

echo 'cocoa' | sed -nE '/(\bco){2}/p'

echo 'cocoa' | sed -nE '/\bco\bco/p'

echo 'it line with it here sit too' | sed -E 's/with(.*\bit\b){2}/XYZ/'

echo 'it line with it here sit too' | sed -E 's/with.*\bit\b.*\bit\b/XYZ/'

echo 'it line with it here sit too' | sed -E 's/with(.*\<it\>){2}/XYZ/'

echo 'it line with it here it too' | sed -E 's/with(.*\<it\>){2}/XYZ/'

echo 'it line with it here it too sit' | sed -E 's/with(.*\<it\>){2}/XYZ/'

