" Remove ^M badness.
autocmd BufEnter *.js :%s/[ \t\r]\+$//e
