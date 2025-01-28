# Universal Ctags

I used this with editors like Kate.

Option files are loaded by `ctags` automatically at start-up time.

Which files are loaded at start-up time are very different from
Exuberant Ctags. See [Difference from Exuberant Ctags](https://docs.ctags.io/en/latest/option-file.html#option-file-difference) for the differences and their intentions.

At start-up time, `ctags` loads files having `.ctags` as a file
extension under the following statically defined directories:

1.  `$XDG_CONFIG_HOME/ctags/`, or `$HOME/.config/ctags/` if
    `$XDG_CONFIG_HOME` is not defined (on other than Windows)
2.  `$HOME/.ctags.d/`
3.  `$HOMEDRIVE$HOMEPATH/ctags.d/` (on Windows)
4.  `./.ctags.d/`
5.  `./ctags.d/`

`ctags` visits the directories in the order listed above for preloading
files. `ctags` loads files having `.ctags` as file extension in
alphabetical order (`strcmp(3)` is used for comparing, so for example
`.ctags.d/ZZZ.ctags` will be loaded *before* `.ctags.d/aaa.ctags` in an
ordinary locale).

If a option file includes `--options=PATHNAME` option, specified files
are loaded immediately as described in the next section. `ctags` load a
option file only once if it is specified multiple times.

Finally if `--options=PATHNAME` option is specified on `ctags` command
line, option files specified are load.
