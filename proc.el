;;; proc.el --- Macros for writing human readable elisp code. -*- lexical-binding: t; -*-

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Macros for writing human readable elisp code.

;;; Code:

;;;###autoload
(defmacro proc (&rest forms)
  "C-style variables definition."
  (if (<= (length forms) 1)
      `(progn ,@forms)
    (let ((form (car forms)))
      `(let (,(if (and (listp form)
                       (eq :let (car form)))
                  `(,(nth 1 form) ,(nth 2 form))
                `(_ ,form)))
         (proc ,@(cdr forms))))))

(provide 'proc)
