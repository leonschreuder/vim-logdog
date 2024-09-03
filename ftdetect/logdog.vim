fun! s:DetectLogdog()
	" Detect from the 2nd line. The 1st line could be:
	" -------- beginning of system
	if line('$') > 1 && getline(2) =~# '.* [F|E|W|I|D|V] .*:.*'
		set filetype=logdog
	endif
endfun

au BufNewFile,BufRead *.lc set filetype=logdog
au BufNewFile,BufRead *.logcat set filetype=logdog
au BufNewFile,BufRead * call s:DetectLogdog()


