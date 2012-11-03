" So many 256-color schemes merely shift the palette around, displaying only 8
" colors (even though they're a *different* set of 8 colors than default).
"
" This scheme is more detailed than that.
"
" The idea is that your eyes will learn to pick up on subtler patterns without
" requiring as much from your conscious mind. (And, I've found, it does work).
" Instead of the goal being merely looking cool, the goal is to maximize info
" bandwidth from the computer to the brain.
"
" Note that some small effort was taken to be similar to the default vim
" syntax highlighting where it makes sense. That is, "def" is magenta in the
" default, so vim-detailed makes it a shade of purple (and uses different
" shades for all the other magenta things from the default colorscheme).
"
" Companions to this file are:
" Indent Guides: https://github.com/nathanaelkane/vim-indent-guides
"
" TODO
" ----
"
"   - More languages, other than Ruby. (Contributions will be very welcome)
"   - Sync pry-theme to this
"   - Finish NO_SHOW fillings-in
"   - Determine if this is slow. ☺
"   - GUI colors
"     Perhaps redo with:
"     http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"   - Distinguish between bare things versus contained things:
"    -  class Foo < Bar is:
"       ['rubyBlock','rubyClassDeclaration', 'rubyConstant'] and
"       ['rubyBlock', 'rubyConstant']'
"
"    -  class Foo
"         class_call # ['rubyBlock', 'rubyBlock', 'rubyLocalVariableOrMethod']
"       end
"       toplevel_stuff ['rubyBlock', 'rubyLocalVariableOrMethod']'
"
"       "osse │ rking: maybe make a new syntax rule where you fiddle with the
"         'contains' argument to :syn"

let colors_name = 'detailed'

" It would be rather hard to make this work on both black and white. If you're
" a big fan of white bg's, let me know, and we can collaborate on a solution.
set bg=dark

" Prevent any screwy setting from causing errors:
let s:save_cpo = &cpo | set cpo&vim

" If you don't have this, rails.vim will zap the matchers when it resets
" syntax for its own additions:
au Syntax * call s:fatpacked_rainbow_parens()

au Syntax ruby call s:detailed_syntax_addtions()

" Show detailed syntax stack
nmap <Leader>dets :call <SID>SynStack()<CR>
fun! <SID>SynStack()
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfun

" Color Palette {{{
let s:c = {
  \'basic8_red (TODO: use this)': 1,
  \'basic8_green': 2,
  \'basic8_yellow (TODO: use this)': 3,
  \'basic8_blue (TODO: use this)': 4,
  \'basic8_magenta': 5,
  \'basic8_cyan': 6,
  \'NO_SHOW': 46,
  \'red52 (TODO: use this)': 52,
  \'red88': 88,
  \'red124': 124,
  \'red160': 160,
  \'red196 (TODO: use this)': 196,
  \'yellow58 (TODO: use this)': 58,
  \'yellow100': 100,
  \'yellow136 (TODO: use this)': 136,
  \'yellow142 (TODO: use this)': 142,
  \'yellow148': 148,
  \'yellow178': 178,
  \'yellow190': 190,
  \'yellow220 (TODO: use this)': 220,
  \'orange208': 208,
  \'light_yellow230': 229,
  \'graygreen (TODO: use this)': 23,
  \'green34': 34,
  \'green71': 71,
  \'green76 (TODO: use this)': 76,
  \'green84': 84,
  \'seafoam': 30,
  \'seafoam2 (TODO: use this)': 35,
  \'teal50': 50,
  \'blue19 (TODO: use this)': 19,
  \'blue20 (TODO: use this)': 20,
  \'blue21 (TODO: use this)': 21,
  \'blue25': 25,
  \'blue75': 75,
  \'lavender104': 104,
  \'purple53': 53,
  \'purple90': 90,
  \'purple95 (TODO: use this)': 95,
  \'purple99 (TODO: use this)': 79,
  \'purple125': 125,
  \'purple126': 126,
  \'purple127 (TODO: use this)': 127,
  \'purple129 (TODO: use this)': 129,
  \'purple131': 131,
  \'purple141 (TODO: use this)': 141,
  \'purple201': 201,
  \'purple225': 225,
  \'gray16': 16,
  \'gray232': 232,
  \'gray233': 233,
  \'gray234': 234,
  \'gray235': 235,
  \'gray236': 236,
  \'gray237': 237,
  \'gray238': 238,
  \'gray239': 239,
  \'gray240': 240,
  \'gray241': 241,
  \'gray242': 242,
  \'gray243': 243,
  \'gray244': 244,
  \'gray245': 245,
  \'gray246': 246,
  \'gray247': 247,
  \'gray248': 248,
  \'gray249': 249,
  \'gray250': 250,
  \'gray251': 251,
  \'gray252': 252,
  \'gray253': 253,
  \'gray254': 254,
  \'gray255': 255,
  \}
