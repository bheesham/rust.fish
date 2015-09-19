# Tab completion for cargo (https://github.com/rust-lang/cargo).
complete -e -c cargo

complete -c cargo -s h -l help 
complete -c cargo -s V -l version -d 'Print version info and exit'
complete -c cargo -l list -d 'List installed commands'
complete -c cargo -s v -l verbose -d 'Use verbose output'
complete -c cargo -s q -l quiet -d 'No output printed to stdout'

set __fish_cargo_subcommands (cargo --list | tail -n +2 | tr -d " ")

function __fish_cargo_subcommand
	if contains $argv (commandline -cop);
		return 0
	end
	return 1
end

complete -c cargo -f -c cargo -n '__fish_use_subcommand' -a '$__fish_cargo_subcommands'
complete -c cargo -x -c cargo -n '__fish_cargo_subcommand help' -a '$__fish_cargo_subcommands'

for x in bench build clean doc fetch generate-lockfile \
		locate-project package pkgid publish \
		read-manifest run rustc test update \
		verify-project;
	complete -c cargo -r -n "__fish_cargo_subcommand $x" -l manifest-path
end

for x in bench build clean doc rustc test update;
	complete -c cargo -x -n "__fish_cargo_subcommand $x" -s p -l spec
end

for x in bench build clean doc run rustc test;
	complete -c cargo -x -n "__fish_cargo_subcommand $x" -l target
end

for x in bench build rustc test;
	complete -c cargo -n "__fish_cargo_subcommand $x" -l bench
	complete -c cargo -n "__fish_cargo_subcommand $x" -l lib
	complete -c cargo -x -n "__fish_cargo_subcommand $x" -l test
end

for x in bench build run rustc test;
	complete -c cargo -x -n "__fish_cargo_subcommand $x" -l bin
	complete -c cargo -x -n "__fish_cargo_subcommand $x" -l example
end

for x in build run rustc test;
	complete -c cargo -n "__fish_cargo_subcommand $x" -l release
end

for x in bench test;
	complete -c cargo -n "__fish_cargo_subcommand $x" -l no-run
end

for x in bench build doc run rustc test;
	complete -c cargo -x -n "__fish_cargo_subcommand $x" -s j -l jobs
	complete -c cargo -x -n "__fish_cargo_subcommand $x" -l features
	complete -c cargo -n "__fish_cargo_subcommand $x" -l no-default-features
end

complete -c cargo -n '__fish_cargo_subcommand doc' -l no-deps

complete -c cargo -x -n '__fish_cargo_subcommand new' -l vcs
complete -c cargo -x -n '__fish_cargo_subcommand new' -l name

# This bin does not take any arguments which is why it is not defined above.
complete -c cargo -n '__fish_cargo_subcommand new' -l bin

complete -c cargo -x -n '__fish_cargo_subcommand git-checkout' -l url
complete -c cargo -x -n '__fish_cargo_subcommand git-checkout' -l reference

for x in login publish search;
	complete -c cargo -x -n "__fish_cargo_subcommand $x" -l host
end

complete -c cargo -n '__fish_cargo_subcommand doc' -l open

complete -c cargo -r -n '__fish_cargo_subcommand owner' -s a -l add 
complete -c cargo -r -n '__fish_cargo_subcommand owner' -s r -l remove 

for x in owner yank;
	complete -c cargo -r -n "__fish_cargo_subcommand $x" -l index 
end

for x in owner publish yank;
	complete -c cargo -x -n "__fish_cargo_subcommand $x" -l token 
end

complete -c cargo -n '__fish_cargo_subcommand package' -l no-verify 
complete -c cargo -n '__fish_cargo_subcommand package' -l no-metadata 

complete -c cargo -n '__fish_cargo_subcommand update' -l aggressive
complete -c cargo -x -n '__fish_cargo_subcommand update' -l precise

complete -c cargo -x -n '__fish_cargo_subcommand yank' -l vers
complete -c cargo -n '__fish_cargo_subcommand yank' -l undo