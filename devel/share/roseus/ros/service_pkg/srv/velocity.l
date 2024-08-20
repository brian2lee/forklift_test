;; Auto-generated. Do not edit!


(when (boundp 'service_pkg::velocity)
  (if (not (find-package "SERVICE_PKG"))
    (make-package "SERVICE_PKG"))
  (shadow 'velocity (find-package "SERVICE_PKG")))
(unless (find-package "SERVICE_PKG::VELOCITY")
  (make-package "SERVICE_PKG::VELOCITY"))
(unless (find-package "SERVICE_PKG::VELOCITYREQUEST")
  (make-package "SERVICE_PKG::VELOCITYREQUEST"))
(unless (find-package "SERVICE_PKG::VELOCITYRESPONSE")
  (make-package "SERVICE_PKG::VELOCITYRESPONSE"))

(in-package "ROS")





(defclass service_pkg::velocityRequest
  :super ros::object
  :slots (_vel _angle ))

(defmethod service_pkg::velocityRequest
  (:init
   (&key
    ((:vel __vel) 0.0)
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _vel (float __vel))
   (setq _angle (float __angle))
   self)
  (:vel
   (&optional __vel)
   (if __vel (setq _vel __vel)) _vel)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; float32 _vel
    4
    ;; float32 _angle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _vel
       (sys::poke _vel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _vel
     (setq _vel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass service_pkg::velocityResponse
  :super ros::object
  :slots (_msg ))

(defmethod service_pkg::velocityResponse
  (:init
   (&key
    ((:msg __msg) "")
    )
   (send-super :init)
   (setq _msg (string __msg))
   self)
  (:msg
   (&optional __msg)
   (if __msg (setq _msg __msg)) _msg)
  (:serialization-length
   ()
   (+
    ;; string _msg
    4 (length _msg)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _msg
       (write-long (length _msg) s) (princ _msg s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _msg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _msg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass service_pkg::velocity
  :super ros::object
  :slots ())

(setf (get service_pkg::velocity :md5sum-) "24d4aa458d7e3c3fb301764dff85bbff")
(setf (get service_pkg::velocity :datatype-) "service_pkg/velocity")
(setf (get service_pkg::velocity :request) service_pkg::velocityRequest)
(setf (get service_pkg::velocity :response) service_pkg::velocityResponse)

(defmethod service_pkg::velocityRequest
  (:response () (instance service_pkg::velocityResponse :init)))

(setf (get service_pkg::velocityRequest :md5sum-) "24d4aa458d7e3c3fb301764dff85bbff")
(setf (get service_pkg::velocityRequest :datatype-) "service_pkg/velocityRequest")
(setf (get service_pkg::velocityRequest :definition-)
      "float32 vel
float32 angle
---
string msg
")

(setf (get service_pkg::velocityResponse :md5sum-) "24d4aa458d7e3c3fb301764dff85bbff")
(setf (get service_pkg::velocityResponse :datatype-) "service_pkg/velocityResponse")
(setf (get service_pkg::velocityResponse :definition-)
      "float32 vel
float32 angle
---
string msg
")



(provide :service_pkg/velocity "24d4aa458d7e3c3fb301764dff85bbff")


