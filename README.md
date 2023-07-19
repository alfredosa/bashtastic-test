# Shell Problems

## Self-reproducing Script

Write a script that backs itself up, that is, copies itself to a file named ```backup.sh``` inside a folder called ```backups```.
Hint: Use the cat command and the appropriate positional parameter.

EXTRA point if you use the name of the shell script: ```backup_{sript_name}.sh```
## Home Directory Listing

Perform a recursive directory listing on the user's home directory and save the information to a file. Compress the file, have the script prompt the user to insert a USB flash drive, then press ENTER.

The output should be in a directory called listings and the test expects 2 files:
```listings/homedir.txt```
```listings/homedir.txt.gz```

## Converting for loops to while and until loops

Convert the for loops in Example 11-1 to while loops. Hint: store the data in an array and step through the array elements.

Having already done the "heavy lifting," now convert the loops in the example to until loops.

## Changing the line spacing of a text file
Write a script that reads each line of a target file, then writes the line back to stdout, but with an extra blank line following. This has the effect of double-spacing the file.

Include all necessary code to check whether the script gets the necessary command-line argument (a filename), and whether the specified file exists.

When the script runs correctly, modify it to triple-space the target file.

Finally, write a script to remove all blank lines from the target file, single-spacing it.

## Backwards Listing
Write a script that echoes itself to stdout, but backwards.
