#!/usr/bin/env python3
import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

class ImageConverter:
    def __init__(self):
        self.bridge = CvBridge()

        # Subscribe to topics
        rospy.Subscriber("/camera/color/image_raw", Image, self.color_callback, queue_size=1)
        rospy.Subscriber("/camera/depth/image_raw", Image, self.depth_callback, queue_size=1)
        #rospy.Subscriber("/camera/color/image_seg", Image, self.seg_callback, queue_size=1)

        # Create OpenCV windows
        cv2.namedWindow("Color Image", cv2.WINDOW_NORMAL)
        cv2.namedWindow("Depth Image", cv2.WINDOW_NORMAL)
        #cv2.namedWindow("Seg Image", cv2.WINDOW_NORMAL)

    def color_callback(self, data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
            if cv_image is not None:
                cv2.imshow("Color Image", cv_image)
                cv2.waitKey(3)
        except CvBridgeError as e:
            rospy.logerr(f"CVBridge Error: {e}")
        except Exception as e:
            rospy.logerr(f"Unexpected error in color_callback: {e}")

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
'''
    def seg_callback(self, data):
        try:
            seg_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
            if seg_image is not None:
                cv2.imshow("Seg Image", seg_image)
                cv2.waitKey(3)
        except CvBridgeError as e:
            rospy.logerr(f"CVBridge Error: {e}")
        except Exception as e:
            rospy.logerr(f"Unexpected error in seg_callback: {e}")
'''
def main():
    rospy.init_node('image_converter', anonymous=True)
    ic = ImageConverter()

    while not rospy.is_shutdown():
        cv2.waitKey(10)  # Keeps OpenCV event loop active

    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()

