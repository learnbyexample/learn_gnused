# Exercise solutions

Exercise related files are available from [exercises folder](https://github.com/learnbyexample/learn_gnused/tree/master/exercises)

<br>

# Introduction

**a)** Replace `5` with `five` for the given stdin source.

```bash
$ echo 'They ate 5 apples' | sed 's/5/five/'
They ate five apples
```

**b)** Replace all occurrences of `0xA0` with `0x50` and `0xFF` with `0x7F` for the given input file.

```bash
$ cat hex.txt
start address: 0xA0, func1 address: 0xA0
end address: 0xFF, func2 address: 0xB0

$ sed 's/0xA0/0x50/g' hex.txt | sed 's/0xFF/0x7F/g'
start address: 0x50, func1 address: 0x50
end address: 0x7F, func2 address: 0xB0
```

**c)** The substitute command searches and replaces sequences of characters. When you need to map one or more characters with another set of corresponding characters, you can use the `y` command. Quoting from the manual:

>**y/src/dst/** Transliterate any characters in the pattern space which match any of the source-chars with the corresponding character in dest-chars.

Use the `y` command to transform the given input string to get the output string as shown below.

```bash
$ echo 'goal new user sit eat dinner' | sed 'y/aeiou/AEIOU/'
gOAl nEw UsEr sIt EAt dInnEr
```

<br>

# In-place file editing

**a)** For the input file `text.txt`, replace all occurrences of `in` with `an` and write back the changes to `text.txt` itself. The original contents should get saved to `text.txt.orig`

```bash
$ cat text.txt
can ran want plant
tin fin fit mine line
$ sed -i.orig 's/in/an/g' text.txt

$ cat text.txt
can ran want plant
tan fan fit mane lane
$ cat text.txt.orig
can ran want plant
tin fin fit mine line
```

**b)** For the input file `text.txt`, replace all occurrences of `an` with `in` and write back the changes to `text.txt` itself. Do not create backups for this exercise. Note that you should have solved the previous exercise before starting this one.

```bash
$ cat text.txt
can ran want plant
tan fan fit mane lane
$ sed -i 's/an/in/g' text.txt

$ cat text.txt
cin rin wint plint
tin fin fit mine line
$ diff text.txt text.txt.orig
1c1
< cin rin wint plint
---
> can ran want plant
```

**c)** For the input file `copyright.txt`, replace `copyright: 2018` with `copyright: 2019` and write back the changes to `copyright.txt` itself. The original contents should get saved to `2018_copyright.txt.bkp`

```bash
$ cat copyright.txt
bla bla 2015 bla
blah 2018 blah
bla bla bla
copyright: 2018
$ sed -i'2018_*.bkp' 's/copyright: 2018/copyright: 2019/' copyright.txt

$ cat copyright.txt
bla bla 2015 bla
blah 2018 blah
bla bla bla
copyright: 2019
$ cat 2018_copyright.txt.bkp
bla bla 2015 bla
blah 2018 blah
bla bla bla
copyright: 2018
```

**d)** In the code sample shown below, two files are created by redirecting output of `echo` command. Then a `sed` command is used to edit `b1.txt` in-place as well as create a backup named `bkp.b1.txt`. Will the `sed` command work as expected? If not, why?

```bash
$ echo '2 apples' > b1.txt
$ echo '5 bananas' > -ibkp.txt
$ sed -ibkp.* 's/2/two/' b1.txt
```

Unquoted strings on the command line are subjected to shell interpretation. So, `-ibkp.*` will get expanded as `-ibkp.txt` (as there exists a file whose name starts with `-ibkp.`). This results in back up filename as `b1.txtbkp.txt` (because `bkp.txt` will be treated as the suffix to be added to input file `b1.txt`). The correct usage is `sed -i'bkp.*' 's/2/two/' b1.txt` to get `bkp.b1.txt` as the back up filename.

<br>

# Selective editing

**a)** Remove only the third line of given input.

```bash
$ seq 34 37 | sed '3d'
34
35
37
```

**b)** Display only fourth, fifth, sixth and seventh lines for the given input.

```bash
$ seq 65 78 | sed -n '4,7p'
68
69
70
71
```

**c)** For the input file `addr.txt`, replace all occurrences of `are` with `are not` and `is` with `is not` only from line number **4** till end of file. Also, only the lines that were changed should be displayed in the output.

```bash
$ cat addr.txt
Hello World
How are you
This game is good
Today is sunny
12345
You are funny

$ sed -n '4,$ {s/are/are not/gp; s/is/is not/gp}' addr.txt
Today is not sunny
You are not funny
```

**d)** Use `sed` to get the output shown below for the given input. You'll have to first understand the logic behind input to output transformation and then use commands introduced in this chapter to construct a solution.

```bash
$ # or: sed -n '2~5{p; n; n; p}'
$ seq 15 | sed -n 'n; p; n; n; p; n'
2
4
7
9
12
14
```

**e)** For the input file `addr.txt`, display all lines from start of the file till the first occurrence of `game`.

```bash
$ sed '/game/q' addr.txt
Hello World
How are you
This game is good
```

**f)** For the input file `addr.txt`, display all lines that contain `is` but not `good`.

```bash
$ sed -n '/is/{/good/!p}' addr.txt
Today is sunny
```

**g)** See [Gotchas and Tricks](../gnu_sed.md#gotchas-and-tricks) chapter and correct the command to get the output as shown below.

```bash
$ # wrong output
$ seq 11 | sed 'N; N; s/\n/-/g'
1-2-3
4-5-6
7-8-9
10
11

$ # expected output
$ seq 11 | sed 'N; $!N; s/\n/-/g'
1-2-3
4-5-6
7-8-9
10-11
```

**h)** For the input file `addr.txt`, add line numbers in the format as shown below.

```bash
$ sed '=' addr.txt
1
Hello World
2
How are you
3
This game is good
4
Today is sunny
5
12345
6
You are funny
```

**i)** For the input file `addr.txt`, print all lines that contain `are` and the line that comes after such a line, if any.

```bash
$ sed -n '/are/,+1 p' addr.txt
How are you
This game is good
You are funny
```

**Bonus:** For the above input file, will `sed -n '/is/,+1 p' addr.txt` produce identical results as `grep -A1 'is' addr.txt`? If not, why?

No. `sed` will not try to match `is` in the context lines whereas `grep` will match the search term in the context lines as well.

**j)** Print all lines if their line numbers follow the sequence `1, 15, 29, 43, etc` but not if the line contains `4` in it.

```bash
$ seq 32 100 | sed -n '1~14 {/4/!p}'
32
60
88
```

<br>

# BRE/ERE Regular Expressions

**a)** For the given input, print all lines that start with `den` or end with `ly`.

```bash
$ lines='lovely\n1 dentist\n2 lonely\neden\nfly away\ndent\n'
$ printf '%b' "$lines" | sed -nE '/^den|ly$/p'
lovely
2 lonely
dent
```

**b)** Replace all occurrences of `42` with `[42]` unless it is at the edge of a word. Note that **word** in these exercises have same meaning as defined in regular expressions.

```bash
$ echo 'hi42bye nice421423 bad42 cool_42a 42c' | sed 's/\B42\B/[&]/g'
hi[42]bye nice[42]1[42]3 bad42 cool_[42]a 42c
```

**c)** Add `[]` around words starting with `s` and containing `e` and `t` in any order.

```bash
$ words='sequoia subtle exhibit asset sets tests site'
$ echo "$words" | sed -E 's/\bs\w*(e\w*t|t\w*e)\w*/[&]/g'
sequoia [subtle] exhibit asset [sets] tests [site]
```

**d)** Replace all whole words with `X` that start and end with the same word character.

```bash
$ echo 'oreo not a _a2_ roar took 22' | sed -E 's/\b(\w|(\w)\w*\2)\b/X/g'
X not X X X took X
```

**e)** Replace all occurrences of `[4]|*` with `2`

```bash
$ echo '2.3/[4]|*6 foo 5.3-[4]|*9' | sed 's/\[4]|\*/2/g'
2.3/26 foo 5.3-29
```

**f)** `sed -nE '/\b[a-z](on|no)[a-z]\b/p'` is same as `sed -nE '/\b[a-z][on]{2}[a-z]\b/p'`. True or False? Sample input shown below might help to understand the differences, if any.

False. `[on]{2}` will also match `oo` and `nn`.

```bash
$ printf 'known\nmood\nknow\npony\ninns\n'
known
mood
know
pony
inns
```

**g)** Print all lines that start with `hand` and ends with no further character or `s` or `y` or `le`.

```bash
$ lines='handed\nhand\nhandy\nunhand\nhands\nhandle\n'
$ printf '%b' "$lines" | sed -nE '/^hand([sy]|le)?$/p'
hand
handy
hands
handle
```

**h)** Replace `42//5` or `42/5` with `8` for the given input.

