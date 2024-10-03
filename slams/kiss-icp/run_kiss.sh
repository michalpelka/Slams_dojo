#! /bin/sh
. /mandeye_ws/install/setup.sh 

# launch system  - in background 
ros2 run kiss_icp kiss_icp_node \
  --ros-args \
  -r pointcloud_topic:=/livox/pointcloud \
  -p lidar_odom_frame:=livox\
  -p publish_odom_tf:=false\
  -p invert_odom_tf:=false\
  -p max_range:=100.0 \
  -p min_range:=1.0 \
  -p deskew:=false \
  -p max_points_per_voxel:=500 \
  -p voxel_size:=0.3 \
  -p initial_threshold:=2.0 \
  -p min_motion_th:=0.1 \
  -p max_num_iterations:=500 \
  -p convergence_criterion:=0.0001 \
  -p max_num_threads:=0 \
  -p position_covariance:=0.1 \
  -p orientation_covariance:=0.1 \
  -p publish_debug_clouds:=true \
  -p use_sim_time:=false &

# launch eval - trajectory - in background
ros2 run mandeye_to_rosbag2 log_trajectory --ros-args -p topic:=/kiss/odometry -p output_file:=/evaluation/trajectory_${DATASET_NAME}.csv&

# launch eval - pointcloud 
ros2 run mandeye_to_rosbag2 log_cloud --ros-args -p topic:=/kiss/local_map -p output_file:=/evaluation/cloud_${DATASET_NAME}.csv&

#play bag
sleep 2
echo "Playing bag file, wait"
ros2 bag play /test_data_bag
echo "Bag file finished, killall ros2 nodes"

pkill -f ros
