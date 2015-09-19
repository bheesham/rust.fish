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

complete -c rustc -x -s C -l codegen -a 'ar= linker= link-args= lto target-cpu= target-feature= passes= llvm-args= save-temps rpath no-prepopulate-passes no-vectorize-loops no-vectorize-slp soft-float prefer-dynamic no-integrated-as no-redzone= relocation-model= code-model= metadata= extra-filename= codegen-units= remark= no-stack-check debuginfo= opt-level= debug-assertions='
complete -c rustc -x -s W -l warn -a 'box-pointers fat-ptr-transmutes missing-copy-implementations missing-debug-implementations missing-docs trivial-casts trivial-numeric-casts unsafe-code unstable-features unused-extern-crates unused-import-braces unused-qualifications unused-results variant-size-differences dead-code deprecated drop-with-repr-extern improper-ctypes non-camel-case-types non-shorthand-field-patterns non-snake-case non-upper-case-globals overflowing-literals path-statements plugin-as-library private-no-mangle-fns private-no-mangle-statics raw-pointer-derive stable-features unconditional-recursion unknown-lints unreachable-code unused-allocation unused-assignments unused-attributes unused-comparisons unused-features unused-imports unused-must-use unused-mut unused-parens unused-unsafe unused-variables warnings while-true exceeding-bitshifts mutable-transmutes no-mangle-const-items unknown-crate-types'
complete -c rustc -x -s A -l allow -a 'box-pointers fat-ptr-transmutes missing-copy-implementations missing-debug-implementations missing-docs trivial-casts trivial-numeric-casts unsafe-code unstable-features unused-extern-crates unused-import-braces unused-qualifications unused-results variant-size-differences dead-code deprecated drop-with-repr-extern improper-ctypes non-camel-case-types non-shorthand-field-patterns non-snake-case non-upper-case-globals overflowing-literals path-statements plugin-as-library private-no-mangle-fns private-no-mangle-statics raw-pointer-derive stable-features unconditional-recursion unknown-lints unreachable-code unused-allocation unused-assignments unused-attributes unused-comparisons unused-features unused-imports unused-must-use unused-mut unused-parens unused-unsafe unused-variables warnings while-true exceeding-bitshifts mutable-transmutes no-mangle-const-items unknown-crate-types'
complete -c rustc -x -s F -l deny -a 'box-pointers fat-ptr-transmutes missing-copy-implementations missing-debug-implementations missing-docs trivial-casts trivial-numeric-casts unsafe-code unstable-features unused-extern-crates unused-import-braces unused-qualifications unused-results variant-size-differences dead-code deprecated drop-with-repr-extern improper-ctypes non-camel-case-types non-shorthand-field-patterns non-snake-case non-upper-case-globals overflowing-literals path-statements plugin-as-library private-no-mangle-fns private-no-mangle-statics raw-pointer-derive stable-features unconditional-recursion unknown-lints unreachable-code unused-allocation unused-assignments unused-attributes unused-comparisons unused-features unused-imports unused-must-use unused-mut unused-parens unused-unsafe unused-variables warnings while-true exceeding-bitshifts mutable-transmutes no-mangle-const-items unknown-crate-types'
complete -c rustc -x -s D -l forbid -a 'box-pointers fat-ptr-transmutes missing-copy-implementations missing-debug-implementations missing-docs trivial-casts trivial-numeric-casts unsafe-code unstable-features unused-extern-crates unused-import-braces unused-qualifications unused-results variant-size-differences dead-code deprecated drop-with-repr-extern improper-ctypes non-camel-case-types non-shorthand-field-patterns non-snake-case non-upper-case-globals overflowing-literals path-statements plugin-as-library private-no-mangle-fns private-no-mangle-statics raw-pointer-derive stable-features unconditional-recursion unknown-lints unreachable-code unused-allocation unused-assignments unused-attributes unused-comparisons unused-features unused-imports unused-must-use unused-mut unused-parens unused-unsafe unused-variables warnings while-true exceeding-bitshifts mutable-transmutes no-mangle-const-items unknown-crate-types'
complete -c rustc -x -s Z -a 'verbose time-passes count-llvm-insns time-llvm-passes trans-stats asm-comments no-verify borrowck-stats no-landing-pads debug-llvm count-type-sizes meta-stats print-link-args gc print-llvm-passes ast-json ast-json-noexpand ls save-analysis print-move-fragments flowgraph-print-loans flowgraph-print-moves flowgraph-print-assigns flowgraph-print-all print-region-graph parse-only no-trans treat-err-as-bug no-analysis unstable-options print-enum-sizes trace-macros enable-nonzeroing-move-hints'
