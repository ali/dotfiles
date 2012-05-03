if exists("did_load_filetypes")
  finish
endif

runtime! ftdetect/*.vim

augroup filetypedetect
  " au! commands to set the filetype go here

  " tumblr.vim: http://www.vim.org/scripts/script.php?script_id=3011
  au! BufRead,BufNewFile *.tumblr.html setfiletype tumblr
augroup END
