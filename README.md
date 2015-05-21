# fuckit
Encode files with invisible characters

## Running it

#####Require:
- A D compiler,usually dmd (available in most linux distro package list)

#####Build it:
```bash
make
```


## Usage

fuckit takes stdin, encode/decode it, then outputs the result to stdout

```bash
# Encode a file and store the result in another
cat clearDataFile | fuckit encode > obfuscatedDataFile

# Decode and print to stdout
cat obfuscatedDataFile | fuckit decode

```


# Example
_Samples:_
Clear and Encoded versions of the [Git Pro Book History of Git](https://git-scm.com/book/en/v2/Getting-Started-A-Short-History-of-Git) are provided in res folder

_Decode a message:_
[ ‭ ⁢ ‮                       ⁢ ‮     ⁣ ‪ ​ ﻿   ‏ ⁤ ‪       ‪ ‫   ⁤   ⁤ ‫ ​]

- Select the message with brackets included (invisible 0-width and right to left characters are tricky)
- Paste it in a text editorn remove the brackets with `HOME` - `DELETE` - `END` - `BACKDELETE` and save the file
- `cat yoursavedfile | ./fuckit decode`