" }}}

fun! s:fg(group, color_name, ...)
  let cmd = 'hi '.a:group
  if 1 == a:0
    let cmd .= ' cterm='.a:1
    " term=bold cterm=bold ctermfg=135 guifg=Cyan"
  endif
  let cmd .= ' ctermfg='.s:c[a:color_name]
  exe cmd
endfun

" https://github.com/bitc/vim-bad-whitespace
hi BadWhitespace  ctermbg=58

" Basic/Default-like Palette {{{
hi SpecialKey     term=bold ctermfg=81 guifg=Cyan
hi NonText        term=bold ctermfg=12 gui=bold guifg=Blue
hi Directory      term=bold ctermfg=159 guifg=Cyan
hi ErrorMsg       term=standout ctermfg=15 ctermbg=1 guifg=White guibg=Red
hi IncSearch      term=reverse cterm=reverse gui=reverse
hi Search         term=reverse ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
hi MoreMsg        term=bold ctermfg=121 gui=bold guifg=SeaGreen
hi ModeMsg        term=bold cterm=bold gui=bold
hi LineNr         term=underline ctermfg=11 guifg=Yellow
hi CursorLineNr   term=bold ctermfg=11 gui=bold guifg=Yellow
hi Question       term=standout ctermfg=121 gui=bold guifg=Green
hi StatusLine     term=bold,reverse cterm=bold,reverse gui=bold,reverse
hi StatusLineNC   term=reverse cterm=reverse gui=reverse
hi VertSplit      term=reverse cterm=reverse gui=reverse
hi Title          term=bold ctermfg=225 gui=bold guifg=Magenta
hi Visual         term=reverse ctermbg=242 guibg=DarkGrey
hi VisualNOS      term=bold,underline cterm=bold,underline gui=bold,underline
hi WarningMsg     term=standout ctermfg=224 guifg=Red
hi WildMenu       term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
hi Folded         term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=DarkGrey
hi FoldColumn     term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
hi DiffAdd        term=bold ctermbg=4 guibg=DarkBlue
hi DiffChange     term=bold ctermbg=5 guibg=DarkMagenta
hi DiffDelete     term=bold ctermfg=12 ctermbg=6 gui=bold guifg=Blue guibg=DarkCyan
hi DiffText       term=reverse cterm=bold ctermbg=9 gui=bold guibg=Red
hi SignColumn     term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
hi Conceal        ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
hi SpellBad       term=reverse ctermbg=9 gui=undercurl guisp=Red
hi SpellCap       term=reverse ctermbg=12 gui=undercurl guisp=Blue
hi SpellRare      term=reverse ctermbg=13 gui=undercurl guisp=Magenta
hi SpellLocal     term=underline ctermbg=14 gui=undercurl guisp=Cyan
hi Pmenu          ctermfg=0 ctermbg=13 guibg=Magenta
hi PmenuSel       ctermfg=0 ctermbg=242 guibg=DarkGrey
hi PmenuSbar      ctermbg=248 guibg=Grey
hi PmenuThumb     ctermbg=15 guibg=White
hi TabLine        term=underline cterm=underline ctermfg=15 ctermbg=242 gui=underline guibg=DarkGrey
hi TabLineSel     term=bold cterm=bold gui=bold
hi TabLineFill    term=reverse cterm=reverse gui=reverse
hi CursorColumn   term=reverse ctermbg=242 guibg=Grey40
hi CursorLine     term=underline cterm=underline guibg=Grey40
hi ColorColumn    term=reverse ctermfg=9 ctermbg=12 guifg=black guibg=lightgrey
hi MatchParen     term=reverse ctermbg=6 guibg=DarkCyan
hi Comment        term=bold ctermfg=14 guifg=#80a0ff
hi Constant       term=underline ctermfg=13 guifg=#ffa0a0
hi Special        term=bold ctermfg=224 guifg=Orange
hi Identifier     term=underline cterm=bold ctermfg=14 guifg=#40ffff
hi Statement      term=bold ctermfg=11 gui=bold guifg=#ffff60
hi PreProc        term=underline ctermfg=81 guifg=#ff80ff
hi Type           term=underline ctermfg=121 gui=bold guifg=#60ff60
hi Underlined     term=underline cterm=underline ctermfg=81 gui=underline guifg=#80a0ff
hi Ignore         ctermfg=0 guifg=bg
hi Error          term=reverse ctermfg=15 ctermbg=9 guifg=White guibg=Red
hi Todo           term=standout ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow
" }}}

