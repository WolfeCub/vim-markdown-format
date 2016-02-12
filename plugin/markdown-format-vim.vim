function! HeaderOne()
	execute "normal! yypv$r="
endfunction

function! HeaderTwo()
	execute "normal! yypv$r-"
endfunction

function! HeaderThree()
	execute "normal! 0i###\<space>"
endfunction

function! HeaderFour()
	execute "normal! 0i####\<space>"
endfunction

function! HeaderFive()
	execute "normal! 0i#####\<space>"
endfunction

function! HeaderSix()
	execute "normal! 0i######\<space>"
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
endfunction

function! MakeNumberedList()
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

function! FencedCodeBlock()
	let [lnum1, col1] = getpos("'<")[1:2]
	let [lnum2, col2] = getpos("'>")[1:2]

	call append(lnum2, "```")
	call append(lnum1 - 1, "```")
	exec "normal! k"
endfunction
