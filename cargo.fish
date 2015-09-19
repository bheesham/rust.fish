# THIS FILE IS GENERATED!
complete -e -c cargo

complete -c cargo -s h -l help 
complete -c cargo -s V -l version -d 'Print version info and exit'
complete -c cargo -l list -d 'List installed commands'
complete -c cargo -s v -l verbose -d 'Use verbose output'
complete -c cargo -s q -l quiet -d 'No output printed to stdout'

set _cargo_commands (cargo --list | tail -n +2 | tr -d " ")

function _is
	if contains $argv (commandline -cop);
		return 0
	end
	return 1
end

complete -c cargo -f -c cargo -n '__fish_use_subcommand' -a '$_cargo_commands'
complete -c cargo -x -c cargo -n '_is help' -a '$_cargo_commands'

for x in bench build clean doc fetch generate-lockfile \
		locate-project package pkgid publish \
		read-manifest run rustc test update \
		verify-project;
	complete -c cargo -r -n "_is $x" -l manifest-path
end

for x in bench build clean doc rustc test update;
	complete -c cargo -x -n "_is $x" -s p -l spec
end

for x in bench build clean doc run rustc test;
	complete -c cargo -x -n "_is $x" -l target
end

for x in bench build rustc test;
	complete -c cargo -n "_is $x" -l bench
	complete -c cargo -n "_is $x" -l lib
	complete -c cargo -x -n "_is $x" -l test
end

for x in bench build run rustc test;
	complete -c cargo -x -n "_is $x" -l bin
	complete -c cargo -x -n "_is $x" -l example
end

for x in build run rustc test;
	complete -c cargo -n "_is $x" -l release
end

for x in bench test;
	complete -c cargo -n "_is $x" -l no-run
end

for x in bench build doc run rustc test;
	complete -c cargo -x -n "_is $x" -s j -l jobs
	complete -c cargo -x -n "_is $x" -l features
	complete -c cargo -n "_is $x" -l no-default-features
end

complete -c cargo -n '_is doc' -l no-deps

complete -c cargo -x -n '_is new' -l vcs
complete -c cargo -x -n '_is new' -l name

# This bin does not take any arguments which is why it is not defined above.
complete -c cargo -n '_is new' -l bin

complete -c cargo -x -n '_is git-checkout' -l url
complete -c cargo -x -n '_is git-checkout' -l reference

for x in login publish search;
	complete -c cargo -x -n "_is $x" -l host
end

complete -c cargo -n '_is doc' -l open

complete -c cargo -r -n '_is owner' -s a -l add 
complete -c cargo -r -n '_is owner' -s r -l remove 

for x in owner yank;
	complete -c cargo -r -n "_is $x" -l index 
end

for x in owner publish yank;
	complete -c cargo -x -n "_is $x" -l token 
end

complete -c cargo -n '_is package' -l no-verify 
complete -c cargo -n '_is package' -l no-metadata 

complete -c cargo -n '_is update' -l aggressive
complete -c cargo -x -n '_is update' -l precise

complete -c cargo -x -n '_is yank' -l vers
complete -c cargo -n '_is yank' -l undo