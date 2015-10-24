# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
complete -e -c rustc

set -l rust_docs (rustc -C help \
        | string replace -r -i '(\s+)-C(.+)(\s+)--(\s+)([^\n]+)' '$2 $5' \
        | string trim \
        | egrep -v '^$' | egrep -v ':$')

for line in $rust_docs
    set docs (string split -m 1 ' ' $line)
    set flag (string replace -r '^([a-z\-]+\=|[a-z\-]+)(.*)' '$1' \
                                $docs[1])
    set desc $docs[2]
end

