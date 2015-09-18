complete -e -c cargo

complete -c cargo -s h -l help
complete -c cargo -s V -l version
complete -c cargo -l list
complete -c cargo -s v -l verbose
complete -c cargo -s q -l quiet

set _cargo_commands (cargo --list | tail -n +2 | tr -d " ")

function _is
	if contains $argv (commandline -cop);
		return 0
	end
	return 1
end

# Help
complete -c cargo -n '_is help' -s h -l help

complete -f -c cargo -a '$_cargo_commands'

# Build
complete -c cargo -n '_is build' -s h -l help

complete -f -c cargo -n '_is build' -s p -l package \
	-d 'Package to build'

complete -f -c cargo -n '_is build' -s j -l jobs \
	-d 'The number of jobs to run in parallel'

complete -c cargo -n '_is build' -l lib \
	-d 'Build only this package\'s library'

complete -f -c cargo -n '_is build' -l bin \
	-d 'Build only the specified binary'

complete -f -c cargo -n '_is build' -l example \
	-d 'Build only the specified example'

complete -f -c cargo -n '_is build' -l test \
	-d 'Build only the specified test'

complete -f -c cargo -n '_is build' -l bench \
	-d 'Build only the specified benchmark'

complete -c cargo -n '_is build' -l release \
	-d 'Build artifacts in release mode, with optimizations'

complete -f -c cargo -n '_is build' -l features \
	-d 'Space-separated list of features to also build'

complete -c cargo -n '_is build' -l no-default-features \
	-d 'Do not build the `default` feature'

complete -f -c cargo -n '_is build' -l target \
	-d 'Build for the target triple'

complete -f -c cargo -n '_is build' -l manifest-path \
	-d 'Path to the manifest to compile'
