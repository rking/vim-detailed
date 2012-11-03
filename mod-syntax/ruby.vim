" Vim syntax file
" Language:		Ruby
" Maintainer:		Doug Kearns <dougkearns@gmail.com>
" URL:			https://github.com/vim-ruby/vim-ruby
" Anon CVS:		See above site
" Release Coordinator:	Doug Kearns <dougkearns@gmail.com>
" ----------------------------------------------------------------------------
"
" Previous Maintainer:	Mirko Nasato
" Thanks to perl.vim authors, and to Reimer Behrends. :-) (MN)
" ----------------------------------------------------------------------------

if 0
  finish
endif

if has("folding") && exists("detailRuby_fold")
  setlocal foldmethod=syntax
endif

syn cluster detailRubyNotTop contains=@detailRubyExtendedStringSpecial,@detailRubyRegexpSpecial,@detailRubyDeclaration,detailRubyConditional,detailRubyExceptional,detailRubyMethodExceptional,detailRubyTodo

if exists("detailRuby_space_errors")
  if !exists("detailRuby_no_trail_space_error")
    syn match detailRubySpaceError display excludenl "\s\+$"
  endif
  if !exists("detailRuby_no_tab_space_error")
    syn match detailRubySpaceError display " \+\t"me=e-1
  endif
endif

" Operators
if exists("detailRuby_operators")
  syn match  detailRubyOperator "[~!^&|*/%+-]\|\%(class\s*\)\@<!<<\|<=>\|<=\|\%(<\|\<class\s\+\u\w*\s*\)\@<!<[^<]\@=\|===\|==\|=\~\|>>\|>=\|=\@<!>\|\*\*\|\.\.\.\|\.\.\|::"
  syn match  detailRubyOperator "->\|-=\|/=\|\*\*=\|\*=\|&&=\|&=\|&&\|||=\||=\|||\|%=\|+=\|!\~\|!="
  syn region detailRubyBracketOperator matchgroup=detailRubyOperator start="\%(\w[?!]\=\|[]})]\)\@<=\[\s*" end="\s*]" contains=ALLBUT,@detailRubyNotTop
endif

" Expression Substitution and Backslash Notation
syn match detailRubyStringEscape "\\\\\|\\[abefnrstv]\|\\\o\{1,3}\|\\x\x\{1,2}"						    contained display
syn match detailRubyStringEscape "\%(\\M-\\C-\|\\C-\\M-\|\\M-\\c\|\\c\\M-\|\\c\|\\C-\|\\M-\)\%(\\\o\{1,3}\|\\x\x\{1,2}\|\\\=\S\)" contained display
syn match detailRubyQuoteEscape  "\\[\\']"											    contained display

syn region detailRubyInterpolation	      matchgroup=detailRubyInterpolationDelimiter start="#{" end="}" contained contains=ALLBUT,@detailRubyNotTop
syn match  detailRubyInterpolation	      "#\%(\$\|@@\=\)\w\+"    display contained contains=detailRubyInterpolationDelimiter,detailRubyInstanceVariable,detailRubyClassVariable,detailRubyGlobalVariable,detailRubyPredefinedVariable
syn match  detailRubyInterpolationDelimiter "#\ze\%(\$\|@@\=\)\w\+" display contained
syn match  detailRubyInterpolation	      "#\$\%(-\w\|\W\)"       display contained contains=detailRubyInterpolationDelimiter,detailRubyPredefinedVariable,detailRubyInvalidVariable
syn match  detailRubyInterpolationDelimiter "#\ze\$\%(-\w\|\W\)"    display contained
syn region detailRubyNoInterpolation	      start="\\#{" end="}"            contained
syn match  detailRubyNoInterpolation	      "\\#{"		      display contained
syn match  detailRubyNoInterpolation	      "\\#\%(\$\|@@\=\)\w\+"  display contained
syn match  detailRubyNoInterpolation	      "\\#\$\W"		      display contained

syn match detailRubyDelimEscape	"\\[(<{\[)>}\]]" transparent display contained contains=NONE

syn region detailRubyNestedParentheses    start="("  skip="\\\\\|\\)"  matchgroup=detailRubyString end=")"	transparent contained
syn region detailRubyNestedCurlyBraces    start="{"  skip="\\\\\|\\}"  matchgroup=detailRubyString end="}"	transparent contained
syn region detailRubyNestedAngleBrackets  start="<"  skip="\\\\\|\\>"  matchgroup=detailRubyString end=">"	transparent contained
syn region detailRubyNestedSquareBrackets start="\[" skip="\\\\\|\\\]" matchgroup=detailRubyString end="\]"	transparent contained

