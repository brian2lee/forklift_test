#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/brian/forklift_test/src/ros-gazebo-gym"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/brian/forklift_test/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/brian/forklift_test/install/lib/python3/dist-packages:/home/brian/forklift_test/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/brian/forklift_test/build" \
    "/usr/bin/python3" \
    "/home/brian/forklift_test/src/ros-gazebo-gym/setup.py" \
    egg_info --egg-base /home/brian/forklift_test/build/ros-gazebo-gym \
    build --build-base "/home/brian/forklift_test/build/ros-gazebo-gym" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/brian/forklift_test/install" --install-scripts="/home/brian/forklift_test/install/bin"
