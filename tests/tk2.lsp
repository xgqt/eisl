;; tic-tac-toe

(import "tcltk")

(defglobal board (create-array '(3 3)))
(defglobal count 0)
(defglobal init t)

(defun game ()
  (tk::init)
  (tk::canvas 'c0 '-width 600 '-height 600)
  (tk::configure 'root '-menu 'm)
  (tk::menu 'm)
  (tk::add 'm "cascade" '-label "Game" '-underline 0 '-menu '(m m1))
  (tk::menu '(m m1) '-tearoff 'no)
  (tk::add '(m m1) "command" '-label "Exit" '-underline 0 '-command "exit")
  (game-init)
  (tk::pack 'c0)
  (tk::bind 'c0 "<Button-1>" `(paint %x %y))
  (tk::mainloop)
)

(defun game-over-p ()
    (cond ((= count 9) t)
          (t ))
)

(defun game-init ()
  (for ((i 0 (+ i 1)))
       ((> i 2) t)
       (for ((j 0 (+ j 1)))
            ((> j 2) t)
            (set-aref 0 board i j) 
            (tk::create 'c0 (rectangle (* 200 i) (* 200 j) (+ (* 200 i) 200) (+ (* 200 j) 200)) )))
)

(defun paint (x y)
  (let* ((rx (tk::winfo "rootx" 'root))
         (ry (tk::winfo "rooty" 'root))
         (i (div (- x rx) 200))
         (j (div (- y ry) 200)))
    (tk::create 'c0 (oval (* 200 i) (* 200 j) (+ (* 200 i) 200) (+ (* 200 j) 200)) '-fill 'blue)))