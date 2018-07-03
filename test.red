Red []

#do [kilo: 123]
#macro ['make-KB | 'make-KB to end] func [s e] [
    set in system/words 'kilo 345
    return reduce ['print get in system/words 'kilo]
]
do make-KB
#macro ['do-KB | 'do-KB to end] func [s e] [
    reduce ['print get in system/words 'kilo]
]
do do-KB