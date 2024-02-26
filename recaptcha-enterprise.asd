(defsystem recaptcha-enterprise
  :version "0.1.1"
  :author "Dmitrii Kosenkov"
  :license "MIT"
  :depends-on ("dexador" "jonathan")
  :description "reCAPTCHA Enterprise system"
  :homepage "https://github.com/Junker/recaptcha-enterprise"
  :source-control (:git "https://github.com/Junker/recaptcha-enterprise.git")
  :components ((:file "package")
               (:file "recaptcha-enterprise")))
