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

function _c
	complete $argv
end

_c -f -c cargo -a '$_cargo_commands'

# Help
_c -f -c cargo -n '_is help' -s h -l help

# Build and Bench are the same.
set _cmds build bench
for x in $_cmds;
	_c -c cargo -n "_is $x" -s h -l help

	_c -f -c cargo -n "_is $x" -s p -l package \
		-d "Package to $x"

	_c -f -c cargo -n "_is $x" -s j -l jobs \
		-d 'The number of jobs to run in parallel'

	_c -c cargo -n "_is $x" -l lib \
		-d "only this package's library"

	_c -f -c cargo -n "_is $x" -l bin \
		-d "only the specified binary"

	_c -f -c cargo -n "_is $x" -l example \
		-d 'only the specified example'

	_c -f -c cargo -n "_is $x" -l test \
		-d 'only the specified test'

	_c -f -c cargo -n "_is $x" -l bench \
		-d 'only the specified benchmark'

	_c -c cargo -n "_is $x" -l release \
		-d 'artifacts in release mode, with optimizations'

	_c -f -c cargo -n "_is $x" -l features \
		-d 'Space-separated list of features to also build'

	_c -c cargo -n "_is $x" -l no-default-features \
		-d 'Do not build the `default` feature'

	_c -f -c cargo -n "_is $x" -l target \
		-d 'Build for the target triple'

	_c -f -c cargo -n "_is $x" -l manifest-path \
		-d 'Path to the manifest to compile'
end

# Clean
_c -f -c cargo -n '_is clean' -s p -l package \
	-d "Package to clean artifacts for"

_c -f -c cargo -n '_is clean' -l manifest-path \
	-d 'Path to the manifest to the package to clean'

_c -f -c cargo -n '_is clean' -l target \
	-d 'Target triple to clean output for (default all)'

