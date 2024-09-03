# Slams_dojo
A collection of dockerized enviroments to run slams

# Repo structure


# Kiss-icp

It is a orginal code from [orginal repo](https://github.com/PRBonn/kiss-icp) and custom config.

To run system perform steps:
```
docker build ./slams/kiss-icp/ -t dojo_kiss_office --build-arg DATASET=./slams_dojo_datasets/data_office.sh 
docker run -v ./elaluation-kiss-icp:/evaluation dojo_kiss_office ./system_run.sh
```