```bash
$ echo 'a+42//5-c pressure*3+42/5-14256' | sed -E 's#42//?5#8#g'
a+8-c pressure*3+8-14256
```

**i)** For the given quantifiers, what would be the equivalent form using `{m,n}` representation?

* `?` is same as `{,1}`
* `*` is same as `{0,}`
* `+` is same as `{1,}`

**j)** True or False? In ERE, `(a*|b*)` is same as `(a|b)*` 

False. Because `(a*|b*)` will match only sequences like `a`, `aaa`, `bb`, `bbbbbbbb`. But `(a|b)*` can match a mixed sequence like `ababbba` too.

**k)** For the given input, construct two different REGEXPs to get the outputs as shown below.

```bash
$ # delete from '(' till next ')'
$ echo 'a/b(division) + c%d() - (a#(b)2(' | sed 's/([^)]*)//g'
a/b + c%d - 2(

$ # delete from '(' till next ')' but not if there is '(' in between
$ echo 'a/b(division) + c%d() - (a#(b)2(' | sed 's/([^()]*)//g'
a/b + c%d - (a#2(
```

**l)** For the input file `anchors.txt`, convert **markdown** anchors to corresponding **hyperlinks**.

```bash
$ cat anchors.txt
# <a name="regular-expressions"></a>Regular Expressions
## <a name="subexpression-calls"></a>Subexpression calls
## <a name="the-dot-meta-character"></a>The dot meta character

$ sed -E 's|[^"]+"([^"]+)"></a>(.+)|[\2](#\1)|' anchors.txt
[Regular Expressions](#regular-expressions)
[Subexpression calls](#subexpression-calls)
[The dot meta character](#the-dot-meta-character)
```

