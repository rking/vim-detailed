syntax match jsPropertyAccess '\.[$_[:alnum:]]\+' contains=jsPrototype,jsProbablyAClass
syntax clear jsFuncCall
syntax match jsFuncCall '\.\?\([$_[:alnum:]]\+\)(\@=' contains=jsPrototype,jsProbablyAClass
syntax match jsProbablyAClass "\<[A-Z][_[:alnum:]]\{-}\>" contains=NONE
syntax match jsFunctionKey '\<[a-zA-Z_$][0-9a-zA-Z_$]*\>\(\s*:\s*function\s*\)\@='
syntax clear jsObjectKey
syntax match jsObjectKey '\<[a-zA-Z_$][0-9a-zA-Z_$]*\>\(\s*:\)\@=' contains=jsFunctionKey
syntax keyword jsFunction function
syntax keyword jsPrototype prototype hasOwnProperty
syntax clear jsFuncArgs
syntax region jsFuncArgs start='\(function\s*[$_[:alnum:]]\{-}(\)\@<=[$_a-zA-Z]' end='[$_[:alnum:]])\@='lc=1 contains=jsProbablyAClass, jsUndefined, jsNull, jsNamedFunction
syntax match jsNamedFunction '\(function\s\)\@<=[$_[:alnum:]]\{-}\ze('
