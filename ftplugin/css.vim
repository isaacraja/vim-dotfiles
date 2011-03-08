" Remove ^M badness.
autocmd BufEnter *.css :%s/[ \t\r]\+$//e
