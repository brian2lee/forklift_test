// Auto-generated. Do not edit!

// (in-package service_pkg.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class velocityRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vel = null;
      this.angle = null;
    }
    else {
      if (initObj.hasOwnProperty('vel')) {
        this.vel = initObj.vel
      }
      else {
        this.vel = 0.0;
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type velocityRequest
    // Serialize message field [vel]
    bufferOffset = _serializer.float32(obj.vel, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = _serializer.float32(obj.angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type velocityRequest
    let len;
    let data = new velocityRequest(null);
    // Deserialize message field [vel]
    data.vel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'service_pkg/velocityRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '56b3c950fbe3e7dc9e7434c86bc55fdc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 vel
    float32 angle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new velocityRequest(null);
    if (msg.vel !== undefined) {
      resolved.vel = msg.vel;
    }
    else {
      resolved.vel = 0.0
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0.0
    }

    return resolved;
    }
};

class velocityResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.msg = null;
    }
    else {
      if (initObj.hasOwnProperty('msg')) {
        this.msg = initObj.msg
      }
      else {
        this.msg = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type velocityResponse
    // Serialize message field [msg]
    bufferOffset = _serializer.string(obj.msg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type velocityResponse
    let len;
    let data = new velocityResponse(null);
    // Deserialize message field [msg]
    data.msg = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.msg);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'service_pkg/velocityResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7d96ed730776804754140b85e64c862e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string msg
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new velocityResponse(null);
    if (msg.msg !== undefined) {
      resolved.msg = msg.msg;
    }
    else {
      resolved.msg = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: velocityRequest,
  Response: velocityResponse,
  md5sum() { return '24d4aa458d7e3c3fb301764dff85bbff'; },
  datatype() { return 'service_pkg/velocity'; }
};
