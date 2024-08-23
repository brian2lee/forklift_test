#!/usr/bin/env python3
import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

class ImageConverter:

    def __init__(self):
        self.bridge = CvBridge()

        # Subscribers for the two image topics
        self.color_sub = rospy.Subscriber("/camera/color/image_raw", Image, self.color_callback)
        self.depth_sub = rospy.Subscriber("/camera/depth/image_raw", Image, self.depth_callback)

    def color_callback(self, data):
        try:
            # Convert the ROS Image message to a CV2 image for the color camera
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)
            return

        # Display the color image in an OpenCV window
        cv2.imshow("Color Image", cv_image)
        cv2.waitKey(3)

    def depth_callback(self, data):
        try:
            # Convert the ROS Image message to a CV2 image for the depth camera
            cv_image = self.bridge.imgmsg_to_cv2(data, "16UC1")
        except CvBridgeError as e:
            print(e)
            return

        # Normalize the depth image for display
        cv_image = cv2.normalize(cv_image, None, 0, 255, cv2.NORM_MINMAX)
        cv_image = cv2.convertScaleAbs(cv_image)

        # Display the depth image in a separate OpenCV window
        cv2.imshow("Depth Image", cv_image)
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

