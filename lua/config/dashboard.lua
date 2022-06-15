vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_header = {
[[  =================     ===============     ===============   ========  ========  ]],
[[  \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //  ]],
[[  ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||  ]],
[[  || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||  ]],
[[  ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||  ]],
[[  || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||  ]],
[[  ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||  ]],
[[  || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||  ]],
[[  ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||  ]],
[[  ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||  ]],
[[  ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||  ]],
[[  ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||  ]],
[[  ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||  ]],
[[  ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||  ]],
[[  ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||  ]],
[[  ||.=='    _-'                                                     `' |  /==.||  ]],
[[  =='    _-'                        N E O V I M                         \/   `==  ]],
[[  \   _-'                                                                `-_   /  ]],
[[   `''                                                                      ``'   ]],
}

vim.g.dashboard_custom_section = {
  a = {description = {'  Find File    '}, command = 'Telescope find_files hidden=true'},
  b = {description = {'  Find Image   '}, command = 'Telescope media_files'},
  c = {description = {'  Recent Files '}, command = 'Telescope oldfiles hidden=true'},
  d = {description = {'  Search Text  '}, command = 'Telescope live_grep hidden=true'},
  e = {description = {'  Config       '}, command = 'Telescope find_files hidden=true cwd=~/.config/'}
}

vim.g.dashboard_custom_footer = {'Do one thing, do it well - Unix Philosophy'}
