# Exercises

>![info](../images/info.svg) For solutions, see [Exercise_solutions.md](https://github.com/learnbyexample/learn_gnused/blob/master/exercises/Exercise_solutions.md).

<br>

# Introduction

**1)** Replace only the first occurrence of `5` with `five` for the given stdin source.

```bash
$ echo 'They ate 5 apples and 5 mangoes' | sed ##### add your solution here
They ate five apples and 5 mangoes
```

**2)** Replace all occurrences of `5` with `five`.

```bash
$ echo 'They ate 5 apples and 5 mangoes' | sed ##### add your solution here
They ate five apples and five mangoes
```

**3)** Replace all occurrences of `0xA0` with `0x50` and `0xFF` with `0x7F` for the given input file.

```bash
$ cat hex.txt
start address: 0xA0, func1 address: 0xA0
end address: 0xFF, func2 address: 0xB0

$ sed ##### add your solution here
start address: 0x50, func1 address: 0x50
end address: 0x7F, func2 address: 0xB0
```

**4)** The substitute command searches and replaces sequences of characters. When you need to map one or more characters with another set of corresponding characters, you can use the `y` command. Quoting from the manual:

>**y/src/dst/** Transliterate any characters in the pattern space which match any of the source-chars with the corresponding character in dest-chars.

Use the `y` command to transform the given input string to get the output string as shown below.

```bash
$ echo 'goal new user sit eat dinner' | sed ##### add your solution here
gOAl nEw UsEr sIt EAt dInnEr
```

**5)** Why does the following command produce an error? How'd you fix it?

```bash
$ echo 'a sunny day' | sed s/sunny day/cloudy day/
sed: -e expression #1, char 7: unterminated `s' command

# expected output
$ echo 'a sunny day' | sed ##### add your solution here
a cloudy day
```

<br>

# In-place file editing

**1)** For the input file `text.txt`, replace all occurrences of `in` with `an` and write back the changes to `text.txt` itself. The original contents should get saved to `text.txt.orig`

```bash
$ cat text.txt
can ran want plant
tin fin fit mine line
$ sed ##### add your solution here

$ cat text.txt
can ran want plant
tan fan fit mane lane
$ cat text.txt.orig
can ran want plant
tin fin fit mine line
```

**2)** For the input file `text.txt`, replace all occurrences of `an` with `in` and write back the changes to `text.txt` itself. Do not create backups for this exercise. Note that you should have solved the previous exercise before starting this one.

```bash
$ cat text.txt
can ran want plant
tan fan fit mane lane
$ sed ##### add your solution here

$ cat text.txt
cin rin wint plint
tin fin fit mine line
$ diff text.txt text.txt.orig
1c1
< cin rin wint plint
---
> can ran want plant
```

**3)** For the input file `copyright.txt`, replace `copyright: 2018` with `copyright: 2019` and write back the changes to `copyright.txt` itself. The original contents should get saved to `2018_copyright.txt.bkp`

```bash
$ cat copyright.txt
bla bla 2015 bla
blah 2018 blah
bla bla bla
copyright: 2018
$ sed ##### add your solution here

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

**4)** In the code sample shown below, two files are created by redirecting the output of the `echo` command. Then a `sed` command is used to edit `b1.txt` in-place as well as create a backup named `bkp.b1.txt`. Will the `sed` command work as expected? If not, why?

```bash
$ echo '2 apples' > b1.txt
$ echo '5 bananas' > -ibkp.txt
$ sed -ibkp.* 's/2/two/' b1.txt
```

**5)** For the input file `pets.txt`, remove the first occurrence of `I like ` from each line and write back the changes to `pets.txt` itself. The original contents should get saved with the same filename inside the `bkp` directory. Assume that you do not know whether `bkp` exists or not in the current working directory.

```bash
$ cat pets.txt
I like cats
I like parrots
I like dogs

##### add your solution here

$ cat pets.txt
cats
parrots
dogs
$ cat bkp/pets.txt
I like cats
I like parrots
I like dogs
```

<br>

# Selective editing

**1)** For the given input, display except the third line.

```bash
$ seq 34 37 | sed ##### add your solution here
34
35
37
```

**2)** Display only the fourth, fifth, sixth and seventh lines for the given input.

```bash
$ seq 65 78 | sed ##### add your solution here
68
69
70
71
```

**3)** For the input file `addr.txt`, replace all occurrences of `are` with `are not` and `is` with `is not` only from line number **4** till the end of file. Also, only the lines that were changed should be displayed in the output.

```bash
$ cat addr.txt
Hello World
How are you
This game is good
Today is sunny
12345
You are funny

$ sed ##### add your solution here
Today is not sunny
You are not funny
```

**4)** Use `sed` to get the output shown below for the given input. You'll have to first understand the input to output transformation logic and then use commands introduced in this chapter to construct a solution.

```bash
$ seq 15 | sed ##### add your solution here
2
4
7
9
12
14
```

**5)** For the input file `addr.txt`, display all lines from the start of the file till the first occurrence of `is`.

```bash
$ sed ##### add your solution here
Hello World
How are you
This game is good
```

**6)** For the input file `addr.txt`, display all lines that contain `is` but not `good`.

```bash
$ sed ##### add your solution here
Today is sunny
```

**7)** `n` and `N` commands will not execute further commands if there are no more input lines to fetch. Correct the command shown below to get the expected output.

```bash
# wrong output
$ seq 11 | sed 'N; N; s/\n/-/g'
1-2-3
4-5-6
7-8-9
10
11

# expected output
$ seq 11 | sed ##### add your solution here
1-2-3
4-5-6
7-8-9
10-11
```

**8)** For the input file `addr.txt`, add line numbers in the format as shown below.

```bash
$ sed ##### add your solution here
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

**9)** For the input file `addr.txt`, print all lines that contain `are` and the line that comes after, if any.

```bash
$ sed ##### add your solution here
How are you
This game is good
You are funny
```

**Bonus:** For the above input file, will `sed -n '/is/,+1 p' addr.txt` produce identical results as `grep -A1 'is' addr.txt`? If not, why?

**10)** Print all lines if their line numbers follow the sequence 1, 15, 29, 43, etc but not if the line contains `4` in it.

```bash
$ seq 32 100 | sed ##### add your solution here
32
60
88
```

**11)** For the input file `sample.txt`, display from the start of the file till the first occurrence of `are`, excluding the matching line.

```bash
$ cat sample.txt
Hello World

Hi there
How are you

Just do-it
Believe it

banana
papaya
mango

Much ado about nothing
He he he
Adios amigo

$ sed ##### add your solution here
Hello World

Hi there
```

**12)** For the input file `sample.txt`, display from the last occurrence of `do` till the end of the file.

```bash
##### add your solution here
Much ado about nothing
He he he
Adios amigo
```

**13)** For the input file `sample.txt`, display from the 9th line till a line containing `go`.

```bash
$ sed ##### add your solution here
banana
papaya
mango
```

**14)** For the input file `sample.txt`, display from a line containing `it` till the next line number that is divisible by 3.

```bash
$ sed ##### add your solution here
Just do-it
Believe it

banana
```

**15)** Display only the odd numbered lines from `addr.txt`.

```bash
$ sed ##### add your solution here
Hello World
This game is good
12345
```

<br>

# BRE/ERE Regular Expressions

**1)** For the input file `patterns.txt`, display all lines that start with `den` or end with `ly`.

```bash
$ sed ##### add your solution here
2 lonely
dent
lovely
```

**2)** For the input file `patterns.txt`, replace all occurrences of `42` with `[42]` unless it is at the edge of a word. Display only the modified lines.

```bash
$ sed ##### add your solution here
Hi[42]Bye nice1[42]3 bad42
eqn2 = pressure*3+42/5-1[42]56
cool_[42]a 42fake
_[42]_
```

**3)** For the input file `patterns.txt`, add `[]` around words starting with `s` and containing `e` and `t` in any order. Display only the modified lines.

```bash
$ sed ##### add your solution here
[sets] tests Sauerkraut
[site] cite kite bite [store_2]
[subtle] sequoia
a [set]
```

**4)** From the input file `patterns.txt`, display lines having the same first and last word character.

```bash
$ sed ##### add your solution here
Not a pip DOWN
y
1 dentist 1
_42_
```

**5)** For the input file `patterns.txt`, display lines containing `*[5]` literally.

```bash
$ sed ##### add your solution here
(9-2)*[5]
```

**6)** `sed -nE '/\b[a-z](on|no)[a-z]\b/p'` is same as `sed -nE '/\b[a-z][on]{2}[a-z]\b/p'`. True or False? Sample input shown below might help to understand the differences, if any.

```bash
$ printf 'known\nmood\nknow\npony\ninns\n'
known
mood
know
pony
inns
```

**7)** For the input file `patterns.txt`, display all lines starting with `hand` and ending immediately with `s` or `y` or `le` or no further characters.

```bash
$ sed ##### add your solution here
handle
handy
hands
hand
```

**8)** For the input file `patterns.txt`, replace `42//5` or `42/5` with `8`. Display only the modified lines.

```bash
$ sed ##### add your solution here
eqn3 = r*42-5/3+42///5-83+a
eqn1 = a+8-c
eqn2 = pressure*3+8-14256
```

**9)** For the given quantifiers, what would be the equivalent form using the `{m,n}` representation?

* `?` is same as
* `*` is same as
* `+` is same as

**10)** In ERE, `(a*|b*)` is same as `(a|b)*` — True or False?

**11)** For the input file `patterns.txt`, construct two different REGEXPs to get the outputs as shown below. Display only the modified lines.

```bash
# delete from '(' till next ')'
$ sed ##### add your solution here
a/b + c%d
*[5]
def factorial
12- *4)
Hi there. Nice day

# delete from '(' till next ')' but not if there is '(' in between
$ sed ##### add your solution here
a/b + c%d
*[5]
def factorial
12- (e+*4)
Hi there. Nice day(a
```

**12)** For the input file `anchors.txt`, convert markdown anchors to corresponding hyperlinks as shown below.

```bash
$ cat anchors.txt
# <a name="regular-expressions"></a>Regular Expressions
## <a name="subexpression-calls"></a>Subexpression calls
## <a name="the-dot-meta-character"></a>The dot meta character

$ sed ##### add your solution here
[Regular Expressions](#regular-expressions)
[Subexpression calls](#subexpression-calls)
[The dot meta character](#the-dot-meta-character)
```

**13)** For the input file `patterns.txt`, replace the space character that occurs after a word ending with `a` or `r` with a newline character, only if the line also contains an uppercase letter. Display only the modified lines.

```bash
$ sed ##### add your solution here
par
car
tar
far
Cart
Not a
pip DOWN
```

**14)** Surround all whole words with `()`. Additionally, if the whole word is `imp` or `ant`, delete them. Can you do it with a single substitution?

```bash
$ words='tiger imp goat eagle ant important'
$ echo "$words" | sed ##### add your solution here
(tiger) () (goat) (eagle) () (important)
```

**15)** For the input file `patterns.txt`, display lines containing `car` but not as a whole word.

```bash
$ sed ##### add your solution here
scar
care
a huge discarded pile of books
scare
part cart mart
```

**16)** Will the ERE pattern `^a\w+([0-9]+:fig)?` match the same characters for the input `apple42:banana314` and `apple42:fig100`? If not, why not?

**17)** For the input file `patterns.txt`, display lines starting with `4` or `-` or `u` or `sub` or `care`.

```bash
$ sed ##### add your solution here
care
4*5]
-handy
subtle sequoia
unhand
```

**18)** For the given input string, replace all occurrences of digit sequences with only the unique non-repeating sequence. For example, `232323` should be changed to `23` and `897897` should be changed to `897`. If there are no repeats (for example `1234`) or if the repeats end prematurely (for example `12121`), it should not be changed.

```bash
$ s='1234 2323 453545354535 9339 11 60260260'
$ echo "$s" | sed ##### add your solution here
1234 23 4535 9339 1 60260260
```

**19)** Replace sequences made up of words separated by `:` or `.` by the first word of the sequence. Such sequences will end when `:` or `.` is not followed by a word character.

```bash
$ ip='wow:Good:2_two.five: hi-2 bye kite.777:water.'
$ echo "$ip" | sed ##### add your solution here
wow hi-2 bye kite
```

**20)** Replace sequences made up of words separated by `:` or `.` by the last word of the sequence. Such sequences will end when `:` or `.` is not followed by a word character.

```bash
$ ip='wow:Good:2_two.five: hi-2 bye kite.777:water.'
$ echo "$ip" | sed ##### add your solution here
five hi-2 bye water
```

**21)** Replace all whole words with `X` unless it is preceded by a `(` character.

```bash
$ s='guava (apple) berry) apple (mango) (grape'
$ echo "$s" | sed ##### add your solution here
X (apple) X) X (mango) (grape
```

**22)** Surround whole words with `[]` only if they are followed by `:` or `,` or `-`.

```bash
$ ip='Poke,on=-=so_good:ink.to/is(vast)ever2-sit'
$ echo "$ip" | sed ##### add your solution here
[Poke],on=-=[so_good]:ink.to/is(vast)[ever2]-sit
```

**23)** The `fields.txt` file has fields separated by the `:` character. Delete `:` and the last field if there is a digit character anywhere before the last field.

```bash
$ cat fields.txt
42:cat
twelve:a2b
we:be:he:0:a:b:bother
apple:banana-42:cherry:
dragon:unicorn:centaur

$ sed ##### add your solution here
42
twelve:a2b
we:be:he:0:a:b
apple:banana-42:cherry
dragon:unicorn:centaur
```

**24)** Are the commands `sed -n '/a^b/p'` and `sed -nE '/a^b/p'` equivalent?

**25)** What characters can be used as REGEXP delimiters?

<br>

# Flags

**1)** For the input file `para.txt`, remove all groups of lines marked with a line beginning with `start` and a line ending with `end`. Match both these markers case insensitively.

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

$ sed ##### add your solution here
good start
hi there
bye
```

**2)** The `headers.txt` file contains one header per line, starting with one or more `#` characters followed by one or more whitespace characters and then some words. Convert such lines to the corresponding output as shown below.

```bash
$ cat headers.txt
# Regular Expressions
## Subexpression calls
## The dot meta character

$ sed ##### add your solution here
regular-expressions
subexpression-calls
the-dot-meta-character
```

**3)** Using `para.txt`, create a file named `five.txt` with lines that contain a whole word of length **5** and a file named `seven.txt` with lines that contain a whole word of length **7**.

```bash
$ sed ##### add your solution here

$ cat five.txt
good start
Start working on that
hi there
start and try to

$ cat seven.txt
Start working on that
project you always wanted
```

**4)** Given sample strings have fields separated by `,` where field values can be empty as well. Use `sed` to replace the third field with `42`.

```bash
$ echo 'lion,,ant,road,neon' | sed ##### add your solution here
lion,,42,road,neon

$ echo ',,,' | sed ##### add your solution here
,,42,
```

**5)** Replace all occurrences of `e` with `3` except the first two matches.

```bash
$ echo 'asset sets tests site' | sed ##### add your solution here
asset sets t3sts sit3

$ echo 'sample item teem eel' | sed ##### add your solution here
sample item t33m 33l
```

**6)** For the input file `addr.txt`, replace all input lines with the number of characters in those lines. `wc -L` is one of the ways to get the length of a line as shown below. Assume that the input file doesn't have single or double quote characters.

```bash
# note that newline character isn't counted, which is preferable here
$ echo "Hello World" | wc -L
11

$ sed ##### add your solution here
11
11
17
14
5
13
```

**7)** For the input file `para.txt`, assume that it'll always have lines in multiples of 4. Use `sed` commands such that there are 4 lines at a time in the pattern space. Then, delete from `start` till `end` provided `start` is matched only at the start of a line. Also, match these two keywords case insensitively.

```bash
$ sed ##### add your solution here
good start

hi there

bye
```

**8)** For the input file `patterns.txt`, filter lines containing three or more occurrences of `ar`. For such lines, replace the third from last occurrence of `ar` with `X`.

```bash
$ sed ##### add your solution here
par car tX far Cart
pXt cart mart
```

**9)** Display lines from `sample.txt` that satisfy both of these conditions:

* `he` matched irrespective of case
* either `World` or `Hi` matched case sensitively

```bash
$ sed ##### add your solution here
Hello World
Hi there
```

**10)** For the input file `patterns.txt`, surround all hexadecimal sequences with a minimum of four characters with `[]`. Match `0x` as an optional prefix, but shouldn't be counted for determining the length. Match the characters case insensitively, and the sequences shouldn't be surrounded by other word characters. Display only the modified lines.

```bash
$ sed ##### add your solution here
"should not match [0XdeadBEEF]"
Hi42Bye nice1423 [bad42]
took 0xbad 22 [0x0ff1ce]
eqn2 = pressure*3+42/5-[14256]
```

<br>

# Shell substitutions

**1)** Replace `#expr#` with the value of the `usr_ip` shell variable. Assume that this variable can only contain the metacharacters as shown in the sample below.

```bash
$ usr_ip='c = (a/b) && (x-5)'
$ mod_ip=$(echo "$usr_ip" | sed ##### add your solution here)
$ echo 'Expression: #expr#' | sed ##### add your solution here
Expression: c = (a/b) && (x-5)
```

**2)** Repeat the previous exercise, but this time with command substitution instead of using a temporary variable.

```bash
$ usr_ip='c = (a/b/y) && (x-5)'
$ echo 'Expression: #expr#' | sed ##### add your solution here
Expression: c = (a/b/y) && (x-5)
```

<br>

# z, s and f command line options

**1)** Replace any character other than word and `.` characters with the `_` character for the sample filenames shown below.

```bash
$ mkdir test_dir && cd $_
$ touch 'file with spaces.txt' $'weird$ch\nars.txt' '!f@oo.txt'
# > at start of line indicates continuation of multiline shell command
$ for file in *; do
>   new_name=$(printf '%s' "$file" | sed ##### add your solution here)
>   mv "$file" "$new_name"
> done

$ ls
file_with_spaces.txt  _f_oo.txt  weird_ch_ars.txt
$ cd .. && rm -r test_dir
```

**2)** Print only the third line, if any, from these input files: `addr.txt`, `para.txt` and `copyright.txt`

```bash
$ sed ##### add your solution here
This game is good
project you always wanted
bla bla bla
```

**3)** For the input file `hex.txt`, use content from `replace.txt` to perform search and replace operations. Each line in `replace.txt` starts with the search term, followed by a space and then followed by the replace term. Assume that these terms do not contain any `sed` metacharacters.

```bash
$ cat hex.txt
start address: 0xA0, func1 address: 0xA0
end address: 0xFF, func2 address: 0xB0
$ cat replace.txt
0xA0 0x5000
0xB0 0x6000
0xFF 0x7000

##### add your solution here
start address: 0x5000, func1 address: 0x5000
end address: 0x7000, func2 address: 0x6000
```

**4)** For the input file `nul_separated`, use the ASCII NUL character as the *line* separator and display lines containing `fig`. Also, change NUL characters in the output to the newline character.

```bash
$ sed ##### add your solution here
apple
fig
mango
icecream
```

**5)** For the input file `addr.txt`, change a newline character that comes before an uppercase letter to `.` followed by a space character. Assume that the input file doesn't have ASCII NUL characters.

```bash
$ sed ##### add your solution here
Hello World. How are you. This game is good. Today is sunny
12345. You are funny
```

<br>

# append, change, insert

**1)** For the input file `addr.txt`, display the third line surrounded by `-----`.

```bash
$ sed ##### add your solution here
-----
This game is good
-----
```

**2)** For the input file `addr.txt`, replace all lines starting from a line containing `you` till the end of file with a blank line followed by `Have a nice day`.

```bash
$ sed ##### add your solution here
Hello World

Have a nice day
```

**3)** For the input file `addr.txt`, replace even numbered lines with `---`.

```bash
$ sed ##### add your solution here
Hello World
---
This game is good
---
12345
---
```

<br>

# Adding content from file

**1)** For the input file `addr.txt`, replace from the third to fifth lines with the second to fourth lines from `para.txt`.

```bash
$ sed ##### add your solution here
Hello World
How are you
Start working on that
project you always wanted
to, do not let it end
You are funny
```

**2)** Add one line from `hex.txt` after every two lines of `copyright.txt`.

```bash
$ sed ##### add your solution here
bla bla 2015 bla
blah 2018 blah
start address: 0xA0, func1 address: 0xA0
bla bla bla
copyright: 2019
end address: 0xFF, func2 address: 0xB0
```

**3)** For every line of the input file `hex.txt`, insert `---` before the line and append one line from `replace.txt` as shown below.

```bash
$ sed ##### add your solution here
---
start address: 0xA0, func1 address: 0xA0
0xA0 0x5000
---
end address: 0xFF, func2 address: 0xB0
0xB0 0x6000
```

**4)** Insert the contents of `hex.txt` before a line matching `0x6000` of the input file `replace.txt`.

```bash
$ sed ##### add your solution here
0xA0 0x5000
start address: 0xA0, func1 address: 0xA0
end address: 0xFF, func2 address: 0xB0
0xB0 0x6000
0xFF 0x7000
```

**5)** For the input file `addr.txt`, replace lines containing `are` with contents of `hex.txt`.

```bash
$ sed ##### add your solution here
Hello World
start address: 0xA0, func1 address: 0xA0
end address: 0xFF, func2 address: 0xB0
This game is good
Today is sunny
12345
start address: 0xA0, func1 address: 0xA0
end address: 0xFF, func2 address: 0xB0
```

**6)** The two commands shown below are equivalent. True or False?

```bash
sed '/are/r pets.txt' addr.txt

cat pets.txt | sed '/are/r /dev/stdin' addr.txt
```

**7)** What do the commands `sed '0r file1' file2` and `sed '0R file1' file2` do?

<br>

# Control structures

**1)** Using the input file `para.txt`, create a file named `markers.txt` with all lines that contain `start` or `end` (matched case insensitively) and a file named `rest.txt` with the remaining lines.

```bash
$ sed ##### add your solution here

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

**2)** For the input file `addr.txt`:

* if a line contains `e`, surround all consecutive repeated characters with `{}` as well as uppercase those characters
* else, if a line contains `u`, surround all uppercase letters in that line with `[]`

```bash
# note that H in the second line and Y in the last line aren't modified
$ sed ##### add your solution here
He{LL}o World
How are you
This game is g{OO}d
[T]oday is sunny
12345
You are fu{NN}y
```

**3)** The `nums.txt` file uses a space character as the field separator. The first field of some lines has one or more numbers separated by the `-` character. Surround such numbers in the first field with `[]` as shown below.

```bash
$ cat nums.txt
123-87-593 42-3 fig
apple 42-42-42 1000 banana 4-3
53783-0913 hi 3 4-2
1000 guava mango

$ sed ##### add your solution here
[123]-[87]-[593] 42-3 fig
apple 42-42-42 1000 banana 4-3
[53783]-[0913] hi 3 4-2
[1000] guava mango
```

**4)** Convert the contents of `headers.txt` such that it matches the content of `anchors.txt`. The input file `headers.txt` contains one header per line, starting with one or more `#` characters followed by a space character and then followed by the heading. You have to convert such headings into anchor tags as shown by the contents of `anchors.txt`. Save the output in `out.txt`.

```bash
$ cat headers.txt
# Regular Expressions
## Subexpression calls
## The dot meta character
$ cat anchors.txt
# <a name="regular-expressions"></a>Regular Expressions
## <a name="subexpression-calls"></a>Subexpression calls
## <a name="the-dot-meta-character"></a>The dot meta character

$ sed ##### add your solution here
$ diff -s out.txt anchors.txt
Files out.txt and anchors.txt are identical
```

**5)** What is the difference between `t` and `T` commands?

**6)** The `blocks.txt` file uses `%=%=` to separate group of lines. Display the first such group.

```bash
$ cat blocks.txt
%=%=
apple
banana
%=%=
3.14
42
1000
%=%=
brown
green
%=%=
hi
hello there
bye

$ sed ##### add your solution here
%=%=
apple
banana
```

<br>

# Processing lines bounded by distinct markers

**1)** The `blocks.txt` file uses `%=%=` to separate group of lines. Display the last such group.

```bash
##### add your solution here
%=%=
hi
hello there
bye
```

**2)** The `code.txt` file has code snippets that are surrounded by whole lines containing `%%Code: python%%` and `%%end%%`. The end of such snippets is always followed by an empty line. Assume that there will always be at least one line of code between the markers. Delete all such code snippets as well as the empty line that follows.

```bash
$ sed ##### add your solution here
H1: Introduction

REPL is a good way to learn Python for beginners.

H2: String methods

Python comes loaded with awesome methods.
Enjoy learning Python.

```

**3)** The `code.txt` file has code snippets that are surrounded by whole lines containing `%%Code: python%%` and `%%end%%`. Display the lines between such markers only for the first block.

```bash
$ sed ##### add your solution here
>>> 3 + 7
10
>>> 22 / 7
3.142857142857143
>>> 22 // 7
3
```

**4)** The input file `broken.txt` starts with a line containing `top` followed by some content before a line containing `bottom` is found. Blocks of lines bounded by these two markers repeats except for the last block as it is missing the `bottom` marker. The first `sed` command shown below doesn't work because it is matching till the end of file due to the missing marker. Correct this command to get the expected output shown below.

```bash
$ cat broken.txt
--top--
3.14
[bottom]
--top--
1234567890
[bottom]
--top--
Hi there
Have a nice day
Good bye

# wrong output
$ sed -n '/top/,/bottom/ {//!p}' broken.txt
3.14
1234567890
Hi there
Have a nice day
Good bye

# expected output
##### add your solution here
3.14
1234567890
```

**5)** For the input file `addr.txt`, replace the lines occurring between the markers `How` and `12345` with the contents of the file `hex.txt`.

```bash
$ sed ##### add your solution here
Hello World
How are you
start address: 0xA0, func1 address: 0xA0
end address: 0xFF, func2 address: 0xB0
12345
You are funny
```

