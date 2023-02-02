syn keyword whyKeyword let  

syn keyword whyConditional if else 

syn match whyOperator display "\%(+\|-\|/\|*\|=\|:=\|\^\|&\||\|!\|>\|<\|%\)=\?"

syn match whyIdentifier '"([a-zA-z]|_)*"'

syn match whyLineComment "//.*$"
syn region whyBlockComment start=+/\*+ end=+\*/+

syn match whyNumbers '\d\+'

syn region whyStrings start=+"+ end=+"+ end=+$+ 

syn keyword whyBoolean true false

syn keyword	whyType int str bool void

syn match whyFuncCall "\w\(\w\)*("he=e-1,me=e-1


hi def link whyKeyword Keyword 

hi def link whyConditional Conditional

hi def link whyOperator Operator

hi def link whyIdentifier Identifier

hi def link whyLineComment Comment
hi def link whyBlockComment Comment

hi def link whyNumbers Number

hi def link whyStrings String

hi def link whyType Type

hi def link whyBoolean Boolean

hi def link whyFuncCall Function
