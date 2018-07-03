#vidc "custom-widget" [

    template [

        static [300x30] [
            a: fragment
        ]

        draw 'size [
            pen black
            line-width 1
            box 0x0 (size - 1x1)
        ]

        render #a 'size [
            @style codepane
            across
            @style scroller
            origin 1x1
            codepane (size - 14x2)
            space 0x1
            pad 0x0
            scroller ((size * 0x1) + 12x0)
        ]
    ]

    properties [
        @foo
    ]

    bind [
        @foo <-> code/hello
    ]

    init: [
        face/color: 30.30.30.0
    ]
    
    on-wheel: [
        if not empty? face/data [
            scroll-bar: face/pane/2
            scroll-bar/extra/scroll-data scroll-bar event
            scroll-bar/extra/redraw scroll-bar
            code-pane: face/pane/1
            code-pane/pane/1/offset/y: to integer! scroll-bar/data * (code-pane/size/y - code-pane/pane/1/size/y)
            show reduce [scroll-bar code-pane]
        ]
    ]
]