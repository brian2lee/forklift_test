#!/usr/bin/env python3
import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

class DepthImageConverter:

    def __init__(self):
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber("/camera/depth/image_raw", Image, self.callback)

    def callback(self, data):
        try:
            # Convert the ROS Image message to a CV2 depth image
            cv_image = self.bridge.imgmsg_to_cv2(data, desired_encoding="passthrough")
        except CvBridgeError as e:
            print(e)
            return

        # Normalize the depth image to fall within 0-255 and convert it to uint8
        cv_image_norm = cv2.normalize(cv_image, None, 0, 255, cv2.NORM_MINMAX)
        depth_map = cv_image_norm.astype(np.uint8)

        # Display the depth image in an OpenCV window
        cv2.imshow("Depth Image", depth_map)
        cv2.waitKey(3)

def main():
    rospy.init_node('depth_image_converter', anonymous=True)
    dic = DepthImageConverter()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()