" These are mostly Oniguruma ready
syn region detailRubyRegexpComment	matchgroup=detailRubyRegexpSpecial   start="(?#"								  skip="\\)"  end=")"  contained
syn region detailRubyRegexpParens	matchgroup=detailRubyRegexpSpecial   start="(\(?:\|?<\=[=!]\|?>\|?<[a-z_]\w*>\|?[imx]*-[imx]*:\=\|\%(?#\)\@!\)" skip="\\)"  end=")"  contained transparent contains=@detailRubyRegexpSpecial
syn region detailRubyRegexpBrackets	matchgroup=detailRubyRegexpCharClass start="\[\^\="								  skip="\\\]" end="\]" contained transparent contains=detailRubyStringEscape,detailRubyRegexpEscape,detailRubyRegexpCharClass oneline
syn match  detailRubyRegexpCharClass	"\\[DdHhSsWw]"	       contained display
syn match  detailRubyRegexpCharClass	"\[:\^\=\%(alnum\|alpha\|ascii\|blank\|cntrl\|digit\|graph\|lower\|print\|punct\|space\|upper\|xdigit\):\]" contained
syn match  detailRubyRegexpEscape	"\\[].*?+^$|\\/(){}[]" contained
syn match  detailRubyRegexpQuantifier	"[*?+][?+]\="	       contained display
syn match  detailRubyRegexpQuantifier	"{\d\+\%(,\d*\)\=}?\=" contained display
syn match  detailRubyRegexpAnchor	"[$^]\|\\[ABbGZz]"     contained display
syn match  detailRubyRegexpDot	"\."		       contained display
syn match  detailRubyRegexpSpecial	"|"		       contained display
syn match  detailRubyRegexpSpecial	"\\[1-9]\d\=\d\@!"     contained display
syn match  detailRubyRegexpSpecial	"\\k<\%([a-z_]\w*\|-\=\d\+\)\%([+-]\d\+\)\=>" contained display
syn match  detailRubyRegexpSpecial	"\\k'\%([a-z_]\w*\|-\=\d\+\)\%([+-]\d\+\)\='" contained display
syn match  detailRubyRegexpSpecial	"\\g<\%([a-z_]\w*\|-\=\d\+\)>" contained display
syn match  detailRubyRegexpSpecial	"\\g'\%([a-z_]\w*\|-\=\d\+\)'" contained display

syn cluster detailRubyStringSpecial	      contains=detailRubyInterpolation,detailRubyNoInterpolation,detailRubyStringEscape
syn cluster detailRubyExtendedStringSpecial contains=@detailRubyStringSpecial,detailRubyNestedParentheses,detailRubyNestedCurlyBraces,detailRubyNestedAngleBrackets,detailRubyNestedSquareBrackets
syn cluster detailRubyRegexpSpecial	      contains=detailRubyInterpolation,detailRubyNoInterpolation,detailRubyStringEscape,detailRubyRegexpSpecial,detailRubyRegexpEscape,detailRubyRegexpBrackets,detailRubyRegexpCharClass,detailRubyRegexpDot,detailRubyRegexpQuantifier,detailRubyRegexpAnchor,detailRubyRegexpParens,detailRubyRegexpComment

" Numbers and ASCII Codes
syn match detailRubyASCIICode	"\%(\w\|[]})\"'/]\)\@<!\%(?\%(\\M-\\C-\|\\C-\\M-\|\\M-\\c\|\\c\\M-\|\\c\|\\C-\|\\M-\)\=\%(\\\o\{1,3}\|\\x\x\{1,2}\|\\\=\S\)\)"
syn match detailRubyInteger	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[xX]\x\+\%(_\x\+\)*\>"								display
syn match detailRubyInteger	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0[dD]\)\=\%(0\|[1-9]\d*\%(_\d\+\)*\)\>"						display
syn match detailRubyInteger	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[oO]\=\o\+\%(_\o\+\)*\>"								display
syn match detailRubyInteger	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[bB][01]\+\%(_[01]\+\)*\>"								display
syn match detailRubyFloat	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0\|[1-9]\d*\%(_\d\+\)*\)\.\d\+\%(_\d\+\)*\>"					display
syn match detailRubyFloat	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0\|[1-9]\d*\%(_\d\+\)*\)\%(\.\d\+\%(_\d\+\)*\)\=\%([eE][-+]\=\d\+\%(_\d\+\)*\)\>"	display

" Identifiers
syn match detailRubyLocalVariableOrMethod "\<[_[:lower:]][_[:alnum:]]*[?!=]\=" contains=NONE display
syn match detailRubyBlockArgument	    "&[_[:lower:]][_[:alnum:]]"		 contains=NONE display transparent

