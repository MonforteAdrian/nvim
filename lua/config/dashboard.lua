require('dashboard').setup ({

db.setup({
    theme = 'doom',
    config = {
        header = {
            [[                                                                                   ]],
            [[                                                                                   ]],
            [[                                                                                   ]],
            [[ =================     ===============     ===============   ========  ========    ]],
            [[ \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //    ]],
            [[ ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||    ]],
            [[ || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||    ]],
            [[ ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||    ]],
            [[ || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||    ]],
            [[ ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||    ]],
            [[ || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||    ]],
            [[ ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||    ]],
            [[ ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||    ]],
            [[ ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||    ]],
            [[ ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||    ]],
            [[ ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||    ]],
            [[ ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||    ]],
            [[ ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||    ]],
            [[ ||.=='    _-'                                                     `' |  /==.||    ]],
            [[ =='    _-'                        N E O V I M                         \/   `==    ]],
            [[ \   _-'                                                                `-_   /    ]],
            [[  `''                                                                      ``'     ]],
            [[                                                                                   ]],
        }, --your header
        center = {
            { icon = '  ', desc = 'Find File    ', action = 'Telescope find_files hidden=true' },
            { icon = '  ', desc = 'Find Image   ', action = 'Telescope media_files' },
            { icon = '  ', desc = 'Search Text  ', action = 'Telescope live_grep hidden=true' },
            { icon = '  ', desc = 'Config       ', action = 'Telescope find_files hidden=true cwd=~/.config/' },
        },
        footer = { 'Do one thing, do it well - Unix Philosophy' }, --your footer
    },
    hide = {
        statusline,
        winbar,
    },
})
-- Highlight Group
--DashboardHeader DashboardCenter DashboardCenterIcon DashboardShortCut DashboardFooter