" Default links {{{
hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Function        Identifier
hi link Conditional     Statement
hi link Repeat          Statement
hi link Label           Statement
hi link Operator        Statement
hi link Keyword         Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special
hi link mailQuoted1     Type
hi link GPGWarning      WarningMsg
hi link GPGError        ErrorMsg
hi link GPGHighlightUnknownRecipient  ErrorMsg
hi link detailRubyConditional  Conditional
hi link detailRubyExceptional  detailRubyConditional
hi link detailRubyMethodExceptional  detailRubyDefine
hi link detailRubyTodo        Todo
hi link detailRubyStringEscape  Special
hi link detailRubyQuoteEscape  detailRubyStringEscape
" hi detailRubyInterpolation cleared
hi link detailRubyClassVariable  detailRubyIdentifier
hi link detailRubyGlobalVariable  detailRubyIdentifier
hi link detailRubyPredefinedVariable  detailRubyPredefinedIdentifier " Hrm?
hi link detailRubyInvalidVariable  Error
hi link detailRubyNoInterpolation  detailRubyString
hi link detailRubyFunction    Function
hi link detailRubyException   Exception
hi link detailRubyKeyword     Keyword
hi link detailRubyPredefinedIdentifier  detailRubyIdentifier
"}}}

" s:detailed_colors — the good stuff {{{
fun! s:detailed_colors()
  call s:fg('detailRubyLocalVariableOrMethod', 'NO_SHOW')
  call s:fg('Exception', 'orange208') " Like default yellow but more warny.

  call s:fg('detailRubyConstant', 'green34')

  call s:fg('detailRubyClass', 'purple126', 'bold')
  call s:fg('detailRubyModule', 'purple126')
  call s:fg('detailRubyDefine', 'basic8_magenta')
  call s:fg('detailRubyInclude', 'purple53')

  call s:fg('detailRubyMethodBlock', 'gray250') " Contents of methods, basically
  call s:fg('detailRubyDoBlock', 'light_yellow230')
  call s:fg('detailRubyBlock', 'purple225')
  call s:fg('detailRubyInstanceVariable', 'blue75')

  "TODO: call s:fg('detailRubyDelimEscape', '')
  call s:fg('detailRubyString', 'red88')
  call s:fg('detailRubyInterpolationDelimiter', 'gray244')

  call s:fg('detailRubyRegexpSpecial', 'seafoam')
  call s:fg('detailRubyRegexpComment', 'gray238')

  " call s:fg('detailRubyRegexpParens', 'NO_SHOW')
  " call s:fg('detailRubyRegexpBrackets', 'NO_SHOW')

  call s:fg('detailRubyRegexpCharClass', 'basic8_green')
  call s:fg('detailRubyRegexpQuantifier', 'yellow148')
  call s:fg('detailRubyRegexpEscape', 'purple90', 'bold')
  call s:fg('detailRubyRegexpAnchor', 'purple90')
  call s:fg('detailRubyRegexpDot', 'green34')
  call s:fg('detailRubyRegexpDelimiter', 'red88', 'bold')
  call s:fg('detailRubyRegexp', 'red160')
  call s:fg('detailRubyASCIICode', 'green71')

  call s:fg('detailRubyPseudoVariable', 'purple125')
  call s:fg('detailRubyInteger', 'red124')
  call s:fg('detailRubyFloat', 'red160')

  " call s:fg('detailRubyBlockArgument', 'NO_SHOW')
  call s:fg('detailRubySymbol', 'lavender104')
  call s:fg('detailRubyBlockParameter', 'basic8_cyan', 'bold')
  call s:fg('detailRubyBlockParameterList', 'blue25')
  hi link detailRubyPredefinedConstant  detailRubyPredefinedIdentifier " TODO
  hi link detailRubyStringDelimiter  Delimiter " TODO
  hi link detailRubySymbolDelimiter  detailRubyStringDelimiter " TODO
  " call s:fg('detailRubyHeredocStart', 'NO_SHOW')
  " call s:fg('detailRubyAliasDeclaration2', 'NO_SHOW')
  " call s:fg('detailRubyAliasDeclaration', 'NO_SHOW')
  call s:fg('detailRubyBoolean', 'purple131')
  " hi detailRubyMethodDeclaration cleared
  hi link detailRubyOperator    Operator " TODO
  hi link detailRubyPseudoOperator  detailRubyOperator " -= /= **= *= etc
  " call s:fg('detailRubyClassDeclaration', 'NO_SHOW')
  " call s:fg('detailRubyModuleDeclaration', 'NO_SHOW')
  hi link detailRubyControl     Statement " TODO
  hi link detailRubyBeginEnd    Statement " TODO
  call s:fg('detailRubyAccess', 'yellow100')
  call s:fg('detailRubyAttribute', 'yellow178')
  call s:fg('detailRubyEval', 'yellow190')
  call s:fg('detailRubyConditionalModifier', 'yellow148', 'bold')
  " hi detailRubyConditionalExpression cleared
  call s:fg('detailRubyRepeat', 'yellow178')
  " TODO: call s:fg('detailRubyOptionalDo', 'NO_SHOW')
  " TODO: call s:fg('detailRubyOptionalDoLine', 'NO_SHOW')
  " hi detailRubyRepeatExpression cleared
  call s:fg('detailRubySharpBang', 'gray238')
  hi link detailRubySpaceError  detailRubyError
  call s:fg('detailRubyComment', 'gray241')
  " hi detailRubyMultilineComment cleared
  hi link detailRubyDocumentation  Comment
  " hi detailRubyKeywordAsMethod cleared
  call s:fg('detailRubyDataDirective', 'purple201')
  call s:fg('detailRubyData', 'gray245')

  call s:fg('detailRubyInitialize', 'green84')

  " TODO call s:fg('detailRubyIdentifier', 'NO_SHOW')
  " TODO call s:fg('detailRubyError', 'NO_SHOW')
  " TODO call s:fg('detailRubyRepeatModifier', 'NO_SHOW') " while/until
  " TODO call s:fg('detailRubyCurlyBlock', 'NO_SHOW')
  " TODO call s:fg('detailRubyArrayDelimiter', 'NO_SHOW')
  " TODO call s:fg('detailRubyArrayLiteral', 'NO_SHOW')
  " TODO call s:fg('detailRubyBlockExpression', 'NO_SHOW')
  " TODO call s:fg('detailRubyCaseExpression', 'NO_SHOW')
  " TODO call s:fg('detailRubyNestedParentheses', 'NO_SHOW')
  " TODO call s:fg('detailRubyNestedCurlyBraces', 'NO_SHOW')
  " TODO call s:fg('detailRubyNestedAngleBrackets', 'NO_SHOW')
  " TODO call s:fg('detailRubyNestedSquareBrackets', 'NO_SHOW')

  call s:fg('rubyRailsARAssociationMethod', 'teal50')

