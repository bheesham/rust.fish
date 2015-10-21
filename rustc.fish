# Tab completion for rustc (https://github.com/rust-lang/rust).
complete -e -c rustc

complete -c rustc -s h -l help 

complete -c rustc -x -l cfg
complete -c rustc -r -s L -a 'dylib= static= framework='
complete -c rustc -x -s l -a 'dylib= static= framework='
complete -c rustc -x -l crate-type -a 'bin lib rlib dylib staticlib'
complete -c rustc -r -l crate-name
complete -c rustc -x -l emit -a 'asm llvm-bc llvm-ir obj link dep-info'
complete -c rustc -x -l print -a 'crate-name file-names sysroot'
complete -c rustc -s g
complete -c rustc -s O
complete -c rustc -r -l out-dir
complete -c rustc -x -l explain
complete -c rustc -l test
complete -c rustc -l target
complete -c rustc -x -l cap-lints
complete -c rustc -s V -l version -d 'Print version info and exit'
complete -c rustc -s v -l verbose -d 'Use verbose output'
complete -c rustc -f -l extern
complete -c rustc -f -l sysroot
complete -c rustc -x -l color -a 'auto always never'

set -l rust_codegen (rustc -C help \
                        | string match -r -i '(\s+)-C(.+)(\s+)--(\s+)([^\n]+)' \
                        | string trim \
                        | egrep -v '^$' | egrep -v '^-C')

for i in (seq (count $rust_codegen))
    if test (math $i%2) -eq 0
        set -l flag (string replace -r '^([a-z\-]+\=|[a-z\-]+)(.*)' '$1' \
            $rust_codegen[(math $i-1)])
        complete -c rustc -x -s C -l codegen -a "$flag" -d "$rust_codegen[$i]"
    end
end

set -l rust_codegen (rustc -Z help \
                        | string match -r -i '(\s+)-Z(.+)--(\s+)([^\n]+)' \
                        | string trim \
                        | egrep -v '^$' | egrep -v '^-Z')

for i in (seq (count $rust_codegen))
    if test (math $i%2) -eq 0
        set -l flag (string replace -r '^([a-z\-]+\=|[a-z\-]+)(.*)' '$1' \
            $rust_codegen[(math $i-1)])
        complete -c rustc -x -s Z -a "$flag" -d "$rust_codegen[$i]"
    end
end

set -l rust_codegen (rustc -Z help  \
                        | string match -r -i \
                            '(\s+)(.+)(\s+)(allow|warn|deny|forbid)(\s+){2}([^\n]+)' \
                        | egrep -v '^$' \
                        | egrep -v '^(allow|warn|deny|forbid)$' \
                        | egrep -v '^([a-z\-]+)(\s+)(allow|warn|deny|forbid)')

for i in (seq (count $rust_codegen))
    if test (math $i%2) -eq 0
        set -l flag $rust_codegen[(math $i-1)]
        complete -c rustc -x -s W -l warn -a "$flag" -d "$rust_codegen[$i]"
        complete -c rustc -x -s A -l allow -a "$flag" -d "$rust_codegen[$i]"
        complete -c rustc -x -s D -l deny -a "$flag" -d "$rust_codegen[$i]"
        complete -c rustc -x -s F -l forbid -a "$flag" -d "$rust_codegen[$i]"
    end
end

set -e rust_codegen

