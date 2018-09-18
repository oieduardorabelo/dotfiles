# eduardo's dotfiles [![Build Status](https://travis-ci.org/oieduardorabelo/dotfiles.svg?branch=master)](https://travis-ci.org/oieduardorabelo/dotfiles)

### dotfiles

Your dotfiles are how you personalize your system. These are mine.

### install

Just run:

```
git clone https://github.com/oieduardorabelo/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap
```

This will symlink the appropriate files in .dotfiles to your home directory.

Everything is configured and tweaked within `~/.dotfiles`.

## .bash_profile tip

You can have your machine secrets at `.dotfiles-locals.sh`, like:

```bash
# loading dotfiles
. ~/.dotfiles/dotfiles.sh

# machine specific things
if [ -f "$HOME/.dotfiles-locals.sh" ]; then
  . ~/.dotfiles-locals.sh
fi
```
