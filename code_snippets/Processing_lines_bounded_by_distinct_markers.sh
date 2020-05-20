## Uniform markers

cat uniform.txt

sed -n '/start/,/end/p' uniform.txt

sed -n '/start/,/end/{//! s/^/* /p}' uniform.txt

sed -n '/start/,/end/{/end/!p}' uniform.txt

sed -n '/start/,/end/{/start/!p}' uniform.txt

sed '/start/,/end/d; s/$/./' uniform.txt

sed '/start/,/end/{//!d}' uniform.txt

sed '/start/,/end/{/start/!d}' uniform.txt

sed '/start/,/end/{/end/!d}' uniform.txt

## Extracting first or last group

sed -n '/start/,/end/{p; /end/q}' uniform.txt

sed -n '/start/,/end/{//!p; /end/q}' uniform.txt

tac uniform.txt | sed -n '/end/,/start/{p; /start/q}' | tac

## Broken groups

cat log.txt

sed -n '/warning/,/error/p' log.txt

tac log.txt | sed -n '/error/,/warning/p' | tac

