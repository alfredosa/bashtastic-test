# Shell Problems

## Ackowledgements

Thansk to [The Linux Documentation Project](https://www.tldp.org/) for providing the problems 🫀 Go in there and learn some bash 😃

## Test your results

Once finished with your scripts and problems below, run 
```bash 
make test
```

and check your score! 🎉🚀

## 1 Self-reproducing Script

Write a script that backs itself up, that is, copies itself to a file named ```backup.sh``` inside a folder called ```backups```.
Hint: Use the cat command and the appropriate positional parameter.

EXTRA point if you use the name of the shell script: ```backup_{sript_name}.sh```
## 2 Home Directory Listing

Perform a recursive directory listing on the user's home directory and save the information to a file. Compress the file, have the script prompt the user to insert a USB flash drive, then press ENTER.

The output should be in a directory called listings and the test expects 2 files:
```listings/homedir.txt```
```listings/homedir.txt.gz```

## 3 Converting for loops to while and until loops

Convert the for loops in this script to while loops. 

```bash

#!/bin/bash
# Listing the planets.

for planet in Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto
do
  echo $planet  # Each planet on a separate line.
done

echo; echo

for planet in "Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto"
    # All planets on same line.
    # Entire 'list' enclosed in quotes creates a single variable.
    # Why? Whitespace incorporated into the variable.
do
  echo $planet
done

echo; echo "Whoops! Pluto is no longer a planet!"

exit 0
```
Hint: store the data in an array and step through the array elements.

Having already done the "heavy lifting," now convert the loops in the example to until loops.

## 4 Changing the line spacing of a text file
Write a script that reads each line of a target file, then writes the line back to stdout, but with an extra blank line following. This has the effect of double-spacing the file.

Include all necessary code to check whether the script gets the necessary command-line argument (a filename), and whether the specified file exists.

When the script runs correctly, modify it to triple-space the target file.

Finally, write a script to remove all blank lines from the target file, single-spacing it.

## 5 Backwards Listing
Write a script that echoes itself to stdout, but backwards.
