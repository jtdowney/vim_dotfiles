map <silent> <LocalLeader>vr :call VimuxRunCommand("clear && lein repl")<CR>
map <silent> <LocalLeader>vf :wa<CR> mvgg<LocalLeader>vs 'v <LocalLeader>vs :call VimuxRunCommand("(run-tests)")<CR>
map <silent> <LocalLeader>rf :wa<CR> mvgg<LocalLeader>vs 'v <LocalLeader>vs :call VimuxRunCommand("(run-tests)")<CR>
map <silent> <LocalLeader>v( :let g:paredit_mode = 1<CR> :call PareditInitBuffer()<CR>
