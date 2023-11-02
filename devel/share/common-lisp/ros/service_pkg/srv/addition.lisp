; Auto-generated. Do not edit!


(cl:in-package service_pkg-srv)


;//! \htmlinclude addition-request.msg.html

(cl:defclass <addition-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0))
)

(cl:defclass addition-request (<addition-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <addition-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'addition-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name service_pkg-srv:<addition-request> is deprecated: use service_pkg-srv:addition-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <addition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader service_pkg-srv:x-val is deprecated.  Use service_pkg-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <addition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader service_pkg-srv:y-val is deprecated.  Use service_pkg-srv:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <addition-request>) ostream)
  "Serializes a message object of type '<addition-request>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <addition-request>) istream)
  "Deserializes a message object of type '<addition-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<addition-request>)))
  "Returns string type for a service object of type '<addition-request>"
  "service_pkg/additionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addition-request)))
  "Returns string type for a service object of type 'addition-request"
  "service_pkg/additionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<addition-request>)))
  "Returns md5sum for a message object of type '<addition-request>"
  "2e826885481512e423cbb9c656d021d7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'addition-request)))
  "Returns md5sum for a message object of type 'addition-request"
  "2e826885481512e423cbb9c656d021d7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<addition-request>)))
  "Returns full string definition for message of type '<addition-request>"
  (cl:format cl:nil "int64 x~%int64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'addition-request)))
  "Returns full string definition for message of type 'addition-request"
  (cl:format cl:nil "int64 x~%int64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <addition-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <addition-request>))
  "Converts a ROS message object to a list"
  (cl:list 'addition-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
;//! \htmlinclude addition-response.msg.html

(cl:defclass <addition-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass addition-response (<addition-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <addition-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'addition-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name service_pkg-srv:<addition-response> is deprecated: use service_pkg-srv:addition-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <addition-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader service_pkg-srv:result-val is deprecated.  Use service_pkg-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <addition-response>) ostream)
  "Serializes a message object of type '<addition-response>"
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <addition-response>) istream)
  "Deserializes a message object of type '<addition-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<addition-response>)))
  "Returns string type for a service object of type '<addition-response>"
  "service_pkg/additionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addition-response)))
  "Returns string type for a service object of type 'addition-response"
  "service_pkg/additionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<addition-response>)))
  "Returns md5sum for a message object of type '<addition-response>"
  "2e826885481512e423cbb9c656d021d7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'addition-response)))
  "Returns md5sum for a message object of type 'addition-response"
  "2e826885481512e423cbb9c656d021d7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<addition-response>)))
  "Returns full string definition for message of type '<addition-response>"
  (cl:format cl:nil "int64 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'addition-response)))
  "Returns full string definition for message of type 'addition-response"
  (cl:format cl:nil "int64 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <addition-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <addition-response>))
  "Converts a ROS message object to a list"
  (cl:list 'addition-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'addition)))
  'addition-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'addition)))
  'addition-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addition)))
  "Returns string type for a service object of type '<addition>"
  "service_pkg/addition")