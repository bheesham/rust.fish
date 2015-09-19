#!/bin/env python
from __future__ import print_function, with_statement
from jinja2 import Environment, FileSystemLoader
import re
import subprocess


env = Environment(loader=FileSystemLoader('.'))
rust_config = env.get_template('rustc.fish.template')
cargo_config = env.get_template('cargo.fish.template')


# Codegen
codegen_re = re.compile('(\s+)-C(\s+)(?P<var>[a-z\[\]\=\-]+)(\s+)--(.+)')
codegen_out, _ = subprocess.Popen(
					['rustc','-C', 'help'],
					stdout=subprocess.PIPE).communicate()
codegen = []
for match in codegen_re.finditer(codegen_out):
	val = match.group('var')
	if '=' in val:
		codegen.append(val[:val.index('=')+1])
	else:
		codegen.append(val)

# Warnings
warning_re = re.compile('(\s+)(?P<var>[a-z\-]+)(\s+)(allow|warn|deny)(\s+){2}(.+)')
warning_out, _ = subprocess.Popen(
					['rustc','-W', 'help'],
					stdout=subprocess.PIPE).communicate()
warnings = []
for match in warning_re.finditer(warning_out):
	val = match.group('var')
	warnings.append(val)

# Internal debugging
debug_re = re.compile('(\s+)-Z(\s+)(?P<var>[a-z\-]+)(\s+)--(.+)')
debug_out, _ = subprocess.Popen(
					['rustc','-Z', 'help'],
					stdout=subprocess.PIPE).communicate()
debug = []
for match in debug_re.finditer(debug_out):
	val = match.group('var')
	debug.append(val)

with open('rustc.fish', 'w') as handle:
	handle.write(rust_config.render(
					r='complete -c rustc',
					codegen=' '.join(codegen),
					warn=' '.join(warnings),
					debug=' '.join(debug)
	))
	handle.write('\n')

with open('cargo.fish', 'w') as handle:
	handle.write(cargo_config.render(
					c='complete -c cargo',
					s='__fish_seen_subcommand_from'
	))
	handle.write('\n')
