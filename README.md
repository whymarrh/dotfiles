.files
======

A collection of files that begin with a dot (and some that don't).

I use these. You probably don't want to use these.

Heavily inspired by literally everyone else that has a dotfiles collection.

### Installation

```bash
git clone git://github.com/whymarrh/dotfiles ~/.files
~/.files/install
```

### Repo

A few notes about the structure of the repository:

- Functions declared outside of the `functions` directory must be unset once they are no longer needed

    (Preventing them from still being available after `.bash_profile` has been sourced)

- Functions are prefixed with `__www_` to prevent overwriting anything else
- Some directories contain files with a number prefix -- it's just a hacky way to enforce source ordering

### Binaries (in the loosest sense of the word)

Only scripts that I've ~~cobbled together~~ written are included in the repo (in the `bin` directory).

Some other neat things you might want:

- [boris](https://github.com/d11wtq/boris)
- [composesr](https://getcomposer.org/)
- [PhantomJS](http://phantomjs.org/)
- [youtube-dl](https://rg3.github.io/youtube-dl/)
- [zopfli](https://code.google.com/p/zopfli/)
