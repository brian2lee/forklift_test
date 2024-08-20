; Auto-generated. Do not edit!


(cl:in-package service_pkg-srv)


;//! \htmlinclude velocity-request.msg.html

(cl:defclass <velocity-request> (roslisp-msg-protocol:ros-message)
  ((vel
    :reader vel
    :initarg :vel
    :type cl:float
    :initform 0.0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass velocity-request (<velocity-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <velocity-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'velocity-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name service_pkg-srv:<velocity-request> is deprecated: use service_pkg-srv:velocity-request instead.")))

(cl:ensure-generic-function 'vel-val :lambda-list '(m))
(cl:defmethod vel-val ((m <velocity-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader service_pkg-srv:vel-val is deprecated.  Use service_pkg-srv:vel instead.")
  (vel m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <velocity-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader service_pkg-srv:angle-val is deprecated.  Use service_pkg-srv:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <velocity-request>) ostream)
  "Serializes a message object of type '<velocity-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <velocity-request>) istream)
  "Deserializes a message object of type '<velocity-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<velocity-request>)))
  "Returns string type for a service object of type '<velocity-request>"
  "service_pkg/velocityRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'velocity-request)))
  "Returns string type for a service object of type 'velocity-request"
  "service_pkg/velocityRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<velocity-request>)))
  "Returns md5sum for a message object of type '<velocity-request>"
  "24d4aa458d7e3c3fb301764dff85bbff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'velocity-request)))
  "Returns md5sum for a message object of type 'velocity-request"
  "24d4aa458d7e3c3fb301764dff85bbff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<velocity-request>)))
  "Returns full string definition for message of type '<velocity-request>"
  (cl:format cl:nil "float32 vel~%float32 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'velocity-request)))
  "Returns full string definition for message of type 'velocity-request"
  (cl:format cl:nil "float32 vel~%float32 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <velocity-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <velocity-request>))
  "Converts a ROS message object to a list"
  (cl:list 'velocity-request
    (cl:cons ':vel (vel msg))
    (cl:cons ':angle (angle msg))
))
;//! \htmlinclude velocity-response.msg.html

(cl:defclass <velocity-response> (roslisp-msg-protocol:ros-message)
  ((msg
    :reader msg
    :initarg :msg
    :type cl:string
    :initform ""))
)

(cl:defclass velocity-response (<velocity-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <velocity-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'velocity-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name service_pkg-srv:<velocity-response> is deprecated: use service_pkg-srv:velocity-response instead.")))

(cl:ensure-generic-function 'msg-val :lambda-list '(m))
(cl:defmethod msg-val ((m <velocity-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader service_pkg-srv:msg-val is deprecated.  Use service_pkg-srv:msg instead.")
  (msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <velocity-response>) ostream)
  "Serializes a message object of type '<velocity-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'msg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <velocity-response>) istream)
  "Deserializes a message object of type '<velocity-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'msg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'msg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<velocity-response>)))
  "Returns string type for a service object of type '<velocity-response>"
  "service_pkg/velocityResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'velocity-response)))
  "Returns string type for a service object of type 'velocity-response"
  "service_pkg/velocityResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<velocity-response>)))
  "Returns md5sum for a message object of type '<velocity-response>"
  "24d4aa458d7e3c3fb301764dff85bbff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'velocity-response)))
  "Returns md5sum for a message object of type 'velocity-response"
  "24d4aa458d7e3c3fb301764dff85bbff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<velocity-response>)))
  "Returns full string definition for message of type '<velocity-response>"
  (cl:format cl:nil "string msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'velocity-response)))
  "Returns full string definition for message of type 'velocity-response"
  (cl:format cl:nil "string msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <velocity-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <velocity-response>))
  "Converts a ROS message object to a list"
  (cl:list 'velocity-response
    (cl:cons ':msg (msg msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'velocity)))
  'velocity-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'velocity)))
  'velocity-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'velocity)))
  "Returns string type for a service object of type '<velocity>"
  "service_pkg/velocity")