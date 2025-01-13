:warning: This is the `texmacs` branch for the TeXmacs plugin! 

# SBCL TeXmacs Plugin

In order to
[interfacing](https://www.texmacs.org/tmweb/manual/webman-write-itf.en.html "Interfacing TeXmacs with other programs")
we have __SBCL__ to output the necessary control codes. As a prototype this was accomplished by changing the following two files

1. src/code/debug.lisp
2. src/code/top-level.lisp

![terminal](./plugin/doc/terminal.png?raw=true)

![texmacs](./plugin/doc/texmacs.png?raw=true)

## Installation

1. Clone this repo
2. Inside, execute `sh make.sh` (recommended: read INSTALL) 
3. Check if build was successful by `sh run-sbcl.sh`
4. Copy the `plugin` directory to your TeXmacs/plugin folder and rename it to `sbcl`:
   Before, adjust the path `to run-sbcl.sh` by editing the file `./progs/init-sbcl.scm`   
   `$ cp -r ./plugin $HOME/.Texmacs/plugins/sbcl`
5. Test it :lemon:.




