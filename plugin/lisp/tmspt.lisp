(defpackage TMSPT (:use common-lisp))

(in-package :tmspt)

(defparameter begin (code-char 2))
(defparameter end   (code-char 5))
(defparameter void  (code-char 1))

(defparameter *defaultstyle* "sbcl-default-style")



(defun tm-message (type msg)
       (progn (princ begin)
              (princ (concatenate 'string type msg))
              (princ end)
              (princ void)))
              


(defun verbatim (msg) (tm-message "verbatim:" msg))
(defun command  (msg) (tm-message "command:"  msg))
(defun latex    (msg) (tm-message "latex:" msg))
(defun scheme   (msg) (tm-message "scheme:" msg))
(defun html     (msg) (tm-message "html:" msg))
(defun ps       (msg) (tm-message "ps:" msg))
    
(defun output   (msg) (tm-message "output#" msg))
(defun prompt   (msg) (tm-message "prompt#" msg))
(defun input    (msg) (tm-message "input#" msg))
   
(defun add-style (sty)
      (let ((msg (format 'nil "(add-style-package ~S)" sty)))
          (command msg)))

(defun remove-style (sty)
      (let ((msg (format 'nil "(remove-style-package ~S)" sty)))
          (command msg)))
          
(defun toggle-header () (command "(toggle-visible-header)"))
(defun toggle-footer () (command "(toggle-visible-footer)")) 

(defun insert-text-field-above () 
      (command "(field-insert-text (focus-tree) #f))"))
      
(defun insert-text-field-below ()
      (command "(field-insert-text (focus-tree) #t))"))
      
(defun add-default-style () (add-style *defaultstyle*))
(defun remove-default-style () (remove-style *defaultstyle*))  
    
(defun link-image (url)
    (let ((msg (format 'nil 
        "(make-link-image ~S ~S ~S ~S ~S)" url "" "" "" "")))
           (command msg)))
  
(defun inline-image (url &key (w "") (h "") (x "") (y ""))
    (let ((msg (format 'nil 
        "(make-link-image ~S ~S ~S ~S ~S)" url w h x y)))
           (insert-text-field-above)
           (command msg)))

      
(defun toggle-math-input  ()
      (command "(toggle-session-math-input)"))
      
(defun toggle-multiline-input  ()
      (command "(toggle-session-multiline-input)"))

(defun toggle-math-output  ()
      (command "(toggle-session-scheme-math)"))
      
(defun toggle-tree-output  ()
      (command "(toggle-session-scheme-trees)"))  
      
(defun toggle-scheme-tree-output  ()
      (command "(toggle-session-scheme-strees)"))  
      
(defun show-timings  ()
      (command "(toggle-session-output-timings)"))
      
(defun clear-all-fields  ()
      (command "(session-clear-all)"))
      
(defun fold-all-fields  ()
      (command "(session-fold-all)"))
      
(defun unfold-all-fields  ()
      (command "(session-unfold-all)"))
      
(defun evaluate-fields-in-order  ()
      (command "(toggle-session-program)"))
      
(defun create-subsession  ()
      (command "(field-insert-fold (focus-tree))"))
      
(defun split-session  () 
      (command "(session-split)"))
      
(defun session-eval  ()
      (command "(session-evaluate)"))
      
(defun evaluate-all  ()
      (command "(session-evaluate-all)"))
      
(defun evaluate-above  ()
      (command "(session-evaluate-above)"))
  
(defun evaluate-below  ()
      (command "(session-evaluate-below)"))
      
(defun previous-field  ()
      (command "(traverse-previous)"))
      
(defun next-field  ()
      (command "(traverse-next)"))
      
(defun first-field  ()
      (command "(traverse-first)"))
      
(defun last-field  ()
      (command "(traverse-last)"))
      
(defun  insert-field-above  ()
      (command "(field-insert (focus-tree) #f)"))
      
(defun  insert-field-below  ()
      (command "(field-insert (focus-tree) #t)"))
      
(defun remove-previous-field  ()
      (command "(field-remove (focus-tree) #f)"))
      
(defun remove-next-field  ()
      (command "(field-remove (focus-tree) #t)"))
      
(defun remove-banner  ()
      (command "(field-remove-banner (focus-tree))"))
      
(defun remove-last-field  ()
      (command "(field-remove-extreme (focus-tree) #t)"))
      
(defun close-session  ()
      (command "(plugin-stop)"))
      
(defun toggle-full-screen ()
      (command "(toggle-full-screen-mode)"))
      
(defun change-zoom-factor (z) 
    (let ((z (max (min z 25.0) 0.04)))
       (command (format 'nil "(change-zoom-factor ~A)" z))))
         
(defun zoom-in (z)
     (command (format 'nil "(zoom-in ~A)" z)))
      
(defun zoom-out (z)
     (command (format 'nil "(zoom-out ~A)" z)))
      
    
(defun fit-all-to-screen  ()
      (command "(fit-all-to-screen)"))
      
(defun fit-to-screen  ()
      (command "(fit-to-screen)"))
      
(defun fit-to-screen-width  ()
      (command "(fit-to-screen-width)"))
      
(defun fit-to-screenHeight  ()
      (command "fit-to-screen-height"))
      
(defun mathInput(s) s)


