# Slams_dojo
A collection of dockerized enviroments to run SLAM algorithm against data from 


# Datasets

In every SLAM's directory there is instance of subrepo slam_dojo_datasets.
That repository contains available datasets to test against.

### Avialable Datasets:
 - data_office
 - data_undeground_parking
 - roccastrada

### Own dataset
You can use own dataset from Mandeye. Please put it  `./*/slams_dojo_datasets/user_data`.
Then as Dataset use:
```bash
--build-arg DATASET=users_data
```


# Kiss-icp

It is a original code from [orginal repo](https://github.com/PRBonn/kiss-icp) and custom config.

To run system perform steps:
```bash
docker build ./slams/kiss-icp/ -t dojo_kiss_office --build-arg DATASET=data_office 
docker run -v ./evaluation-kiss-icp:/evaluation dojo_kiss_office ./system_run.sh
```

# FAST LIO

It is a original code from [original repo](https://github.com/hku-mars/FAST_LIO).

To run system perform steps:
```bash
docker build ./slams/fastlio/ -t dojo_fastlio_parking --build-arg DATASET=data_undeground_parking 
docker run -v ./evaluation-fastlio:/evaluation dojo_fastlio_parking ./system_run.sh
```



## GUI and RViz

You can use `osrf/rocker` instead of `docker run`. 
It will allow you to evaluate output in realtime with rviz.
Here is example for FAST-LIO:
```bash
rocker --x11 --nvidia auto --volume $(pwd)/evaluation-fastlio:/evaluation -- dojo_fastlio_parking ./system_run.sh
```
