#!/usr/bin/env python3
import cv2
from cv_bridge import CvBridge, CvBridgeError
import numpy
import rospy
from sensor_msgs.msg import Image

class ColorSegmentator(object):
    def __init__(self):
        # Create an instance of CvBridge
        self.bridge = CvBridge()
        # Create a publisher to publish the modified image to
        self.segmented_img_pub = rospy.Publisher(
            '/camera/color/image_seg', Image, queue_size=1)
        # Create a subscriber to receive the robot's front camera image
        self.image_sub = rospy.Subscriber(
            '/camera/color/image_raw', Image, self.image_callback)
        # Define a range of colors to detect red
        self.boundaries = [
            # Lower red range
            ([0, 50, 50], [10, 255, 255]),
            # Upper red range
            ([160, 50, 50], [180, 255, 255])
        ]

    def image_callback(self, msg):
        # Function called each time an image is received from the robot
        try:
            # Convert the image to a CVMat
            cv_image = self.bridge.imgmsg_to_cv2(msg, 'bgr8')
        except CvBridgeError as e:
            rospy.logerr(e)
            return

        # Convert the BGR image to HSV
        hsv_image = cv2.cvtColor(cv_image, cv2.COLOR_BGR2HSV)

        # Create masks for each range of red
        masks = []
        for (lower, upper) in self.boundaries:
            # Create NumPy arrays from the boundaries
            lower = numpy.array(lower, dtype='uint8')
            upper = numpy.array(upper, dtype='uint8')
            # Find the colors within the specified boundaries and create a mask out of it
            mask = cv2.inRange(hsv_image, lower, upper)
            masks.append(mask)

        # Combine the masks
        combined_mask = cv2.bitwise_or(masks[0], masks[1])

        # Create a black image
        black_image = numpy.zeros_like(cv_image)

        # Create a red image where detected red areas will be
        red_image = numpy.zeros_like(cv_image)
        red_image[:] = [0, 0, 255]  # OpenCV uses BGR format, so [0, 0, 255] is red

        # Apply the mask to the red image
        red_areas = cv2.bitwise_and(red_image, red_image, mask=combined_mask)

        # Combine the black image with the red areas
        output = cv2.add(black_image, red_areas)

        try:
            # Convert the resulting image to a ROS Image message
            masked_image_msg = self.bridge.cv2_to_imgmsg(output, 'bgr8')
        except CvBridgeError as e:
            rospy.logerr(e)
            return
        
        # Publish the resulting image
        self.segmented_img_pub.publish(masked_image_msg)

def blob_detector():
    node = ColorSegmentator()
    rospy.init_node('blob_detector')
    rospy.spin()

if __name__ == '__main__':
    blob_detector()