**m)** Replace the space character that occurs after a word ending with `a` or `r` with a newline character.

```bash
$ echo 'area not a _a2_ roar took 22' | sed -E 's/([ar])\b /\1\n/g'
area
not a
_a2_ roar
took 22
```

**n)** Surround all whole words with `()`. Additionally, if the whole word is `imp` or `ant`, delete them. Can you do it with single substitution?

```bash
$ words='tiger imp goat eagle ant important'
$ echo "$words" | sed -E 's/\b(imp|ant|(\w+))\b/(\2)/g'
(tiger) () (goat) (eagle) () (important)
```

<br>

# Flags

**a)** For the input file `para.txt`, remove all groups of lines marked with a line beginning with `start` and a line ending with `end`. Match both these markers case insensitively.

```bash
$ cat para.txt
good start
Start working on that
project you always wanted
to, do not let it end
hi there
start and try to
finish the End
bye

$ sed '/^start/I,/end$/I d' para.txt
good start
hi there
bye
```

**b)** The given sample input below starts with one or more `#` characters followed by one or more whitespace characters and then some words. Convert such strings to corresponding output as shown below.

```bash
$ echo '# Regular Expressions' | sed -E 's/^#+\s+(.+)/\L\1/; y/ /-/'
regular-expressions
$ echo '## Compiling regular expressions' | sed -E 's/^#+\s+(.+)/\L\1/; y/ /-/'
compiling-regular-expressions
```

**c)** Using the input file `para.txt`, create a file named `five.txt` with all lines that contain a whole word of length **5** and a file named `six.txt` with all lines that contain a whole word of length **6**.

```bash
$ sed -nE -e '/\b\w{5}\b/w five.txt' -e '/\b\w{6}\b/w six.txt' para.txt

$ cat five.txt
good start
Start working on that
hi there
start and try to
$ cat six.txt
project you always wanted
finish the End
```

**d)** Given sample strings have fields separated by `,` where field values can be empty as well. Use `sed` to replace the third field with `42`.

```bash
$ echo 'lion,,ant,road,neon' | sed 's/[^,]*/42/3'
lion,,42,road,neon

$ echo ',,,' | sed 's/[^,]*/42/3'
,,42,
```

**e)** Replace all occurrences of `e` with `3` except the first two matches.

```bash
$ echo 'asset sets tests site' | sed 's/e/3/3g'
asset sets t3sts sit3

$ echo 'sample item teem eel' | sed 's/e/3/3g'
sample item t33m 33l
```

**f)** For the input file `addr.txt`, replace all input lines with number of characters in those lines. `wc -L` is one of the ways to get length of a line as shown below.

```bash
$ # note that newline character isn't counted, which is preferable here
$ echo "Hello World" | wc -L
11

$ sed 's/.*/echo "&" | wc -L/e' addr.txt
11
11
17
14
5
13
```

**g)** For the input file `para.txt`, assume that it'll always have lines in multiples of 4. Use `sed` commands such that there are 4 lines at a time in the pattern space. Then, delete from `start` till `end` provided `start` is matched only at the start of a line. Also, match these two keywords case insensitively.

