rust.fish
=========

*These changes have been merged upstream to the fish shell project!*

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
