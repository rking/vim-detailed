vim-detailed
============

So many 256-color schemes merely shift the palette around, displaying only 8
colors (even though they're a *different* set of 8 colors than default).

This scheme is more detailed than that.

The idea is that your eyes will learn to pick up on subtler patterns without
requiring as much from your conscious mind. (And, I've found, it does work).
Instead of the goal being merely looking cool, the goal is to maximize info
bandwidth from the computer to the brain.

Note that some small effort was taken to be similar to the default vim
syntax highlighting where it makes sense. That is, "def" is magenta in the
default, so vim-detailed makes it a shade of purple (and uses different
shades for all the other magenta things from the default colorscheme).

Companions to this file are:
Indent Guides: https://github.com/nathanaelkane/vim-indent-guides

TODO
----

  - More languages, other than Ruby. (Contributions will be very welcome)
  - Sync pry-theme to this
  - Finish NO_SHOW fillings-in
  - Determine if this is slow. ☺
  - GUI colors
    Perhaps redo with:
    http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
  - Distinguish between bare things versus contained things:
   -  class Foo < Bar is:
      ['rubyBlock','rubyClassDeclaration', 'rubyConstant'] and
      ['rubyBlock', 'rubyConstant']'

   -  class Foo
        class_call # ['rubyBlock', 'rubyBlock', 'rubyLocalVariableOrMethod']
      end
      toplevel_stuff ['rubyBlock', 'rubyLocalVariableOrMethod']'

      "osse │ rking: maybe make a new syntax rule where you fiddle with the
        'contains' argument to :syn"