```bash
$ sed -E 'N;N;N; s/^start(\s|\S)*end//Im' para.txt
good start

hi there

bye
```

**h)** For the given strings, replace last but third `so` with `X`. Only print the lines which are changed by the substitution.

```bash
$ printf 'so and so also sow and soup\n' | sed -nE 's/(.*)so((.*so){3})/\1X\2/p'
so and X also sow and soup

$ printf 'sososososososo\nso and so\n' | sed -nE 's/(.*)so((.*so){3})/\1X\2/p'
sososoXsososo
```

**i)** Display all lines that satisfies **both** of these conditions:

* `professor` matched irrespective of case
* `quip` or `this` matched case sensitively

Input is a file downloaded from internet as shown below.

```bash
$ wget https://www.gutenberg.org/files/345/345.txt -O dracula.txt

$ sed -nE '/professor/I{/quip|this/p}' dracula.txt
equipment of a professor of the healing craft. When we were shown in,
should be. I could see that the Professor had carried out in this room,
"Not up to this moment, Professor," she said impulsively, "but up to
and sprang at us. But by this time the Professor had gained his feet,
this time the Professor had to ask her questions, and to ask them pretty
```

<br>

# Shell substitutions

**a)** Replace `#expr#` with value of `usr_ip` shell variable. Assume that this variable can only contain the metacharacters as shown in the sample below.

```bash
$ usr_ip='c = (a/b) && (x-5)'
$ mod_ip=$(echo "$usr_ip" | sed 's|[/&]|\\&|g')
$ echo 'Expression: #expr#' | sed 's/#expr#/'"$mod_ip"'/'
Expression: c = (a/b) && (x-5)
```

**b)** Repeat previous exercise, but this time with command substitution instead of using temporary variable.

```bash
$ usr_ip='c = (a/b/y) && (x-5)'
$ echo 'Expression: #expr#' | sed 's/#expr#/'"$(echo "$usr_ip" | sed 's|[/&]|\\&|g')"'/'
Expression: c = (a/b/y) && (x-5)
```

<br>

# z, s and f command line options

**a)** Replace any character other than word characters and `.` character with `_` character for the sample filenames shown below.

```bash
$ mkdir test_dir && cd $_
$ touch 'file with spaces.txt' $'weird$ch\nars.txt' '!f@oo.txt'
$ # > at start of line indicates continuation of multiline shell command
$ for file in *; do
>   new_name=$(printf '%s' "$file" | sed -z 's/[^a-z0-9_.]/_/Ig')
>   mv "$file" "$new_name"
> done

$ ls
file_with_spaces.txt  _f_oo.txt  weird_ch_ars.txt
$ cd .. && rm -r test_dir
```

**b)** Print only the third line, if any, from these input files: `addr.txt`, `para.txt` and `copyright.txt`

```bash
$ sed -sn '3p' addr.txt para.txt copyright.txt
This game is good
project you always wanted
bla bla bla
```

**c)** For the input file `hex.txt`, use content from `replace.txt` to perform search and replace operations. Each line in `replace.txt` starts with the search term, followed by a space and then followed by the replace term. Assume that these terms do not contain any `sed` metacharacters.

```bash
$ cat hex.txt
start address: 0xA0, func1 address: 0xA0
end address: 0xFF, func2 address: 0xB0
$ cat replace.txt
0xA0 0x5000
0xB0 0x6000
0xFF 0x7000

$ sed -f <(sed -E 's|(.+) (.+)|s/\1/\2/g|' replace.txt) hex.txt
start address: 0x5000, func1 address: 0x5000
end address: 0x7000, func2 address: 0x6000
```

<br>

# append, change, insert

**a)** For the input file `addr.txt`, print only the third line and surround it with `-----`

```bash
$ sed -n -e '3 {i-----' -e 'p; a-----' -e '}' addr.txt
-----
This game is good
-----
```

**b)** For the input file `addr.txt`, replace all lines starting from a line containing `you` till end of file with content as shown below.

```bash
$ sed '/you/,$ c\\nHave a nice day' addr.txt
Hello World

Have a nice day
```

**c)** Replace every even numbered line with `---`

```bash
$ seq 0 5 | sed 'n; c---'
0
---
2
---
4
---
```

<br>

# Adding content from file

**a)** Replace third to fifth lines of input file `addr.txt` with second to fourth lines from file `para.txt`

```bash
$ sed -n '2,4p' para.txt | sed -e '5r /dev/stdin' -e '3,5d' addr.txt
Hello World
How are you
Start working on that
project you always wanted
to, do not let it end
You are funny
```

