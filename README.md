:warning: This is the `texmacs` branch for the TeXmacs plugin :construction:

# SBCL TeXmacs Plugin

In order to
[interfacing](https://www.texmacs.org/tmweb/manual/webman-write-itf.en.html "Interfacing TeXmacs with other programs")
we have __SBCL__ to output the necessary control codes. As a prototype this was accomplished by changing the following two files

1. src/code/debug.lisp
2. src/code/top-level.lisp

See [Commit 88ef2eb](https://github.com/nilqed/sbcl/commit/88ef2eba6a0d5dc19414b8dfd6e9ac850e451188)

![terminal](./plugin/doc/terminal.jpg?raw=true)

![texmacs](./plugin/doc/texmacs.jpg?raw=true)

## Installation

1. Clone this repo
2. Inside, execute `sh make.sh` (recommended: read INSTALL) 
3. Check if build was successful by `sh run-sbcl.sh`
4. Copy the `plugin` directory to your TeXmacs/plugin folder and rename it to `sbcl`:
   Before, adjust the path to `run-sbcl.sh` by editing the file `./plugin/progs/init-sbcl.scm`   
   `$ cp -r ./plugin $HOME/.Texmacs/plugins/sbcl`
5. Test it :lemon:.




