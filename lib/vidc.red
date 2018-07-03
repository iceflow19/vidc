Red [
    Title: "VID Components"
]

; Set up the VIDC registry
#do [
    if not value? 'vidc-registry [
        vidc-registry: make hash! []
    ]
]

#macro [#vidc string! [ block! | block! to end]] func [s e] [
    ; Get a mutable handle to the registry
    registry: get in system/words 'vidc-registry
    name: s/2
    root: s/3

    template-rule: [ any [
        'static block! block! |
        'draw any [lit-word!] block! |
        'render opt [issue!] any [lit-word!] block!
    ]

    prop-rule: [
        any [email!]
    ]

    bind-rule: [ any [

    ]]

    ; Parsing Grammar
    rules: [ any [ 1 [
        'template template-rule |   ; Matches on a template block
        'properties prop-rule |     ; Matches on a properties block
        'bind bind-rule |           ; Matches on a bind block
        method-rule                 ; Matches on methods
    ]]]

    parse root rules
]