**b)** Add one line from `hex.txt` after every two lines of `copyright.txt`

```bash
$ sed 'n; R hex.txt' copyright.txt
bla bla 2015 bla
blah 2018 blah
start address: 0xA0, func1 address: 0xA0
bla bla bla
copyright: 2019
end address: 0xFF, func2 address: 0xB0
```

**c)** For every line of the input file `hex.txt`, insert `---` before the line and add one line from `replace.txt` after the line as shown below.

```bash
$ sed -e 'R replace.txt' -e 'i---' hex.txt
---
start address: 0xA0, func1 address: 0xA0
0xA0 0x5000
---
end address: 0xFF, func2 address: 0xB0
0xB0 0x6000
```

**d)** Insert the contents of `hex.txt` file before a line matching `0x6000` of the input file `replace.txt`.

```bash
$ sed '/0x6000/e cat hex.txt' replace.txt 
0xA0 0x5000
start address: 0xA0, func1 address: 0xA0
end address: 0xFF, func2 address: 0xB0
0xB0 0x6000
0xFF 0x7000
```

<br>

# Control structures

**a)** Using the input file `para.txt`, create a file named `markers.txt` with all lines that contain `start` or `end` (matched case insensitively) and a file named `rest.txt` with rest of the lines.

```bash
$ sed -nE -e '/start|end/I{w markers.txt' -e 'b}' -e 'w rest.txt' para.txt

$ cat markers.txt 
good start
Start working on that
to, do not let it end
start and try to
finish the End
$ cat rest.txt 
project you always wanted
hi there
bye
```

**b)** For the input file `addr.txt`:

* if line contains `e`, surround all consecutive repeated characters with `{}` as well as uppercase those characters
* if line doesn't contain `e` but contains `u`, surround all uppercase letters in that line with `[]`

```bash
$ # note that H in second line and Y in last line isn't modified
$ sed -E '/e/ {s/(.)\1/{\U&}/g; b}; /u/ s/[A-Z]/[&]/g' addr.txt
He{LL}o World
How are you
This game is g{OO}d
[T]oday is sunny
12345
You are fu{NN}y
```

**c)** The given sample strings below has multiple fields separated by a space. The first field has numbers separated by `-` character. Surround these numbers in first field with `[]`

```bash
$ echo '123-87-593 42-3 foo' | sed -E ':a s/^((\[[0-9]+\]-)*)?([0-9]+)/\1[\3]/; ta'
[123]-[87]-[593] 42-3 foo

$ echo '53783-0913 hi 3 4-2' | sed -E ':a s/^((\[[0-9]+\]-)*)?([0-9]+)/\1[\3]/; ta'
[53783]-[0913] hi 3 4-2
```

**d)** Convert the contents of `headers.txt` such that it matches the content of `anchors.txt`. The input file `headers.txt` contains one header per line, starting with one or more `#` character followed by a space character and then followed by the heading. You have to convert this heading into anchor tag as shown by the contents of `anchors.txt`.

```bash
$ cat headers.txt
# Regular Expressions
## Subexpression calls
## The dot meta character
$ cat anchors.txt
# <a name="regular-expressions"></a>Regular Expressions
## <a name="subexpression-calls"></a>Subexpression calls
## <a name="the-dot-meta-character"></a>The dot meta character

$ sed -E 's|\w.*|<a name="\L&\E"></a>&|; :a s/("[^"]+) ([^"]+")/\1-\2/; ta' headers.txt > out.txt
$ diff -s out.txt anchors.txt
Files out.txt and anchors.txt are identical
```

<br>

# Processing lines bounded by distinct markers

**a)** For the input file `broken.txt`, print all lines between the markers `top` and `bottom`. The first `sed` command shown below doesn't work because `sed` will match till end of file if second address isn't found.

```bash
$ cat broken.txt
top
3.14
bottom
top
1234567890
bottom
top
Hi there
Have a nice day
Good bye

$ # wrong output
$ sed -n '/top/,/bottom/ {//!p}' broken.txt
3.14
1234567890
Hi there
Have a nice day
Good bye

$ # expected output
$ tac broken.txt | sed -n '/bottom/,/top/ {//!p}' | tac
3.14
1234567890
```

**b)** For the input file `addr.txt`, replace the lines occurring between the markers `How` and `12345` with contents of the file `hex.txt`. 

```bash
$ sed -e '/How/r hex.txt' -e '//,/12345/{//!d}' addr.txt
Hello World
How are you
start address: 0xA0, func1 address: 0xA0
end address: 0xFF, func2 address: 0xB0
12345
You are funny
```

