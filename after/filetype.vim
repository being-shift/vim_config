augroup nginx
	autocmd BufRead,BufNewFile /etc/nginx/* setlocal filetpe=nginx
autoup END

augroup sql
	autocmd!
	autocmd BufNew,BufEnter /tmp/sql* setlocal filetpe=sql
	autocmd BufNew,BufEnter ~/afiedt.buf* setlocal filetpe=sql
autoup END
