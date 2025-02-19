#!/usr/bin/env python3
import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

class ImageConverter:

    def __init__(self):
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber("/camera/color/image_raw", Image, self.callback)

    def callback(self, data):
        try:
            # Convert the ROS Image message to a CV2 image
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)
            return

        # Display the image in an OpenCV window
        cv2.imshow("Camera Image", cv_image)
        cv2.waitKey(3)

    def depth_callback(data):
        bridge = CvBridge()
        try:
            rospy.loginfo(f"Received depth image with encoding: {data.encoding}")
    
            # Convert ROS Image to OpenCV format
            if data.encoding == "16UC1":
                depth_image = bridge.imgmsg_to_cv2(data, "16UC1").astype(np.float32)
    
                # Convert from millimeters to meters (for visualization)
                depth_image /= 1000.0
    
                # Clip depth values to match RViz's default range (0.1m to 5m)
                depth_image = np.clip(depth_image, 0.1, 5.0)
    
                # Normalize for visualization (convert range 0.1m - 5m → 0-255 grayscale)
                depth_image_normalized = cv2.normalize(depth_image, None, 0, 255, cv2.NORM_MINMAX)
                depth_image_8bit = np.uint8(depth_image_normalized)
    
                # Apply COLORMAP_JET for better depth perception
                depth_image_colored = cv2.applyColorMap(depth_image_8bit, cv2.COLORMAP_JET)
                depth_image_colored = cv2.cvtColor(depth_image_8bit, cv2.COLOR_GRAY2BGR)
    
                # Display the processed depth image
                cv2.imshow("Depth Image", depth_image_colored)
                cv2.waitKey(3)
            else:
                rospy.logwarn(f"Unsupported encoding: {data.encoding}")
    
        except CvBridgeError as e:
            rospy.logerr(f"CVBridge Error: {e}")
        except Exception as e:
            rospy.logerr(f"Unexpected error in depth_callback: {e}")


def main():
    rospy.init_node('image_converter', anonymous=True)
    ic = ImageConverter()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()

