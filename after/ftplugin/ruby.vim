let ruby_operators = 1
highlight link rubyAccess detailedAccess
highlight link rubyAttribute detailedAttribute
highlight link rubyBeginEnd Statement " TODO
highlight link rubyBlockArgument detailedBlockArgument
highlight link rubyBlockExpression detailedBlockExpression
highlight link rubyBlockParameter detailedBlockParameter
highlight link rubyBlockParameter rubyIdentifier
highlight link rubyBlockParameterList detailedBlockParameterList
highlight link rubyBoolean detailedBoolean
highlight link rubyCaseExpression detailedConditionalExpression
highlight link rubyCharacter detailedASCIICode
highlight link rubyClass detailedClass
highlight link rubyClassBlock detailedBlock
highlight link rubyClassVariable detailedClassVariable
highlight link rubyGlobalVariable detailedGlobalVariable
highlight link rubyConditional Conditional
highlight link rubyConditionalExpression detailedConditionalExpression
highlight link rubyConditionalModifier detailedConditionalModifier
highlight link rubyConstant detailedConstant
highlight link rubyControl detailedControl
highlight link rubyData detailedData
highlight link rubyDataDirective detailedDataDirective
highlight link rubyDefine detailedDefine
highlight link rubyDoBlock detailedRepeatExpression
highlight link rubyEncoding detailedDirective
highlight link rubyEntity detailedRailsARAssociationMethod
highlight link rubyEval detailedEval
highlight link rubyException Exception
highlight link rubyExceptionHandler rubyConditional " No-show.
highlight link rubyFirstAndSecondCommentLine rubySharpBang
highlight link rubyFloat detailedFloat
highlight link rubyFunction detailedFunction
highlight link rubyInclude detailedInclude
highlight link rubyInstanceVariable detailedInstanceVariable
highlight link rubyInteger detailedInteger
highlight link rubyInterpolationDelimiter detailedInterpolationDelimiter
highlight link rubyKeyword Keyword
highlight link rubyMethodBlock detailedMethodBlock
highlight link rubyModule detailedModule
highlight link rubyModuleBlock detailedBlock
highlight link rubyNumberedBlockParam rubyBlockParameter
highlight link rubyNumberedBlockParamError rubyError
highlight link rubyOperator detailedOperator
highlight link rubyPredefinedConstant detailedPredefinedConstant
highlight link rubyPredefinedVariable detailedPredefinedVariable
highlight link rubyPseudoOperator rubyOperator " -= /= **= *= etc
highlight link rubyPseudoVariable detailedPseudoVariable
highlight link rubyQuoteEscape rubyStringEscape
highlight link rubyRegexpAnchor detailedRegexpAnchor
highlight link rubyRegexpCharClass detailedRegexpCharClass
highlight link rubyRegexpDelimiter detailedRegexpDelimiter
highlight link rubyRegexpDot detailedRegexpDot
highlight link rubyRegexpEscape detailedRegexpEscape
highlight link rubyRegexpQuantifier detailedRegexpQuantifier
highlight link rubyRegexpSpecial detailedRegexpSpecial
highlight link rubyRepeat detailedRepeat
highlight link rubyRepeatExpression detailedRepeatExpression
highlight link rubyRepeatModifier detailedRepeatModifier
highlight link rubySharpBang detailedSharpBang
highlight link rubySpaceError BadWhitespace
highlight link rubyStringDelimiter detailedStringDelimiter
highlight link rubyStringEscape Special
highlight link rubySymbol detailedSymbol

" Only linked highlights, not actual syntax:
" call s:make_obvious('rubyIdentifier')
" call s:make_obvious('rubyError')

" Pretty much just the leftover default:
" call s:make_obvious('rubyLocalVariableOrMethod')

" Gets all [{()}] within any {}'s. Not very useful AFAICT:
" call s:make_obvious('rubyCurlyBlock')

" These mess up on first ] of [a[1]]. Seems plain busted.
" call s:make_obvious('rubyArrayDelimiter')
" call s:make_obvious('rubyArrayLiteral')

" Mere implementation details, AFAICT:
" call s:make_obvious('rubyNestedParentheses')
" call s:make_obvious('rubyNestedCurlyBraces')
" call s:make_obvious('rubyNestedAngleBrackets')
" call s:make_obvious('rubyNestedSquareBrackets')
" call s:make_obvious('rubyDelimEscape')
" call s:make_obvious('rubySymbolDelimiter')

" No-show: call s:make_obvious('rubyMethodDeclaration')
" Not quite sure why these don't show up:
" call s:make_obvious('rubyRegexpParens')
" call s:make_obvious('rubyRegexpBrackets')
" XXX no clue why this wont show up: call s:make_obvious('rubyHeredocStart')
" TODO: fix these: call s:make_obvious('rubyAliasDeclaration2')
" call s:make_obvious('rubyAliasDeclaration')
" TODO! call s:make_obvious('rubyClassDeclaration')
" call s:make_obvious('rubyDeclaration')
" call s:make_obvious('rubyModuleDeclaration')
" TODO: call s:make_obvious('rubyOptionalDo')
" TODO: call s:make_obvious('rubyOptionalDoLine')