syn match  detailRubyConstant		"\%(\%([.@$]\@<!\.\)\@<!\<\|::\)\_s*\zs\u\w*\%(\>\|::\)\@=\%(\s*(\)\@!"
syn match  detailRubyClassVariable	"@@\h\w*" display
syn match  detailRubyInstanceVariable "@\h\w*"  display
syn match  detailRubyGlobalVariable	"$\%(\h\w*\|-.\)"
syn match  detailRubySymbol		"[]})\"':]\@<!:\%(\^\|\~\|<<\|<=>\|<=\|<\|===\|==\|=\~\|>>\|>=\|>\||\|-@\|-\|/\|\[]=\|\[]\|\*\*\|\*\|&\|%\|+@\|+\|`\)"
syn match  detailRubySymbol		"[]})\"':]\@<!:\$\%(-.\|[`~<=>_,;:!?/.'"@$*\&+0]\)"
syn match  detailRubySymbol		"[]})\"':]\@<!:\%(\$\|@@\=\)\=\h\w*"
syn match  detailRubySymbol		"[]})\"':]\@<!:\h\w*\%([?!=]>\@!\)\="
syn match  detailRubySymbol		"\%([{(,]\_s*\)\@<=\l\w*[!?]\=::\@!"he=e-1
syn match  detailRubySymbol		"[]})\"':]\@<!\h\w*[!?]\=:\s\@="he=e-1
syn match  detailRubySymbol		"\%([{(,]\_s*\)\@<=[[:space:],{]\l\w*[!?]\=::\@!"hs=s+1,he=e-1
syn match  detailRubySymbol		"[[:space:],{]\h\w*[!?]\=:\s\@="hs=s+1,he=e-1
syn region detailRubySymbol		start="[]})\"':]\@<!:'"  end="'"  skip="\\\\\|\\'"  contains=detailRubyQuoteEscape fold
syn region detailRubySymbol		start="[]})\"':]\@<!:\"" end="\"" skip="\\\\\|\\\"" contains=@detailRubyStringSpecial fold

syn match  detailRubyBlockParameter	  "\h\w*" contained
syn region detailRubyBlockParameterList start="\%(\%(\<do\>\|{\)\s*\)\@<=|" end="|" oneline display contains=detailRubyBlockParameter

syn match detailRubyInvalidVariable	 "$[^ A-Za-z_-]"
syn match detailRubyPredefinedVariable #$[!$&"'*+,./0:;<=>?@\`~]#
syn match detailRubyPredefinedVariable "$\d\+"										   display
syn match detailRubyPredefinedVariable "$_\>"											   display
syn match detailRubyPredefinedVariable "$-[0FIKadilpvw]\>"									   display
syn match detailRubyPredefinedVariable "$\%(deferr\|defout\|stderr\|stdin\|stdout\)\>"					   display
syn match detailRubyPredefinedVariable "$\%(DEBUG\|FILENAME\|KCODE\|LOADED_FEATURES\|LOAD_PATH\|PROGRAM_NAME\|SAFE\|VERBOSE\)\>" display
syn match detailRubyPredefinedConstant "\%(\%(\.\@<!\.\)\@<!\|::\)\_s*\zs\%(MatchingData\|ARGF\|ARGV\|ENV\)\>\%(\s*(\)\@!"
syn match detailRubyPredefinedConstant "\%(\%(\.\@<!\.\)\@<!\|::\)\_s*\zs\%(DATA\|FALSE\|NIL\)\>\%(\s*(\)\@!"
syn match detailRubyPredefinedConstant "\%(\%(\.\@<!\.\)\@<!\|::\)\_s*\zs\%(STDERR\|STDIN\|STDOUT\|TOPLEVEL_BINDING\|TRUE\)\>\%(\s*(\)\@!"
syn match detailRubyPredefinedConstant "\%(\%(\.\@<!\.\)\@<!\|::\)\_s*\zs\%(RUBY_\%(VERSION\|RELEASE_DATE\|PLATFORM\|PATCHLEVEL\|REVISION\|DESCRIPTION\|COPYRIGHT\|ENGINE\)\)\>\%(\s*(\)\@!"

" Normal Regular Expression
syn region detailRubyRegexp matchgroup=detailRubyRegexpDelimiter start="\%(\%(^\|\<\%(and\|or\|while\|until\|unless\|if\|elsif\|when\|not\|then\|else\)\|[;\~=!|&(,[>?:]\)\s*\)\@<=/" end="/[iomxneus]*" skip="\\\\\|\\/" contains=@detailRubyRegexpSpecial keepend fold
syn region detailRubyRegexp matchgroup=detailRubyRegexpDelimiter start="\%(\h\k*\s\+\)\@<=/[ \t=]\@!" end="/[iomxneus]*" skip="\\\\\|\\/" contains=@detailRubyRegexpSpecial fold

" Generalized Regular Expression
syn region detailRubyRegexp matchgroup=detailRubyRegexpDelimiter start="%r\z([~`!@#$%^&*_\-+=|\:;"',.? /]\)" end="\z1[iomxneus]*" skip="\\\\\|\\\z1" contains=@detailRubyRegexpSpecial fold
syn region detailRubyRegexp matchgroup=detailRubyRegexpDelimiter start="%r{"				 end="}[iomxneus]*"   skip="\\\\\|\\}"	 contains=@detailRubyRegexpSpecial fold
syn region detailRubyRegexp matchgroup=detailRubyRegexpDelimiter start="%r<"				 end=">[iomxneus]*"   skip="\\\\\|\\>"	 contains=@detailRubyRegexpSpecial,detailRubyNestedAngleBrackets,detailRubyDelimEscape fold
syn region detailRubyRegexp matchgroup=detailRubyRegexpDelimiter start="%r\["				 end="\][iomxneus]*"  skip="\\\\\|\\\]"	 contains=@detailRubyRegexpSpecial fold
syn region detailRubyRegexp matchgroup=detailRubyRegexpDelimiter start="%r("				 end=")[iomxneus]*"   skip="\\\\\|\\)"	 contains=@detailRubyRegexpSpecial fold

