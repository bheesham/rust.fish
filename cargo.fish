complete -e -c cargo

function _c
	complete -c cargo $argv
end

_c -s h -l help 
_c -s V -l version -d 'Print version info and exit'
_c -l list -d 'List installed commands'
_c -s v -l verbose -d 'Use verbose output'
_c -s q -l quiet -d 'No output printed to stdout'

set _cargo_commands (cargo --list | tail -n +2 | tr -d " ")

function _is
	if contains $argv (commandline -cop);
		return 0
	end
	return 1
end

_c -f -c cargo -a '$_cargo_commands'

for x in bench build clean doc fetch generate-lockfile \
		locate-project package pkgid publish \
		read-manifest run rustc test update \
		verify-project;
	_c -r -n "_is $x" -l manifest-path
end

for x in bench build clean doc rustc test update;
	_c -x -n "_is $x" -s p -l spec
end

for x in bench build clean doc run rustc test;
	_c -x -n "_is $x" -l target
end

for x in bench build rustc test;
	_c -n "_is $x" -l bench
	_c -n "_is $x" -l lib
	_c -x -n "_is $x" -l test
end

for x in bench build run rustc test;
	_c -x -n "_is $x" -l bin
	_c -x -n "_is $x" -l example
end

for x in build run rustc test;
	_c -n "_is $x" -l release
end

for x in bench test;
	_c -n "_is $x" -l no-run
end

for x in bench build doc run rustc test;
	_c -x -n "_is $x" -s j -l jobs
	_c -x -n "_is $x" -l features
	_c -n "_is $x" -l no-default-features
end

_c -n '_is doc' -l no-deps

_c -x -n '_is new' -l vcs
_c -x -n '_is new' -l name

# This bin does not take any arguments which is why it is not defined above.
_c -n '_is new' -l bin

_c -x -n '_is git-checkout' -l url
_c -x -n '_is git-checkout' -l reference

for x in login publish search;
	_c -x -n "_is $x" -l host
end

_c -n '_is doc' -l open

_c -r -n '_is owner' -s a -l add 
_c -r -n '_is owner' -s r -l remove 

for x in owner yank;
	_c -r -n "_is $x" -l index 
end

for x in owner publish yank;
	_c -x -n "_is $x" -l token 
end

_c -n '_is package' -l no-verify 
_c -n '_is package' -l no-metadata 

_c -n '_is update' -l aggressive
_c -x -n '_is update' -l precise

_c -x -n '_is yank' -l vers
_c -n '_is yank' -l undo
