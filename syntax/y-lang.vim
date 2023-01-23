syn keyword basicKeywords if else let 

hi def link basicKeywords Statement

syn match identifiers '"([a-zA-z]|_)*"'

hi def link identifiers Identifier

syn match yComment "//.*$"
syn match yComment "/\*(.|(\\r\\n|\\r|\\n))*\*/"

hi def link yComment Comment


syn match yNumbers '\d\+'
hi def link yNumbers Number

syn match yStrings '".*"'
hi def link yStrings String