" Normal String and Shell Command Output
syn region detailRubyString matchgroup=detailRubyStringDelimiter start="\"" end="\"" skip="\\\\\|\\\"" contains=@detailRubyStringSpecial,@Spell fold
syn region detailRubyString matchgroup=detailRubyStringDelimiter start="'"	end="'"  skip="\\\\\|\\'"  contains=detailRubyQuoteEscape,@Spell    fold
syn region detailRubyString matchgroup=detailRubyStringDelimiter start="`"	end="`"  skip="\\\\\|\\`"  contains=@detailRubyStringSpecial fold

" Generalized Single Quoted String, Symbol and Array of Strings
syn region detailRubyString matchgroup=detailRubyStringDelimiter start="%[qw]\z([~`!@#$%^&*_\-+=|\:;"',.?/]\)" end="\z1" skip="\\\\\|\\\z1" fold
syn region detailRubyString matchgroup=detailRubyStringDelimiter start="%[qw]{"				   end="}"   skip="\\\\\|\\}"	fold contains=detailRubyNestedCurlyBraces,detailRubyDelimEscape
syn region detailRubyString matchgroup=detailRubyStringDelimiter start="%[qw]<"				   end=">"   skip="\\\\\|\\>"	fold contains=detailRubyNestedAngleBrackets,detailRubyDelimEscape
syn region detailRubyString matchgroup=detailRubyStringDelimiter start="%[qw]\["				   end="\]"  skip="\\\\\|\\\]"	fold contains=detailRubyNestedSquareBrackets,detailRubyDelimEscape
syn region detailRubyString matchgroup=detailRubyStringDelimiter start="%[qw]("				   end=")"   skip="\\\\\|\\)"	fold contains=detailRubyNestedParentheses,detailRubyDelimEscape
syn region detailRubyString matchgroup=detailRubyStringDelimiter start="%q "				   end=" "   skip="\\\\\|\\)"	fold
syn region detailRubySymbol matchgroup=detailRubySymbolDelimiter start="%s\z([~`!@#$%^&*_\-+=|\:;"',.? /]\)"   end="\z1" skip="\\\\\|\\\z1" fold
syn region detailRubySymbol matchgroup=detailRubySymbolDelimiter start="%s{"				   end="}"   skip="\\\\\|\\}"	fold contains=detailRubyNestedCurlyBraces,detailRubyDelimEscape
syn region detailRubySymbol matchgroup=detailRubySymbolDelimiter start="%s<"				   end=">"   skip="\\\\\|\\>"	fold contains=detailRubyNestedAngleBrackets,detailRubyDelimEscape
syn region detailRubySymbol matchgroup=detailRubySymbolDelimiter start="%s\["				   end="\]"  skip="\\\\\|\\\]"	fold contains=detailRubyNestedSquareBrackets,detailRubyDelimEscape
syn region detailRubySymbol matchgroup=detailRubySymbolDelimiter start="%s("				   end=")"   skip="\\\\\|\\)"	fold contains=detailRubyNestedParentheses,detailRubyDelimEscape

" Generalized Double Quoted String and Array of Strings and Shell Command Output
" Note: %= is not matched here as the beginning of a double quoted string
syn region detailRubyString matchgroup=detailRubyStringDelimiter start="%\z([~`!@#$%^&*_\-+|\:;"',.?/]\)"	    end="\z1" skip="\\\\\|\\\z1" contains=@detailRubyStringSpecial fold
syn region detailRubyString matchgroup=detailRubyStringDelimiter start="%[QWx]\z([~`!@#$%^&*_\-+=|\:;"',.?/]\)" end="\z1" skip="\\\\\|\\\z1" contains=@detailRubyStringSpecial fold
syn region detailRubyString matchgroup=detailRubyStringDelimiter start="%[QWx]\={"				    end="}"   skip="\\\\\|\\}"	 contains=@detailRubyStringSpecial,detailRubyNestedCurlyBraces,detailRubyDelimEscape    fold
syn region detailRubyString matchgroup=detailRubyStringDelimiter start="%[QWx]\=<"				    end=">"   skip="\\\\\|\\>"	 contains=@detailRubyStringSpecial,detailRubyNestedAngleBrackets,detailRubyDelimEscape  fold
syn region detailRubyString matchgroup=detailRubyStringDelimiter start="%[QWx]\=\["				    end="\]"  skip="\\\\\|\\\]"	 contains=@detailRubyStringSpecial,detailRubyNestedSquareBrackets,detailRubyDelimEscape fold
syn region detailRubyString matchgroup=detailRubyStringDelimiter start="%[QWx]\=("				    end=")"   skip="\\\\\|\\)"	 contains=@detailRubyStringSpecial,detailRubyNestedParentheses,detailRubyDelimEscape    fold
syn region detailRubyString matchgroup=detailRubyStringDelimiter start="%[Qx] "				    end=" "   skip="\\\\\|\\)"   contains=@detailRubyStringSpecial fold

