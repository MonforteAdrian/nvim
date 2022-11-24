local db = require('dashboard')

db.default_executive = 'telescope'

db.custom_header = {
[[                                                                                  ]],
[[                                                                                  ]],
[[                                                                                  ]],
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
[[                                                                                  ]],
}

db.custom_center = {
  {icon = ' ', desc = 'Find File    ', action = 'Telescope find_files hidden=true'},
  {icon = ' ', desc = 'Find Image   ', action = 'Telescope media_files'},
  {icon = ' ', desc = 'Search Text  ', action = 'Telescope live_grep hidden=true'},
  {icon = ' ', desc = 'Config       ', action = 'Telescope find_files hidden=true cwd=~/.config/'}
}

db.custom_footer = {'Do one thing, do it well - Unix Philosophy'}

db.hide_statusline = true
db.hide_tabline = true
-- Highlight Group
--DashboardHeader DashboardCenter DashboardCenterIcon DashboardShortCut DashboardFooter
