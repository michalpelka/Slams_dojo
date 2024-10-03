# Slams_dojo
A collection of dockerized enviroments to run SLAM algorithm against data from 


# Datasets

In every SLAM's directory there is instance of subrepo slam_dojo_datasets.
That repository contains available datasets to test against.

### Own dataset
You can use own dataset from Mandeye. Please put it  `./*/slams_dojo_datasets/user_data`.
Then as Dataset use:
```
--build-arg DATASET=./slams_dojo_datasets/users_data.sh
```


# Kiss-icp

It is a orginal code from [orginal repo](https://github.com/PRBonn/kiss-icp) and custom config.

To run system perform steps:
```
docker build ./slams/kiss-icp/ -t dojo_kiss_office --build-arg DATASET=./slams_dojo_datasets/data_office.sh 
docker run -v ./elaluation-kiss-icp:/evaluation dojo_kiss_office ./system_run.sh
```
