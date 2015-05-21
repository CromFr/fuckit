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
_Message:_
[ ‭ ⁢ ‮               ‏     ‏ ⁤ ‪       ‪       ‭   ⁤ ‏ ​ ‪ ​]

- Select the message with brackets included (invisible 0-width and right to left characters are tricky)
- Paste it in a text editorn remove the brackets with `HOME` - `DELETE` - `END` - `BACKDELETE` and save the file
- `cat yoursavedfile | ./fuckit decode`
