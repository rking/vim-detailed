" The default syntax/ruby.vim gets this way wrong (only does 2 chars and is
" transparent):
syn match rubyBlockArgument "&[_[:lower:]][_[:alnum:]]*" contains=NONE display

" This was disabled in
" https://github.com/vim-ruby/vim-ruby/commit/074200ffa39b19baf9d9750d399d53d97f21ee07
" and removed in
" https://github.com/vim-ruby/vim-ruby/commit/eba523334fe14e5c9b9585a287a336317da26d70
syn match rubyBlockParameter "\%(\h\|[^\x00-\x7F]\)\%(\w\|[^\x00-\x7F]\)*" contained
syn cluster rubyDeclaration add=rubyBlockParameter
syn region rubyBlockParameterList start="\%(\%(\<do\>\|{\)\_s*\)\@32<=|" end="|" contains=rubyBlockParameter,rubySplatOperator,rubyDoubleSplatOperator,rubyProcOperator
" This is new though
syn match rubyNumberedBlockParam "_[1-9]" display
syn match rubyNumberedBlockParamError "_0" display

" Bonus!
syn match detailedInitialize '\<initialize\>' contained containedin=rubyMethodDeclaration

" remove TODO, FIXME, XXX from rubyTodo to let detailed* handle them
syn keyword rubyTodo NOTE OPTIMIZE HACK REVIEW todo contained
syn match rubyComment "#.*" contains=@rubyCommentSpecial,rubySpaceError,detailedTodo,detailedFixme,detailedXxx,@Spell

" Steal this back from the too-generic 'rubyControl':
syn match detailedExits "\<\%(exit!\|\%(abort\|at_exit\|exit\|fork\|trap\)\>[?!]\@!\)"

" TODO: also handle %(…), etc
syn region detailedInterpolatedString matchgroup=detailedInterpolatedStringDelimiter start="\"" end="\"" skip="\\\\\|\\\"" contains=@rubyStringSpecial,@Spell fold
" TODO: Also, %x(). Anything else?
syn region detailedExecutedString matchgroup=detailedExecutedStringDelimiter start="`" end="`"  skip="\\\\\|\\`"  contains=@rubyStringSpecial fold

syn match rubyEncodingDirective "\cencoding: *utf-8" contained
