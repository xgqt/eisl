(let* ((input "1 + 1")
       (in (create-string-input-stream input))
       (char nil))
  (while (setq char (preview-char in nil))
    (format (standard-output) "Char: ~S~%" char)
    (read-char in nil))
  (close in))

  ; echo -ne "foo\nbar\nbaz" | eisl -s run2.lsp