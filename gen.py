#!/bin/env python
from __future__ import print_function, with_statement
from jinja2 import Environment, FileSystemLoader
import re
import subprocess


env = Environment(loader=FileSystemLoader('.'))
rust_config = env.get_template('rustc.fish.template')
cargo_config = env.get_template('cargo.fish.template')

with open('rustc.fish', 'w') as handle:
	handle.write(rust_config.render(
		r='complete -c rustc'
	))
	handle.write('\n')

with open('cargo.fish', 'w') as handle:
	handle.write(cargo_config.render(
		c='complete -c cargo',
		s='__fish_seen_subcommand_from'
	))
	handle.write('\n')
