#!/bin/env python
from __future__ import print_function, with_statement
from jinja2 import Environment, FileSystemLoader
import re
import subprocess


env = Environment(loader=FileSystemLoader('.'))
rust_config = env.get_template('rustc.fish.template')
cargo_config = env.get_template('cargo.fish.template')


# Codegen
codegen_re = re.compile('(\s+)-C(?P<arg>.+)(\s+)--(\s+)(?P<desc>[^\n]+)')
codegen_out, _ = subprocess.Popen(
	['rustc','-C', 'help'],
	stdout=subprocess.PIPE).communicate()

codegens = []
for match in codegen_re.finditer(codegen_out):
	arg = match.group('arg')
	if '=' in arg:
		arg = arg[:arg.index('=')+1]
	
	codegens.append({
		'arg': arg.strip(),
		'desc': match.group('desc').strip()
	})

# Warnings
warning_re = re.compile('(\s+)(?P<arg>.+)(\s+)(allow|warn|deny)(\s+){2}(?P<desc>[^\n]+)')
warning_out, _ = subprocess.Popen(
	['rustc','-W', 'help'],
	stdout=subprocess.PIPE).communicate()

warning_arguments = []
for match in warning_re.finditer(warning_out):
	warning_arguments.append({
		'arg': match.group('arg').strip(),
		'desc': match.group('desc').strip()
	})

warnings = []
warning_flags = [
	{
		'short': 'W',
		'long': 'warn'
	},
	{
		'short': 'A',
		'long': 'allow'
	},
	{
		'short': 'D',
		'long': 'deny'
	},
	{
		'short': 'F',
		'long': 'forbid'
	}
]

for flag in warning_flags:
	for arg in warning_arguments:
		warnings.append({
			'short': flag['short'], 'long': flag['long'], 'arg': arg['arg'],
			'desc': arg['desc']
		})


# Internal debugging
debug_re = re.compile('(\s+)-Z(?P<arg>.+)(\s+)--(\s+)(?P<desc>[^\n]+)')
debug_out, _ = subprocess.Popen(
		['rustc','-Z', 'help'],
		stdout=subprocess.PIPE).communicate()

debugs = []
for match in debug_re.finditer(debug_out):
	debugs.append({
		'arg': match.group('arg').strip(),
		'desc': match.group('desc').strip()
	})

with open('rustc.fish', 'w') as handle:
	handle.write(rust_config.render(
		r='complete -c rustc',
		codegens=codegens,
		warnings=warnings,
		debugs=debugs
	))
	handle.write('\n')

with open('cargo.fish', 'w') as handle:
	handle.write(cargo_config.render(
		c='complete -c cargo',
		s='__fish_seen_subcommand_from'
	))
	handle.write('\n')
