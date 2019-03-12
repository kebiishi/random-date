function! s:getRandom(min, max)
	let reltime = reltime()[1]
	if reltime >= 0
		return reltime()[1] % (a:max - a:min + 1) + a:min
	else
		return -1 * reltime()[1] % (a:max - a:min + 1) + a:min
	endif
endfunction

function! s:getRandomDate()
	return s:getRandom(1993, 2020) . '-' . s:getRandom(1, 12) . '-' . s:getRandom(1, 28)
endfunction

function! s:getRandomDateTime()
	return s:getRandomDate() . ' ' . s:getRandom(0, 24) . ':' . s:getRandom(0, 59) . ':' . s:getRandom(0, 59)
endfunction

function! s:insertRandomDateTime()
	let dateTime = s:getRandomDateTime()
	execute ":normal a" . dateTime
endfunction

command! RandDateTime call s:insertRandomDateTime()
