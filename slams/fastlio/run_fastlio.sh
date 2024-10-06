#! /bin/sh
. /mandeye_ws/devel/setup.sh

rosmaster &
sleep 1
roslaunch fast_lio mapping_avia.launch &

rosparam set /topic_name "/Odometry"
rosparam set /file_path "/evaluation/trajectory_${DATASET_NAME}.csv"
# launch eval - trajectory - in background
rosrun mandeye_to_rosbag1 log_trajectory &

sleep 5
echo "Playing bag file, wait"
rosbag play /test_data_bag


pkill -f ros
chmod 777 /evaluation/trajectory_${DATASET_NAME}.csv
chmod 777 /evaluation/cloud_${DATASET_NAME}.csv
