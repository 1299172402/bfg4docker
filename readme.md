# BFG for Docker

[![Auto Release](https://github.com/1299172402/bfg4docker/actions/workflows/build.yml/badge.svg)](https://github.com/1299172402/bfg4docker/actions/workflows/build.yml)

Using BFG Repo-Cleaner with docker so that **I don't need java** on my machine.

The BFG is a simpler, faster ([10 - 720x](https://docs.google.com/spreadsheet/ccc?key=0AsR1d5Zpes8HdER3VGU1a3dOcmVHMmtzT2dsS2xNenc) faster)
alternative to `git-filter-branch` for cleansing bad data out of your Git repository:

* Removing **Crazy Big Files**
* Removing **Passwords, Credentials** & other **Private data**

Main documentation for The BFG is here : **https://rtyley.github.io/bfg-repo-cleaner/**

Original repo for The BFG is here : **https://github.com/rtyley/bfg-repo-cleaner**

## How to use

Download your repo first.

```bash
git clone https://github.com/username/dirty-repo.git
```

Run bfg command.

```bash
docker run --rm -v "<your repo folder>:/repo" ghcr.io/1299172402/bfg:latest <command>
```

## Example

### Remove more than 100M file in the git history

```bash
docker run --rm -v "/path/to/dirty-repo:/repo" ghcr.io/1299172402/bfg:latest --strip-blobs-bigger-than 100M
```

### Delete all files named 'id_rsa' in the git history

```bash
docker run --rm -v "/path/to/dirty-repo:/repo" ghcr.io/1299172402/bfg:latest --delete-files id_rsa
```

### Replace all passwords 'mysecretpassword' to 'nothinghappenhere' in the git history

```bash
docker run --rm -v "/path/to/dirty-repo:/repo" -v "/path/to/replace.txt:/passwords.txt" ghcr.io/1299172402/bfg:latest --replace-text /passwords.txt
```

replace.txt
```
mysecretpassword==>nothinghappenhere
```

### If you want to handle with all commit(including latest commit), please add `--no-blob-protection` params

```bash
docker run --rm -v "/path/to/dirty-repo:/repo" ghcr.io/1299172402/bfg:latest --strip-blobs-bigger-than 100M --no-blob-protection
```

```bash
docker run --rm -v "/path/to/dirty-repo:/repo" ghcr.io/1299172402/bfg:latest --delete-files id_rsa --no-blob-protection
```

```bash
docker run --rm -v "/path/to/dirty-repo:/repo" -v "/path/to/replace.txt:/passwords.txt" ghcr.io/1299172402/bfg:latest --replace-text /passwords.txt --no-blob-protection
```

### Help

```bash
docker run --rm ghcr.io/1299172402/bfg:latest --help
```
