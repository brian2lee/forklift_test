#!/usr/bin/env python3
import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

class ImageConverter:
    def __init__(self):
        self.bridge = CvBridge()

        # Subscribe to topics
        rospy.Subscriber("/camera/color/image_raw", Image, self.color_callback, queue_size=1)
        rospy.Subscriber("/camera/depth/image_raw", Image, self.depth_callback, queue_size=1)
        rospy.Subscriber("/camera/color/image_seg", Image, self.seg_callback, queue_size=1)

        # Create OpenCV windows
        cv2.namedWindow("Color Image", cv2.WINDOW_NORMAL)
        cv2.namedWindow("Depth Image", cv2.WINDOW_NORMAL)
        cv2.namedWindow("Seg Image", cv2.WINDOW_NORMAL)

    def color_callback(self, data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
            cv2.imshow("Color Image", cv_image)
            cv2.waitKey(3)
        except CvBridgeError as e:
            rospy.logerr(f"CVBridge Error: {e}")

    def depth_callback(self, data):
        try:
            depth_image = self.bridge.imgmsg_to_cv2(data, "passthrough")
            depth_image_normalized = cv2.normalize(depth_image, None, 0, 255, cv2.NORM_MINMAX)
            depth_image_8bit = cv2.convertScaleAbs(depth_image_normalized)
            cv2.imshow("Depth Image", depth_image_8bit)
            cv2.waitKey(3)
        except CvBridgeError as e:
            rospy.logerr(f"CVBridge Error: {e}")

    def seg_callback(self, data):
        try:
            seg_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
            cv2.imshow("Seg Image", seg_image)
            cv2.waitKey(3)
        except CvBridgeError as e:
            rospy.logerr(f"CVBridge Error: {e}")

def main():
    rospy.init_node('image_converter', anonymous=True)
    ic = ImageConverter()

    while not rospy.is_shutdown():
        cv2.waitKey(10)  # Keeps OpenCV event loop active

    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()

