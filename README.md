# reCAPTCHA Enterprise

reCAPTCHA Enterprise system for Common Lisp

## Installation

This system can be installed from [UltraLisp](https://ultralisp.org/) like this:

```common-lisp
(ql-dist:install-dist "http://dist.ultralisp.org/"
                      :prompt nil)
(ql:quickload "recaptcha-enterprise")
```

## Usage

```common-lisp
(defpackage foo
  (:use :cl)
  (:local-nicknames (:re :recaptcha-enterprise)))

(setf re:*api-key* "API key associated with the current project")
(setf re:*project-id* "your Google Cloud project ID")

(let ((response (re:verify "Key ID from project" "token")))
  (if (re:validp response)
      (format t "Recaptcha score: ~A" (re:score response))
      (format t "Recaptcha invalid, reason: ~A" (re:invalid-reason response))))
```

