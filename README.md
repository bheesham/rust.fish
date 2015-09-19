rust.fish
=========

Tab completions for `rustc` and `cargo`!

Installation
------------

Clone this repo, then in your `.config/fish/config.fish` file, add:

```
source /path/to/rustc.fish
source /path/to/cargo.fish
```

Known "bugs"
------------

`cargo`:

  * The `--help`, `--list`, `--quiet`, `--verbose`, and `--version` options
    show up for every command.
  * The subcommands will always show up as suggestions. For example:
    `cargo new build git-checkout`.
  * I found some but forgot to document them. So they're back to being unknown
    again