endfun
" }}}

fun! s:detailed_syntax_addtions()
  " For now, we're doing no caching of the syntax file. We have to redo the
  " stock ruby.vim with no "transparent" flags, so each time the Syntax events
  " fires we just slam it back in our way:
  "runtime mod-syntax/ruby.vim

  call s:detailed_colors()

  " Bonus!
  syn match detailRubyInitialize '\<initialize\>' contained containedin=detailRubyMethodDeclaration
endfun
call s:detailed_syntax_addtions()

" Rainbow-Parens Improved {{{
" Inlined from v2.3 of http://www.vim.org/scripts/script.php?script_id=4176
" 1. to remove the external dep, 2. to work around vim-rails resetting it.
" Thanks!
fun! s:fatpacked_rainbow_parens()
  let guifgs = exists('g:rainbow_guifgs')? g:rainbow_guifgs : [
        \ 'DarkOrchid3', 'RoyalBlue3', 'SeaGreen3',
        \ 'DarkOrange3', 'FireBrick',
        \ ]

  let ctermfgs = exists('g:rainbow_ctermfgs')? g:rainbow_ctermfgs : [
        \ 'darkgray', 'Darkblue', 'darkmagenta',
        \ 'darkcyan', 'darkred', 'darkgreen',
        \ ]

  let max = has('gui_running')? len(guifgs) : len(ctermfgs)

  let cmd = 'syn region %s matchgroup=%s start=/%s/ end=/%s/ containedin=%s contains=%s'
  let str = 'TOP'
  for each in range(1, max)
    let str .= ',lv'.each
  endfor
  for [left , right] in [['(',')'],['\[','\]'],['{','}']]
    for each in range(1, max - 1)
      exe printf(cmd, 'lv'.each, 'lv'.each.'c', left, right, 'lv'.(each+1) , str)
    endfor
    exe printf(cmd, 'lv'.max, 'lv'.max.'c', left, right, 'lv1' , str)
  endfor

  for id in range(1 , max)
    let ctermfg = ctermfgs[(max - id) % len(ctermfgs)]
    let guifg = guifgs[(max - id) % len(guifgs)]
    exe 'hi default lv'.id.'c ctermfg='.ctermfg.' guifg='.guifg
  endfor
endfun
" }}}

let &cpo = s:save_cpo

" vim:foldmethod=marker
