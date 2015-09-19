rust.fish
=========

Tab completions for cargo! And soon maybe rustc!

Installation
------------

Clone this repo, then in your `.config/fish/config.fish` file, add:

`
source /path/to/cargo.fish
`

Known "bugs"
------------

`cargo`:

  * The `--help`, `--list`, `--quiet`, `--verbose`, and `--version` options show up
for every command.
  * The subcommands will always show up as suggestions. For example:
  `cargo new build git-checkout`.
