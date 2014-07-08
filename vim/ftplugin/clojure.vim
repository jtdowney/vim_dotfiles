map <silent> <LocalLeader>vr :call VimuxRunCommand("clear && lein repl")<CR>
map <silent> <LocalLeader>vf :wa<CR> mvgg<LocalLeader>vs 'v <LocalLeader>vs :call VimuxRunCommand("(run-tests)")<CR>
map <silent> <LocalLeader>rf :wa<CR> mvgg<LocalLeader>vs 'v <LocalLeader>vs :call VimuxRunCommand("(run-tests)")<CR>
map <silent> <LocalLeader>v( :let g:paredit_mode = 1<CR> :call PareditInitBuffer()<CR>

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['red',         'firebrick3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
