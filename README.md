:warning: This is the `texmacs` branch for the TeXmacs plugin :construction:

# SBCL TeXmacs Plugin

In order to
[interfacing](https://www.texmacs.org/tmweb/manual/webman-write-itf.en.html "Interfacing TeXmacs with other programs")
we have __SBCL__ to output the necessary control codes. As a prototype this was accomplished by changing the following two files

1. src/code/debug.lisp
2. src/code/top-level.lisp

See [Commit 88ef2eb](https://github.com/nilqed/sbcl/commit/88ef2eba6a0d5dc19414b8dfd6e9ac850e451188)

It is assumed that you already have a version of __SBCL__ installed, so that these sources can be compiled.
As described in `INSTALL`, a build of __SBCL__ may be run without installing it (by `run-sbcl.sh`). Just this
feature will be used here, hence your current installation of __SBCL__ will not be compromised.

![terminal](./plugin/doc/terminal.jpg?raw=true)

### Insert -> Session -> SBCL 

![texmacs](./plugin/doc/texmacs.jpg?raw=true)

## Installation

1. Clone this repo
2. Inside, execute `sh make.sh` (recommended: read INSTALL) 
3. Check if build was successful by `sh run-sbcl.sh`
4. Copy the `plugin` directory to your TeXmacs/plugin folder and rename it to `sbcl`:
   Before, adjust the path to `run-sbcl.sh` by editing the file `./plugin/progs/init-sbcl.scm`   
   `$ cp -r ./plugin $HOME/.Texmacs/plugins/sbcl`
5. Test it :lemon:.


## Support package "TMSPT"

One may control __TeXmacs__ by sending apropriate (scheme/guile)
messages to __TeXmacs__. Most of the menu commands may be mapped
to a __LISP__ function. Thus inserting images, hyperlinks, latex,
schmeme, postscript and so on can be done by the plugin when 
loading the package __TMSPT__ (`plugin/lisp/tmppt.lisp`).

:TODO:

Start sequence in `init-sbcl.scm`: 

     (:launch "sh /path/to/sbcl/run-sbcl.sh --eval
         \"(defun debug-ignore (c h) (declare (ignore h)) (print c)
         (abort))\" --eval \"(setf *debugger-hook* #'debug-ignore)\"")



![tmspt](./plugin/doc/tm-p-sample-1.jpg?raw=true)

#### Inline and Link Images 

![img](./plugin/doc/inlineimg.jpg?raw=true)


## Exported functions

The function names are more or less self-explaining: 

    (defpackage TMSPT (:use common-lisp)
        (:export #:tm-message
           #:verbatim
           #:command
           #:latex
           #:scheme
           #:html
           #:ps
           #:output
           #:prompt
           #:input
           #:add-style
           #:rempve-style
           #:toggle-header
           #:toggle-footer
           #:insert-text-field-above
           #:insert-text-field-below
           #:add-default-style
           #:remove-default-style
           #:link-image
           #:inline-image
           #:toggle-math-input
           #:toggle-multiline-input
           #:toggle-math-output
           #:toggle-scheme-output
           #:toggle-scheme-tree-output
           #:show-timings
           #:clear-all-fields
           #:fold-all-fields
           #:unfold-all-fields
           #:evaluate-fields-in-order
           #:create-subsession
           #:split-session
           #:session-eval
           #:evaluate-all
           #:evaluate-above
           #:evaluate-below
           #:previous-field
           #:next-field
           #:first-field
           #:last-field
           #:insert-field-above
           #:insert-field-below
           #:remove-next-field 
           #:remove-banner
           #:remove-last-field
           #:close-session
           #:toggle-full-screen
           #:change-zoom-factor
           #:zoom-in
           #:zoom-out
           #:fit-all-to-screen
           #:fit-to-screen
           #:fit-to-screen-width 
           #:fit-to-screen-height)


For details consult the source file `tmspt.lisp` in the `plugin/lisp/` directory.



## TeXmacs Serializer
Mathematical input (math-mode).

:TODO: rewrite 


![mathmode](./plugin/doc/serializer.jpg?raw=true)


:date: 14-JAN-2025
