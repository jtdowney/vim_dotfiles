map <silent> <LocalLeader>rb :wa<CR> :RunAllRubyTests<CR>
map <silent> <LocalLeader>rc :wa<CR> :RunRubyFocusedContext<CR>
map <silent> <LocalLeader>rf :wa<CR> :RunRubyFocusedTest<CR>
map <silent> <LocalLeader>rs :!ruby -c %<CR>
setlocal iskeyword+=?

function! RubyInsertDebug()
  let l:name = input("Variable name: ")
  execute "normal! Oputs \"DBG " . name . ": #{" . name . ".inspect}\""
endfunction
map <silent> <C-D> :call RubyInsertDebug()<CR>
