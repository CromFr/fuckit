# fuckit
Encode files with invisible characters


# Usage

fuckit takes stdin, encode/decode it, then outputs the result to stdout

```bash
# Encode a file and store the result in another
cat clearDataFile | fuckit encode > obfuscatedDataFile

# Decode and print to stdout
cat obfuscatedDataFile | fuckit decode

```
