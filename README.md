Dotfiles
========

A collection of dotfiles that I use (mostly copied from other places). In the cloud.

Installation
------------

```bash
git clone git://github.com/whymarrh/dotfiles ~/.files
~/.files/install
```

Repository
----------

A few notes about the structure of the repository:

- Functions declared outside of the `functions` directory must be unset once they are no longer needed. Doing so will prevent them from still being available once the `.bash_profile` has been sourced.
- Functions are prefixed with `__www_` to prevent overwriting anything else.

`~/.files/bin`
--------------

Neat things:

- [boris](https://github.com/d11wtq/boris)
- [composesr](https://getcomposer.org/)
- [PhantomJS](http://phantomjs.org/)
- [youtube-dl](https://rg3.github.io/youtube-dl/)
- [zopfli](https://code.google.com/p/zopfli/)
