#! /bin/sh
. /mandeye_ws/install/setup.sh 
cd src
git clone https://github.com/PRBonn/kiss-icp && cd kiss-icp
cd ../..
colcon build