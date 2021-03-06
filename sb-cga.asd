;;;; By Nikodemus Siivola <nikodemus@random-state.net>, 2009.
;;;;
;;;; Permission is hereby granted, free of charge, to any person
;;;; obtaining a copy of this software and associated documentation files
;;;; (the "Software"), to deal in the Software without restriction,
;;;; including without limitation the rights to use, copy, modify, merge,
;;;; publish, distribute, sublicense, and/or sell copies of the Software,
;;;; and to permit persons to whom the Software is furnished to do so,
;;;; subject to the following conditions:
;;;;
;;;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;;;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;;;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
;;;; IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
;;;; CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
;;;; TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
;;;; SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

(defsystem :sb-cga
  :description "Computer graphic algebra for SBCL."
  :depends-on (:alexandria)
  :serial t
  :components
  ((:file "package")
   (:file "types")
   (:file "fndb")
   (:module "ports"
            :if-component-dep-fails :try-next
            :components ((:file "sbcl" :in-order-to ((compile-op (feature :sbcl))))
                         (:file "ccl" :in-order-to ((compile-op (feature :ccl))))
                         (:file "abcl" :in-order-to ((compile-op (feature :abcl))))
                         (:file "acl" :in-order-to ((compile-op (feature :allegro))))
                         (:file "ecl" :in-order-to ((compile-op (feature :ecl))))
                         ;; is there some way to load this iff none of
                         ;; the others matched?
                         (:file "ansi" :in-order-to ((compile-op (feature :clisp))))))
   (:file "vm")
   (:file "vec")
   (:file "matrix")
   (:file "roots")))
