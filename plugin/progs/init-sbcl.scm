;;; work in progress
;;; you have to adjust the path to run-sbcl.sh 

(define (sbcl-verbatim-serialize lan t)
  (import-from (utils plugins plugin-cmd))
  (with u (pre-serialize lan t)   
    (string-append "(tm-math \"" (escape-verbatim (texmacs->code u)) "\")\n")))


(define (sbcl-serialize lan t)
  (import-from (utils plugins plugin-cmd))
  (import-from (utils plugins plugin-convert))
  (with s (if (in-math?)
     (sbcl-verbatim-serialize lan t) 
        (verbatim-serialize lan t))	
	s))
  

; (define (sbcl-auto-parenthesis)
;  (insert "()") 
;  (emulate-keyboard "Left"))


; (kbd-map
;  (:require (in-sbcl?))
;  ("(" (sbcl-auto-parenthesis)))


(plugin-configure sbcl
  ;(:require #t)
  (:launch "sh /home/kfp/devel/sbcl-texmacs-plugin/sbcl/run-sbcl.sh --eval \"(defun debug-ignore (c h) (declare (ignore h)) (print c)
(abort))\" --eval \"(setf *debugger-hook* #'debug-ignore)\"")
  ;; instead of --disable-debugger 
  ;(:test-input-done #t)
  (:serializer ,sbcl-serialize)
  (:session "SBCL"))


(define (sbcl-input-rsub args)
    (import-from (utils plugins plugin-convert))
    (display " @subB ")
    (plugin-input (car args))
    (display " @subE "))

(define (sbcl-input-rsup args)
    (import-from (utils plugins plugin-convert))
    (display " @supB ")
    (plugin-input (car args))
    (display " @supE "))   

(define (sbcl-input-label args)
    (import-from (utils plugins plugin-convert))
    (display " @labelB ")
    (plugin-input (car args))
    (display " @labelE "))

(define (sbcl-input-reference args)
    (import-from (utils plugins plugin-convert))
    (display " @referenceB ")
    (plugin-input (car args))
    (display " @referenceE "))

(define (sbcl-input-proof args)
    (import-from (utils plugins plugin-convert))
    (display " @proofB ")
    (plugin-input (car args))
    (display " @proofE "))

(define (sbcl-input-definition args)
    (import-from (utils plugins plugin-convert))
    (display " @definitionB ")
    (plugin-input (car args))
    (display " @definitionE "))

(define (sbcl-input-theorem args)
    (import-from (utils plugins plugin-convert))
    (display " @theoremB ")
    (plugin-input (car args))
    (display " @theoremE "))

(define (sbcl-input-lemma args)
    (import-from (utils plugins plugin-convert))
    (display " @lemmaB ")
    (plugin-input (car args))
    (display " @lemmaE "))

(define (sbcl-input-proposition args)
    (import-from (utils plugins plugin-convert))
    (display " @propositionB ")
    (plugin-input (car args))
    (display " @propositionE "))





 (plugin-input-converters sbcl
   (rsub sbcl-input-rsub)
   (rsup sbcl-input-rsup)
   (label sbcl-input-label)
   (reference sbcl-input-reference)
   (definition sbcl-input-definition)
   (theorem sbcl-input-theorem)
   (lemma sbcl-input-lemma)
   (proposition sbcl-input-proposition)
   (proof sbcl-input-proof)
   ("("              " @lpar ")
   (")"              " @rpar ") 
   ("["              " @lbrack ")
   ("]"              " @rbrack ")
   ("{"              " @lbrace ")
   ("}"              " @rbrace ")   
   (">"              " @gt ")
   ("<"              " @lt ")
   ("="              " @eq ")
   ("*"              " @mult ")
   ("+"              " @plus ") 
   ("-"              " @minus ")
   ("/"              " @slash ") 
   (","              " @comma ")
   ("."              " @dot   ")
   (":"              " @colon ")
   (":="             " @assign ")
   ("<langle>"       " @langle ")
   ("<rangle>"       " @rangle ")
   ("<ldots>"        " @ldots ")
   ("<cdots>"        " @cdots ")  
   ("<in>"           " @in ")
   ("<cap>"          " @cap ")
   ("<cup>"          " @cup ")
   ("<subset>"       " @subset ")
   ("<mapsto>"       " @mapsto ")
   ("<leftarrow>"    " @leftarrow ")
   ("<rightarrow>"   " @rightarrow ")
   ("<vee>"          " @vee ")
   ("<neg>"          " @neg ")
   ("<equiv>"        " @equiv ")
   ("<circ>"         " @circ ")
   ("<star>"         " @star ")
   ("<neq>"          " @neq ")
   ("<leq>"          " @leq ")
   ("<geq>"          " @geq ")
   ("<leqslant>"     " @leq ")
   ("<geqslant>"     " @geq ")
   ("<times>"        " @times ")
   ("<wedge>"        " @wedge ")
   ("<forall>"       " @forall ")
   ("<exists>"       " @exists ")
   ("<partial>"      " @partial ")
   ("<emptyset>"     " @emptyset ")
   ;
   ("<bbb-A>" "@AA")
   ("<bbb-B>" "@BB")
   ("<bbb-C>" "@CC")
   ("<bbb-D>" "@DD")
   ("<bbb-E>" "@EE")
   ("<bbb-F>" "@FF")
   ("<bbb-G>" "@GG")
   ("<bbb-H>" "@HH")
   ("<bbb-I>" "@II")
   ("<bbb-J>" "@JJ")
   ("<bbb-K>" "@KK")
   ("<bbb-L>" "@LL")
   ("<bbb-M>" "@MM")
   ("<bbb-N>" "@NN")
   ("<bbb-O>" "@OO")
   ("<bbb-P>" "@PP")
   ("<bbb-Q>" "@QQ")
   ("<bbb-R>" "@RR")
   ("<bbb-S>" "@SS")
   ("<bbb-T>" "@TT")
   ("<bbb-U>" "@UU")
   ("<bbb-V>" "@VV")
   ("<bbb-W>" "@WW")
   ("<bbb-X>" "@XX")
   ("<bbb-Y>" "@YY")
   ("<bbb-Z>" "@ZZ"))
   
   
   
;;; (deffunction math: (?x) ?x)
;;; \assign x 2 => \x ->> 2




