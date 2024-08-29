#!/usr/bin/env python3
import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

class ImageConverter:

    def __init__(self):
        self.bridge = CvBridge()
        # Subscribe to the color image topic
        self.image_sub_color = rospy.Subscriber("/camera/color/image_raw", Image, self.color_callback)
        # Subscribe to the depth image topic
        self.image_sub_depth = rospy.Subscriber("/camera/depth/image_raw", Image, self.depth_callback)
        # Subscribe to the seg image topic
        self.image_sub_seg = rospy.Subscriber("/camera/color/image_seg", Image, self.seg_callback)

        # Initialize window thread (to handle multi-threading issues with OpenCV)
        cv2.startWindowThread()

    def color_callback(self, data):
        try:
            # Convert the ROS Image message to a CV2 image
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)
            return

        # Display the color image in an OpenCV window
        cv2.imshow("Color Image", cv_image)
        cv2.waitKey(3)

    def depth_callback(self, data):
        try:
            # Convert the ROS Image message to a CV2 image
            depth_image = self.bridge.imgmsg_to_cv2(data, desired_encoding="passthrough")
        except CvBridgeError as e:
            print(e)
            return

        # Normalize the depth image to 0-255 and convert it to 8-bit to display
        depth_image_normalized = cv2.normalize(depth_image, None, 0, 255, cv2.NORM_MINMAX)
        depth_image_8bit = cv2.convertScaleAbs(depth_image_normalized)

        # Display the depth image in an OpenCV window
        cv2.imshow("Depth Image", depth_image_8bit)
        cv2.waitKey(3)

    def seg_callback(self, data):
        try:
            # Convert the ROS Image message to a CV2 image
            seg_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)
            return

        # Display the segmented image in an OpenCV window
        cv2.imshow("Seg Image", seg_image)
        cv2.waitKey(3)

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

