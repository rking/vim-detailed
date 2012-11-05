vim-detailed
============

Source repo: http://github.com/rking/vim-detailed

So many 256-color schemes merely shift the palette around, displaying only 8
colors (even though they're a *different* set of 8 colors than default).

This scheme is more detailed than that.

The idea is that your eyes will learn to pick up on subtler patterns without
requiring as much from your conscious mind.  Instead of the goal being
merely looking cool, the goal is to maximize info bandwidth from the
computer to the brain. The regexes, for example, are much easier to pick
out. The overall feel of a given file becomes much more intuitively
recognizeable (you'll know you're in foo.rb, not bar.rb, without having to
read any text). Certain bits will "pop" into being the right colors, such as
the difference between "RUBY_VERISON" and "RUBY_VERSION", or # encoding: utf-8

Note that some small effort was taken to be similar to the default vim
syntax highlighting where it makes sense. That is, "def" is magenta in the
default, so vim-detailed makes it a shade of purple (and uses different
shades for all the other magenta things from the default colorscheme).

TODO
----

  - More languages, other than Ruby. (Contributions will be very welcome)
  - Sync pry-theme to this
  - GUI colors
    Perhaps redo with:
    http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
  - Hunt down remaining non-visible syntax items.
  - Distinguish between bare things versus contained things:
   -  class Foo < Bar (Should allow different colors for Foo vs. Bar)
