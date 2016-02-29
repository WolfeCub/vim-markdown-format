function! MakeHeader(headnum)
	if a:headnum == 1
		execute "normal! yypv$r="
	elseif a:headnum == 2
		execute "normal! yypv$r-"
	elseif a:headnum == 3
		execute "normal! 0i###\<space>"
	elseif a:headnum == 4
		execute "normal! 0i####\<space>"
	elseif a:headnum == 5
		execute "normal! 0i#####\<space>"
	elseif a:headnum == 6
		execute "normal! 0i######\<space>"
	endif
endfunction

function! MakeList()
	let [lnum1, col1] = getpos("'<")[1:2]
	let [lnum2, col2] = getpos("'>")[1:2]

	let currline = split(getline(lnum1))
        
        if currline[0] == "*" || currline[0] != 0
                call MakeListTwo()
        else
                call MakeListOne()
        endif
endfunction

function! MakeListOne()
	let [lnum1, col1] = getpos("'<")[1:2]
	let [lnum2, col2] = getpos("'>")[1:2]

	let i = lnum1

	while i <= lnum2
		let temp = "* " . getline(i)
		call setline(i, temp)
		let i += 1
	endwhile
endfunction

function! MakeListTwo()
	let [lnum1, col1] = getpos("'<")[1:2]
	let [lnum2, col2] = getpos("'>")[1:2]

	let i = lnum1

	while i <= lnum2
		let line = split(getline(i))[1:-1]
		let var = join(line)
		let temp = "  - " . var
		call setline(i, temp)
		let i += 1
	endwhile

	let aboveln = split(getline(lnum1 - 1))
	let belowln = split(getline(lnum2 + 1))
	if aboveln != []
		let linenum = aboveln[0] + 1
	endif
	let i = lnum2 + 1

	let currline = split(getline(i))
	while (currline != [] && (currline[0] != 0 || currline[0] == '-'))
		if (currline[0] == '-')
			let i += 1
			let currline = split(getline(i))
		else
			let currline[0] = linenum . '.'
			let linenum += 1
			call setline(i, join(currline))
			let i += 1
			let currline = split(getline(i))
		endif
	endwhile

endfunction

function! MakeNumberedList()
	let [lnum1, col1] = getpos("'<")[1:2]
	let [lnum2, col2] = getpos("'>")[1:2]

        let currline = split(getline(lnum1))

        if currline[0] > 0 || currline[0] == "*"
            call MakeNumberedListTwo()
        else
            call MakeNumberedListOne()
        endif

endfunction

function! MakeNumberedListOne()
	let [lnum1, col1] = getpos("'<")[1:2]
	let [lnum2, col2] = getpos("'>")[1:2]

	let i = lnum1
	let j = 1

	while i <= lnum2
		let temp = j . ". " . getline(i)
		call setline(i, temp)
		let i += 1
		let j += 1
	endwhile
endfunction

function! MakeNumberedListTwo()
	let [lnum1, col1] = getpos("'<")[1:2]
	let [lnum2, col2] = getpos("'>")[1:2]

	let i = lnum1
        let j = 1

	while i <= lnum2
		let line = split(getline(i))[1:-1]
		let var = join(line)
		let temp = "  " . j . ". " . var
		call setline(i, temp)
		let i += 1
                let j += 1
	endwhile

	let aboveln = split(getline(lnum1 - 1))
	let belowln = split(getline(lnum2 + 1))
	if aboveln != []
		let linenum = aboveln[0] + 1
	endif
	let i = lnum2 + 1

	let currline = split(getline(i))
	while (currline != [] && (currline[0] != 0 || currline[0] == '-'))
		if (currline[0] == '-')
			let i += 1
			let currline = split(getline(i))
		else
			let currline[0] = linenum . '.'
			let linenum += 1
			call setline(i, join(currline))
			let i += 1
			let currline = split(getline(i))
		endif
	endwhile
        
endfunction

function! FencedCodeBlock()
	let [lnum1, col1] = getpos("'<")[1:2]
	let [lnum2, col2] = getpos("'>")[1:2]

	call append(lnum2, "```")
	call append(lnum1 - 1, "```")
	exec "normal! k"
endfunction

function! BlockQuote()
	let [lnum1, col1] = getpos("'<")[1:2]
	let [lnum2, col2] = getpos("'>")[1:2]

	let i = lnum1

	while i <= lnum2
		let temp = "> " . getline(i)
		call setline(i, temp)
		let i += 1
	endwhile
endfunction

function! MakeLink(mode)
        if a:mode == "v"
                let [lnum1, col1] = getpos("'<")[1:2]
                let [lnum2, col2] = getpos("'>")[1:2]

                call cursor(lnum1, col1)
                execute "normal! i[]("

                call cursor(lnum2, col2)
                execute "normal! a)"
                
                call cursor(lnum1, col1 + 1)

        elseif a:mode == "n"
                execute "normal! i[]()\<Esc>hh"
        endif
endfunction

command! -nargs=1 MakeHeader :call MakeHeader(<f-args>)
command! -nargs=0 MakeList :call MakeList()
command! -nargs=0 MakeListOne :call MakeListOne()
command! -nargs=0 MakeNumberedList :call MakeNumberedList()
command! -nargs=0 FencedCodeBlock :call FencedCodeBlock()
command! -nargs=0 BlockQuote :call BlockQuote()
command! -nargs=1 MakeLink :call MakeLink()
