
(cl:in-package :asdf)

(defsystem "service_pkg-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "addition" :depends-on ("_package_addition"))
    (:file "_package_addition" :depends-on ("_package"))
    (:file "velocity" :depends-on ("_package_velocity"))
    (:file "_package_velocity" :depends-on ("_package"))
  ))