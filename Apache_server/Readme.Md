1. create a directory “Apache”

# mkdir Apache
# cd Apache
2. Create Dockerfile with proper instructions

arunlal@linux:~/myDockerLab/Apache$ cat Dockerfile

FROM ubuntu:14.04
MAINTAINER arun@crybit.com
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y apache2 
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
Next we need to build the image using this docker file. We can use “docker build” command to build the image.

docker build -t myapache:ver0.1 .
Output should be like

runlal@linux:~/myDockerLab/Apache$ docker build -t myapache:ver0.1 .
Sending build context to Docker daemon  2.048kB
Step 1/6 : FROM ubuntu:14.04
 ---> 67759a80360c
Step 2/6 : MAINTAINER arun@crybit.com
 ---> Using cache
 ---> 085f987d65d5
Step 3/6 : RUN apt-get update && apt-get upgrade
 ---> Using cache
 ---> ae140ec22b7b
Step 4/6 : RUN apt-get install -y apache2
 ---> Using cache
 ---> 485b5f9955a3
Step 5/6 : EXPOSE 80
 ---> Using cache
 ---> 1e9860e549e9
Step 6/6 : CMD apache2ctl -D FOREGROUND
 ---> Using cache
 ---> 7003e959ed73
Successfully built 7003e959ed73
Successfully tagged myapache:ver0.1
You can check the images using the following command:

docker images
Output

arunlal@linux:~/myDockerLab/Apache$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
myapache            0.0.1               7003e959ed73        26 hours ago        257MB
myapache            ver.1               7003e959ed73        26 hours ago        257MB
myapache            ver0.1              7003e959ed73        26 hours ago        257MB
Yup we created the image from our Dockerfile. Next step is creating and starting the container using this image. We can use “docker run” command to create a container.

docker run -it --name My_Apache_Test -d -p 1881:80 7003e959ed73
Here, My_Apache_Test is the container name, 1881 is the port for Apache on that container, 7003e959ed73 is the image ID.

You can check the status using “docker ps” command.

arunlal@linux:~/myDockerLab/Apache$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                  NAMES
f170a8e403ff        7003e959ed73        "apache2ctl -D FOR..."   11 seconds ago      Up 10 seconds       0.0.0.0:1881->80/tcp   My_Apache_Test
Use “docker ps -a” to list active and inactive containers.

That’s it!! You started the container with Apache installed. You can check the status by accessing it on browser with 1881 port.

IP:1881

For local host: http://localhost:1881
