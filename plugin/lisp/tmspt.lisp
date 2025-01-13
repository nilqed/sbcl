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
           (command msg)))

      
(defun toggleMathInput  ()
      (command "(toggle-session-math-input)"))
      
(defun toggleMultilineInput  ()
      (command "(toggle-session-multiline-input)"))

(defun toggleMathOutput  ()
      (command "(toggle-session-scheme-math)"))
      
(defun toggleTreeOutput  ()
      (command "(toggle-session-scheme-trees)"))  
      
(defun toggleSchemeTreeOutput  ()
      (command "(toggle-session-scheme-strees)"))  
      
(defun showTimings  ()
      (command "(toggle-session-output-timings)"))
      
(defun clearAllFields  ()
      (command "(session-clear-all)"))
      
(defun foldAllFields  ()
      (command "(session-fold-all)"))
      
(defun unfoldAllFields  ()
      (command "(session-unfold-all)"))
      
(defun evaluateFieldsInOrder  ()
      (command "(toggle-session-program)"))
      
(defun createSubsession  ()
      (command "(field-insert-fold (focus-tree))"))
      
(defun splitSession  () 
      (command "(session-split)"))
      
(defun sessionEval  ()
      (command "(session-evaluate)"))
      
(defun evaluateAll  ()
      (command "(session-evaluate-all)"))
      
(defun evaluateAbove  ()
      (command "(session-evaluate-above)"))
  
(defun evaluateBelow  ()
      (command "(session-evaluate-below)"))
      
(defun previousField  ()
      (command "(traverse-previous)"))
      
(defun nextField  ()
      (command "(traverse-next)"))
      
(defun firstField  ()
      (command "(traverse-first)"))
      
(defun lastField  ()
      (command "(traverse-last)"))
      
(defun  insertFieldAbove  ()
      (command "(field-insert (focus-tree) #f)"))
      
(defun  insertFieldBelow  ()
      (command "(field-insert (focus-tree) #t)"))
      
(defun removePreviousField  ()
      (command "(field-remove (focus-tree) #f)"))
      
(defun removeNextField  ()
      (command "(field-remove (focus-tree) #t)"))
      
(defun removeBanner  ()
      (command "(field-remove-banner (focus-tree))"))
      
(defun removeLastField  ()
      (command "(field-remove-extreme (focus-tree) #t)"))
      
(defun closeSession  ()
      (command "(plugin-stop)"))
      
(defun toggle-full-screen ()
      (command "(toggle-full-screen-mode)"))
      
(defun changeZoomFactor (z) 
    (let ((z (max (min z 25.0) 0.04)))
       (command (format 'nil "(change-zoom-factor ~A)" z))))
         
(defun zoom-in (z)
     (command (format 'nil "(zoom-in ~A)" z)))
      
(defun zoom-out (z)
     (command (format 'nil "(zoom-out ~A)" z)))
      
    
(defun fitAllToScreen  ()
      (command "(fit-all-to-screen)"))
      
(defun fitToScreen  ()
      (command "(fit-to-screen)"))
      
(defun fitToScreenWidth  ()
      (command "(fit-to-screen-width)"))
      
(defun fitToScreenHeight  ()
      (command "fit-to-screen-height"))
      
(defun mathInput(s) s)