" Here Document
syn region detailRubyHeredocStart matchgroup=detailRubyStringDelimiter start=+\%(\%(class\s*\|\%([]})"'.]\|::\)\)\_s*\|\w\)\@<!<<-\=\zs\%(\h\w*\)+	 end=+$+ oneline contains=ALLBUT,@detailRubyNotTop
syn region detailRubyHeredocStart matchgroup=detailRubyStringDelimiter start=+\%(\%(class\s*\|\%([]})"'.]\|::\)\)\_s*\|\w\)\@<!<<-\=\zs"\%([^"]*\)"+ end=+$+ oneline contains=ALLBUT,@detailRubyNotTop
syn region detailRubyHeredocStart matchgroup=detailRubyStringDelimiter start=+\%(\%(class\s*\|\%([]})"'.]\|::\)\)\_s*\|\w\)\@<!<<-\=\zs'\%([^']*\)'+ end=+$+ oneline contains=ALLBUT,@detailRubyNotTop
syn region detailRubyHeredocStart matchgroup=detailRubyStringDelimiter start=+\%(\%(class\s*\|\%([]})"'.]\|::\)\)\_s*\|\w\)\@<!<<-\=\zs`\%([^`]*\)`+ end=+$+ oneline contains=ALLBUT,@detailRubyNotTop

syn region detailRubyString start=+\%(\%(class\|::\)\_s*\|\%([]})"'.]\)\s\|\w\)\@<!<<\z(\h\w*\)\ze\%(.*<<-\=['`"]\=\h\)\@!+hs=s+2	matchgroup=detailRubyStringDelimiter end=+^\z1$+ contains=detailRubyHeredocStart,detailRubyHeredoc,@detailRubyStringSpecial fold keepend
syn region detailRubyString start=+\%(\%(class\|::\)\_s*\|\%([]})"'.]\)\s\|\w\)\@<!<<"\z([^"]*\)"\ze\%(.*<<-\=['`"]\=\h\)\@!+hs=s+2	matchgroup=detailRubyStringDelimiter end=+^\z1$+ contains=detailRubyHeredocStart,detailRubyHeredoc,@detailRubyStringSpecial fold keepend
syn region detailRubyString start=+\%(\%(class\|::\)\_s*\|\%([]})"'.]\)\s\|\w\)\@<!<<'\z([^']*\)'\ze\%(.*<<-\=['`"]\=\h\)\@!+hs=s+2	matchgroup=detailRubyStringDelimiter end=+^\z1$+ contains=detailRubyHeredocStart,detailRubyHeredoc			fold keepend
syn region detailRubyString start=+\%(\%(class\|::\)\_s*\|\%([]})"'.]\)\s\|\w\)\@<!<<`\z([^`]*\)`\ze\%(.*<<-\=['`"]\=\h\)\@!+hs=s+2	matchgroup=detailRubyStringDelimiter end=+^\z1$+ contains=detailRubyHeredocStart,detailRubyHeredoc,@detailRubyStringSpecial fold keepend

syn region detailRubyString start=+\%(\%(class\|::\)\_s*\|\%([]}).]\)\s\|\w\)\@<!<<-\z(\h\w*\)\ze\%(.*<<-\=['`"]\=\h\)\@!+hs=s+3    matchgroup=detailRubyStringDelimiter end=+^\s*\zs\z1$+ contains=detailRubyHeredocStart,@detailRubyStringSpecial fold keepend
syn region detailRubyString start=+\%(\%(class\|::\)\_s*\|\%([]}).]\)\s\|\w\)\@<!<<-"\z([^"]*\)"\ze\%(.*<<-\=['`"]\=\h\)\@!+hs=s+3  matchgroup=detailRubyStringDelimiter end=+^\s*\zs\z1$+ contains=detailRubyHeredocStart,@detailRubyStringSpecial fold keepend
syn region detailRubyString start=+\%(\%(class\|::\)\_s*\|\%([]}).]\)\s\|\w\)\@<!<<-'\z([^']*\)'\ze\%(.*<<-\=['`"]\=\h\)\@!+hs=s+3  matchgroup=detailRubyStringDelimiter end=+^\s*\zs\z1$+ contains=detailRubyHeredocStart		     fold keepend
syn region detailRubyString start=+\%(\%(class\|::\)\_s*\|\%([]}).]\)\s\|\w\)\@<!<<-`\z([^`]*\)`\ze\%(.*<<-\=['`"]\=\h\)\@!+hs=s+3  matchgroup=detailRubyStringDelimiter end=+^\s*\zs\z1$+ contains=detailRubyHeredocStart,@detailRubyStringSpecial fold keepend

if exists('main_syntax') && main_syntax == 'eruby'
  let b:detailRuby_no_expensive = 1
end

syn match  detailRubyAliasDeclaration    "[^[:space:];#.()]\+" contained contains=detailRubySymbol,detailRubyGlobalVariable,detailRubyPredefinedVariable nextgroup=detailRubyAliasDeclaration2 skipwhite
syn match  detailRubyAliasDeclaration2   "[^[:space:];#.()]\+" contained contains=detailRubySymbol,detailRubyGlobalVariable,detailRubyPredefinedVariable
syn match  detailRubyMethodDeclaration   "[^[:space:];#(]\+"	 contained contains=detailRubyConstant,detailRubyBoolean,detailRubyPseudoVariable,detailRubyInstanceVariable,detailRubyClassVariable,detailRubyGlobalVariable
syn match  detailRubyClassDeclaration    "[^[:space:];#<]\+"	 contained contains=detailRubyConstant,detailRubyOperator
syn match  detailRubyModuleDeclaration   "[^[:space:];#<]\+"	 contained contains=detailRubyConstant,detailRubyOperator
syn match  detailRubyFunction "\<[_[:alpha:]][_[:alnum:]]*[?!=]\=[[:alnum:]_.:?!=]\@!" contained containedin=detailRubyMethodDeclaration
syn match  detailRubyFunction "\%(\s\|^\)\@<=[_[:alpha:]][_[:alnum:]]*[?!=]\=\%(\s\|$\)\@=" contained containedin=detailRubyAliasDeclaration,detailRubyAliasDeclaration2
syn match  detailRubyFunction "\%([[:space:].]\|^\)\@<=\%(\[\]=\=\|\*\*\|[+-]@\=\|[*/%|&^~]\|<<\|>>\|[<>]=\=\|<=>\|===\|==\|=\~\|`\)\%([[:space:];#(]\|$\)\@=" contained containedin=detailRubyAliasDeclaration,detailRubyAliasDeclaration2,detailRubyMethodDeclaration

syn cluster detailRubyDeclaration contains=detailRubyAliasDeclaration,detailRubyAliasDeclaration2,detailRubyMethodDeclaration,detailRubyModuleDeclaration,detailRubyClassDeclaration,detailRubyFunction,detailRubyBlockParameter

" Keywords
" Note: the following keywords have already been defined:
" begin case class def do end for if module unless until while
syn match   detailRubyControl	       "\<\%(and\|break\|in\|next\|not\|or\|redo\|rescue\|retry\|return\)\>[?!]\@!"
syn match   detailRubyOperator       "\<defined?" display
syn match   detailRubyKeyword	       "\<\%(super\|yield\)\>[?!]\@!"
syn match   detailRubyBoolean	       "\<\%(true\|false\)\>[?!]\@!"
syn match   detailRubyPseudoVariable "\<\%(nil\|self\|__ENCODING__\|__FILE__\|__LINE__\|__callee__\|__method__\)\>[?!]\@!" " TODO: reorganise
syn match   detailRubyBeginEnd       "\<\%(BEGIN\|END\)\>[?!]\@!"

" Expensive Mode - match 'end' with the appropriate opening keyword for syntax
" based folding and special highlighting of module/class/method definitions
if !exists("b:detailRuby_no_expensive") && !exists("detailRuby_no_expensive")
  syn match  detailRubyDefine "\<alias\>"  nextgroup=detailRubyAliasDeclaration  skipwhite skipnl
  syn match  detailRubyDefine "\<def\>"    nextgroup=detailRubyMethodDeclaration skipwhite skipnl
  syn match  detailRubyDefine "\<undef\>"  nextgroup=detailRubyFunction	     skipwhite skipnl
  syn match  detailRubyClass	"\<class\>"  nextgroup=detailRubyClassDeclaration  skipwhite skipnl
  syn match  detailRubyModule "\<module\>" nextgroup=detailRubyModuleDeclaration skipwhite skipnl

  syn region detailRubyBlockExpression       matchgroup=detailRubyControl	  start="\<begin\>" end="\<end\>" contains=ALLBUT,@detailRubyNotTop fold
  syn region detailRubyMethodBlock start="\<def\>"	matchgroup=detailRubyDefine end="\%(\<def\_s\+\)\@<!\<end\>" contains=ALLBUT,@detailRubyNotTop fold
  syn region detailRubyBlock	     start="\<class\>"	matchgroup=detailRubyClass  end="\<end\>"		       contains=ALLBUT,@detailRubyNotTop fold
  syn region detailRubyBlock	     start="\<module\>" matchgroup=detailRubyModule end="\<end\>"		       contains=ALLBUT,@detailRubyNotTop fold

  " modifiers
  syn match detailRubyConditionalModifier "\<\%(if\|unless\)\>"    display
  syn match detailRubyRepeatModifier	     "\<\%(while\|until\)\>" display

  syn region detailRubyDoBlock      matchgroup=detailRubyControl start="\<do\>" end="\<end\>"                 contains=ALLBUT,@detailRubyNotTop fold
  " curly bracket block or hash literal
  syn region detailRubyCurlyBlock   start="{" end="}"							  contains=ALLBUT,@detailRubyNotTop fold
  syn region detailRubyArrayLiteral matchgroup=detailRubyArrayDelimiter start="\%(\w\|[\]})]\)\@<!\[" end="]" contains=ALLBUT,@detailRubyNotTop fold

  " statements without 'do'
  syn region detailRubyCaseExpression	       matchgroup=detailRubyConditional start="\<case\>"  end="\<end\>" contains=ALLBUT,@detailRubyNotTop fold
  syn region detailRubyConditionalExpression matchgroup=detailRubyConditional start="\%(\%(^\|\.\.\.\=\|[{:,;([<>~\*/%&^|+=-]\|\%(\<[_[:lower:]][_[:alnum:]]*\)\@<![?!]\)\s*\)\@<=\%(if\|unless\)\>" end="\<end\>" contains=ALLBUT,@detailRubyNotTop fold

  syn match detailRubyConditional "\<\%(then\|else\|when\)\>[?!]\@!"	contained containedin=detailRubyCaseExpression
  syn match detailRubyConditional "\<\%(then\|else\|elsif\)\>[?!]\@!" contained containedin=detailRubyConditionalExpression

  syn match detailRubyExceptional	  "\<\%(\%(\%(;\|^\)\s*\)\@<=rescue\|else\|ensure\)\>[?!]\@!" contained containedin=detailRubyBlockExpression
  syn match detailRubyMethodExceptional "\<\%(\%(\%(;\|^\)\s*\)\@<=rescue\|else\|ensure\)\>[?!]\@!" contained containedin=detailRubyMethodBlock

  " statements with optional 'do'
  syn region detailRubyOptionalDoLine   matchgroup=detailRubyRepeat start="\<for\>[?!]\@!" start="\%(\%(^\|\.\.\.\=\|[{:,;([<>~\*/%&^|+-]\|\%(\<[_[:lower:]][_[:alnum:]]*\)\@<![!=?]\)\s*\)\@<=\<\%(until\|while\)\>" matchgroup=detailRubyOptionalDo end="\%(\<do\>\)" end="\ze\%(;\|$\)" oneline contains=ALLBUT,@detailRubyNotTop
  syn region detailRubyRepeatExpression start="\<for\>[?!]\@!" start="\%(\%(^\|\.\.\.\=\|[{:,;([<>~\*/%&^|+-]\|\%(\<[_[:lower:]][_[:alnum:]]*\)\@<![!=?]\)\s*\)\@<=\<\%(until\|while\)\>" matchgroup=detailRubyRepeat end="\<end\>" contains=ALLBUT,@detailRubyNotTop nextgroup=detailRubyOptionalDoLine fold

  if !exists("detailRuby_minlines")
    let detailRuby_minlines = 50
  endif
  exec "syn sync minlines=" . detailRuby_minlines

else
  syn match detailRubyControl "\<def\>[?!]\@!"    nextgroup=detailRubyMethodDeclaration skipwhite skipnl
  syn match detailRubyControl "\<class\>[?!]\@!"  nextgroup=detailRubyClassDeclaration  skipwhite skipnl
  syn match detailRubyControl "\<module\>[?!]\@!" nextgroup=detailRubyModuleDeclaration skipwhite skipnl
  syn match detailRubyControl "\<\%(case\|begin\|do\|for\|if\|unless\|while\|until\|else\|elsif\|ensure\|then\|when\|end\)\>[?!]\@!"
  syn match detailRubyKeyword "\<\%(alias\|undef\)\>[?!]\@!"
endif

" Special Methods
if !exists("detailRuby_no_special_methods")
  syn keyword detailRubyAccess    public protected private public_class_method private_class_method module_function
  " attr is a common variable name
  syn match   detailRubyAttribute "\%(\%(^\|;\)\s*\)\@<=attr\>\(\s*[.=]\)\@!"
  syn keyword detailRubyAttribute attr_accessor attr_reader attr_writer
  syn match   detailRubyControl   "\<\%(exit!\|\%(abort\|at_exit\|exit\|fork\|loop\|trap\)\>[?!]\@!\)"
  syn keyword detailRubyEval	    eval class_eval instance_eval module_eval
  syn keyword detailRubyException raise fail catch throw
  " false positive with 'include?'
  syn match   detailRubyInclude   "\<include\>[?!]\@!"
  syn keyword detailRubyInclude   autoload extend load require require_relative
  syn keyword detailRubyKeyword   callcc caller lambda proc
endif

" Comments and Documentation
syn match   detailRubySharpBang "\%^#!.*" display
syn keyword detailRubyTodo	  FIXME NOTE TODO OPTIMIZE XXX contained
syn match   detailRubyComment   "#.*" contains=detailRubySharpBang,detailRubySpaceError,detailRubyTodo,@Spell
if !exists("detailRuby_no_comment_fold")
  syn region detailRubyMultilineComment start="\%(\%(^\s*#.*\n\)\@<!\%(^\s*#.*\n\)\)\%(\(^\s*#.*\n\)\{1,}\)\@=" end="\%(^\s*#.*\n\)\@<=\%(^\s*#.*\n\)\%(^\s*#\)\@!" contains=detailRubyComment transparent fold keepend
  syn region detailRubyDocumentation	  start="^=begin\ze\%(\s.*\)\=$" end="^=end\%(\s.*\)\=$" contains=detailRubySpaceError,detailRubyTodo,@Spell fold
else
  syn region detailRubyDocumentation	  start="^=begin\s*$" end="^=end\s*$" contains=detailRubySpaceError,detailRubyTodo,@Spell
endif

" Note: this is a hack to prevent 'keywords' being highlighted as such when called as methods with an explicit receiver
syn match detailRubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(alias\|and\|begin\|break\|case\|class\|def\|defined\|do\|else\)\>"		  transparent contains=NONE
syn match detailRubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(elsif\|end\|ensure\|false\|for\|if\|in\|module\|next\|nil\)\>"		  transparent contains=NONE
syn match detailRubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(not\|or\|redo\|rescue\|retry\|return\|self\|super\|then\|true\)\>"		  transparent contains=NONE
syn match detailRubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(undef\|unless\|until\|when\|while\|yield\|BEGIN\|END\|__FILE__\|__LINE__\)\>" transparent contains=NONE

syn match detailRubyKeywordAsMethod "\<\%(alias\|begin\|case\|class\|def\|do\|end\)[?!]" transparent contains=NONE
syn match detailRubyKeywordAsMethod "\<\%(if\|module\|undef\|unless\|until\|while\)[?!]" transparent contains=NONE

syn match detailRubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(abort\|at_exit\|attr\|attr_accessor\|attr_reader\)\>"	transparent contains=NONE
syn match detailRubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(attr_writer\|autoload\|callcc\|catch\|caller\)\>"		transparent contains=NONE
syn match detailRubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(eval\|class_eval\|instance_eval\|module_eval\|exit\)\>"	transparent contains=NONE
syn match detailRubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(extend\|fail\|fork\|include\|lambda\)\>"			transparent contains=NONE
syn match detailRubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(load\|loop\|private\|proc\|protected\)\>"			transparent contains=NONE
syn match detailRubyKeywordAsMethod "\%(\%(\.\@<!\.\)\|::\)\_s*\%(public\|require\|require_relative\|raise\|throw\|trap\)\>"	transparent contains=NONE

" __END__ Directive
syn region detailRubyData matchgroup=detailRubyDataDirective start="^__END__$" end="\%$" fold

hi def link detailRubyClass			detailRubyDefine
hi def link detailRubyModule			detailRubyDefine
hi def link detailRubyMethodExceptional	detailRubyDefine
hi def link detailRubyDefine			Define
hi def link detailRubyFunction		Function
hi def link detailRubyConditional		Conditional
hi def link detailRubyConditionalModifier	detailRubyConditional
hi def link detailRubyExceptional		detailRubyConditional
hi def link detailRubyRepeat			Repeat
hi def link detailRubyRepeatModifier		detailRubyRepeat
hi def link detailRubyOptionalDo		detailRubyRepeat
hi def link detailRubyControl			Statement
hi def link detailRubyInclude			Include
hi def link detailRubyInteger			Number
hi def link detailRubyASCIICode		Character
hi def link detailRubyFloat			Float
hi def link detailRubyBoolean			Boolean
hi def link detailRubyException		Exception
if !exists("detailRuby_no_identifiers")
  hi def link detailRubyIdentifier		Identifier
else
  hi def link detailRubyIdentifier		NONE
endif
hi def link detailRubyClassVariable		detailRubyIdentifier
hi def link detailRubyConstant		Type
hi def link detailRubyGlobalVariable		detailRubyIdentifier
hi def link detailRubyBlockParameter		detailRubyIdentifier
hi def link detailRubyInstanceVariable	detailRubyIdentifier
hi def link detailRubyPredefinedIdentifier	detailRubyIdentifier
hi def link detailRubyPredefinedConstant	detailRubyPredefinedIdentifier
hi def link detailRubyPredefinedVariable	detailRubyPredefinedIdentifier
hi def link detailRubySymbol			Constant
hi def link detailRubyKeyword			Keyword
hi def link detailRubyOperator		Operator
hi def link detailRubyBeginEnd		Statement
hi def link detailRubyAccess			Statement
hi def link detailRubyAttribute		Statement
hi def link detailRubyEval			Statement
hi def link detailRubyPseudoVariable		Constant

hi def link detailRubyComment			Comment
hi def link detailRubyData			Comment
hi def link detailRubyDataDirective		Delimiter
hi def link detailRubyDocumentation		Comment
hi def link detailRubyTodo			Todo

hi def link detailRubyQuoteEscape		detailRubyStringEscape
hi def link detailRubyStringEscape		Special
hi def link detailRubyInterpolationDelimiter	Delimiter
hi def link detailRubyNoInterpolation		detailRubyString
hi def link detailRubySharpBang		PreProc
hi def link detailRubyRegexpDelimiter		detailRubyStringDelimiter
hi def link detailRubySymbolDelimiter		detailRubyStringDelimiter
hi def link detailRubyStringDelimiter		Delimiter
hi def link detailRubyHeredoc			detailRubyString
hi def link detailRubyString			String
hi def link detailRubyRegexpEscape		detailRubyRegexpSpecial
hi def link detailRubyRegexpQuantifier	detailRubyRegexpSpecial
hi def link detailRubyRegexpAnchor		detailRubyRegexpSpecial
hi def link detailRubyRegexpDot		detailRubyRegexpCharClass
hi def link detailRubyRegexpCharClass		detailRubyRegexpSpecial
hi def link detailRubyRegexpSpecial		Special
hi def link detailRubyRegexpComment		Comment
hi def link detailRubyRegexp			detailRubyString

hi def link detailRubyInvalidVariable		Error
hi def link detailRubyError			Error
hi def link detailRubySpaceError		detailRubyError

let b:current_syntax = "ruby"

" vim: nowrap sw=2 sts=2 ts=8 noet:
