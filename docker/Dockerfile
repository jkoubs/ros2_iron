# FROM osrf/ros:iron-desktop
FROM osrf/ros:iron-desktop
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

# dependencies
RUN apt-get update --fix-missing && \
    apt-get install -y git && \
    apt-get install -y build-essential \
                       terminator \
                       nano \
                       vim \
                       python3-pip \
                       libeigen3-dev \
                       tree \
                       wget \
                       bash-completion \
                       gedit \
                       ros-iron-turtlebot3-gazebo \
                       ros-iron-nav2-simple-commander \
                       ros-iron-xacro \
                       ros-iron-joint-state-publisher \
                       ros-iron-joint-state-publisher-gui \
                       ros-iron-gazebo-ros-pkgs \
                       ros-iron-rviz2 \
                       ros-iron-rmw-cyclonedds-cpp \
                       ros-iron-robot-localization \
                       ros-iron-mapviz \
                       ros-iron-mapviz-plugins \
                       ros-iron-tile-map \
                       ros-iron-nav2-common \
                       qtbase5-dev \
                       libqt5svg5-dev \
                       libzmq3-dev \
                       libdw-dev
                       
RUN apt-get -y dist-upgrade
RUN pip3 install transforms3d

# # Create env_ws containing the turtlebot3 pkgs
# RUN mkdir -p /env_ws/src

RUN source /opt/ros/iron/setup.bash && \
    apt-get update --fix-missing 
    # cd /env_ws && \
    # # This installs dependencies declared in package.xml from all pkgs in the src folder for ROS 2 iron
    # rosdep install -i --from-path src --rosdistro iron -y && \
    # # Build env_ws
    # colcon build --symlink-install

# Source automatically the underlay (all necessary setup to run ROS2) (add it to .bashrc file)
RUN echo "source /opt/ros/iron/setup.bash" >> ~/.bashrc
# Source automatically the overlay (workspace -> env_ws) (add it to .bashrc file)
# RUN echo "source /env_ws/install/setup.bash" >> ~/.bashrc
RUN echo "source /usr/share/gazebo/setup.sh" >> ~/.bashrc

COPY ros_entrypoint.sh /ros_entrypoint.sh
RUN chmod +x /ros_entrypoint.sh

# Set Working directory
WORKDIR '/'
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]