vim-detailed
============

Source repo: http://github.com/rking/vim-detailed

So many 256-color schemes merely shift the palette around, displaying only 8
colors (even though they're a *different* set of 8 colors than default).

This scheme is more detailed than that.

Your eyes will learn to pick up on subtler patterns without requiring as
much from your conscious mind.  Instead of the goal being merely looking
cool, the goal is to maximize info bandwidth from the computer to the brain.
The regexes, for example, are much easier to pick out. The overall feel of a
given file becomes much more intuitively recognizeable (you'll know you're
in foo.rb, not bar.rb, without having to read any text). Certain bits will
"pop" into being the right colors, such as the difference between
"RUBY_VERISON" and "RUBY_VERSION", or # encoding: utf-8

## 256 Color Requirement

If you aren't getting 256 colors, you aren't getting detailed.vim.
Typically, you'll have to make sure your `$TERM` variable is set right. This
can get un-set by some programs, such as tmux. So you can force it to
something like:

    export TERM=screen-256color
    # or:
    export TERM=xterm-256color

If these are unavailable on the target system, you might have to place a
terminfo file in `~/.terminfo/`  -or- you can be totally gross and force it
with `:set &t_Co=256` in vim. But don't be gross. It's uncouth.

## Color Choices

As a historical note, some small effort was taken to be similar to the
default vim syntax highlighting where it makes sense. That is, "def" is
magenta in the default, so vim-detailed makes it a shade of purple (and uses
different shades for all the other magenta things from the default
colorscheme). A person could modify this idea and do better:

- Greens - The 256 color palette itself is heavy on green variants. If you
  used more greens, you'd be able to group similar-but-different pieces
  together more closely.
- Coolness - If you adjusted the color choices for æﬆhetic value rather than
  utilitarian, you could get a more stylish theme without sacrificing much
  detail.

## Download

 If using Pathogen,

     cd ~/.vim/bundle && git clone https://github.com/rking/vim-detailed

 If using no vim plugin manager:

     mkdir -p ~/.vim/colors/ && cd $_ && wget https://raw.github.com/rking/vim-detailed/master/colors/detailed.vim

## Setup

In your ~/.vimrc (or ~/.vim/plugin/colorscheme.vim if you like to organize):

    colo detailed

This enables it globally. If you want to just do it for a trial, as long as
you have done one of the steps in the "Download" section, above, you can do:

    vim foo.rb +colo\ detailed

Or, from within vim:

    :colo detailed

## TODO

  - Distinguish Foo and Bar of "class Foo < Bar"
  - More languages, other than Ruby. (Contributions will be very welcome)
  - Sync pry-theme to this
  - Light bg?  (At least warn or something: currently is illegible)
  - GUI colors: http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
  - Add a pygments version
  - Hunt down remaining non-visible syntax items.
