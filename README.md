####What is Docker ?
 	Docker is a platform for developing, shipping and running applications using container virtualization technology.

####Benefits of Docker
	1. Separation of concerns
		-> Developers focus on building their apps
		-> System admins focus on deployment
	Note:- Previous developers used to write applications on allocated environment and pass that to sys-admins to deploy, and during deployment the sys admin might discover that libraries the application depends on missing in the deployment environment.
		-> Fast development cycle
		-> Application portability
			-> build in one environment and ship to another(I am not getting a clear imaginary picture on this, so I need to help on this)
		-> Scalability
			-> Easily spin up new constainers if needed
		-> Run more apps on one host machine.
####The Docker platform consists of multiple products/tools.
1. Docker Engine
2. Docker Hub
3. Docker Machine
4. Docker Swarm
5. Docker Compose
6. Kitematic

######Docker Engine
	Is is the program that enables containers to be built, shipped and run. It uses Linux Kernal namespaces and control groups. Namespaces give us the isolated workspace.
######Docker Hub
	Is is the public registry that contains large number of images available for use.
	
###Docker Orchestration
	The three tools for orchestrating distributed applications with docker are  docker machine, docker swarm and docker compose.
######Docker Machine
	It is tool that provisions docker hosts and installs the docker engine on them.
######Docker Swarm
	Tool that clusters many engines and schedules containers.
######Docker Compose
	Tool to create and manage multi-container applications
######Kitematic
	an application that lets you set up Docker and run containers using a graphical user interface (GUI).
	The easiest way to get started with docker in minutes.

####Installing docker on ubuntu
	wget -qO https://get.docker.com/ | sh   => -qO  here O is Big O,  not zero.
	
	Here url returns all shell scripts and then we are redirecting those scripts to run on sh.
	
####Creating containers
	sudo docker run hello-world
	
	Here docker command will create a container from image called hello-world and starts that container. First docker looks for hello-world image on local machine,  If it can't find it locally then it will looks at docker registry and gets from there.
	
	Note:- If you would like to use docker as a non-root user, you should now consider adding your user to the "docker" group with something like below
	
	sudo usermod -aG docker venkat
	
	Remember that you will have to log out and back in for this to take effect!
	
####Introducing Containers
	Container based virtualization uses the kernel on the host's operating sytem to run multiple guest instances.
	Each guest instance is called a container.
	
	Each container has its own
		1. Root File System
		2. Processes
		3. Memory
		4. Devices
		5. Network Ports

####Containers VS VMs
	1. Containers are more lightweight
	2. No need to install guest os
	3. Less CPU, RAM, Storage space required.
	4. More containers per machine than VMs
	5. Greater Productivity

####Docker containers and images
#####Images
	1. Read only template used to create containers
	2. Built by you or other docker users
	3. Stored in the docker hub or your local registry
#####Containers
	1. Isolated application platform
	2. Contains everything needed to run your application(necessary libraries and binaries)

####Build New Image
	1. Create a container from an Ubuntu image and run a bash terminal
		docker run -i -t ubuntu:14.04 /bin/bash
	2. Inside the container, install curl
		apt-get update (do it if you didn't do already)
		apt-get install curl
	3. Exit the container terminal
	4. Run docker ps -a and take note of your container ID
	5. Save the container as a new Image. For the repository name use <your name>/curl. Tag the Image as 1.0
		docker commit <container ID> <your name>/curl:1.0
	6. Run docker Images and verify that you can see your new image.

####Use New Iamge
	1. Create a container using the new image you created in the previous step. Run /bin/bash as the process to get terminal access
		docker run -it venkat/curl:1.0 /bin/bash
	2. verify that curl is installed
		which curl

####Dockerfile Instructions
	1. Instructions specify what to do when building the image
	2. FROM instruction specifies what the base image should be
	3. RUN instruction specifies a command to execute
		#Example of a comment
		FROM ubuntu:14.04
		RUN apt-get install vim
		RUN apt-get install curl

####Volumes
	A Volume is a designated directory in a container, which is designed to persist data, independent of the container's life cycle.
		1. Volume changes are excluded when updating an image
		2. Persist when a container is deleted
		3. Can be mapped to a host folder
		4. Can be shared between containers

####Mount a volume
	1. Volumes are mounted when creating or executing a container 
	2. Can be mapped to a host directory
	3. Volume paths specified must be absolute
		Execute a new container and mount the folder /myvolume into its file system
			docker run -d -P -v /myvolme nginx:1.7
		Execute a new container and map the /data/src folder from the host into the /test/src folder in the container
			docker run -it -v /data/src:/test/src nginx:1.7

####Volumes in Dockerfile
	Get the content for this from docker getting started videos

####Uses of volumes 
	1. De-couple the data that is stored from the container which created the data
	2. Good for sharing data between containers
		-> Can setup a data containers which has a volume you mount in other containers
	3. Mounting folders from the host is good for testing purposes but generally not recommended for production use.

####Create and test a volume
	1. Execute a new container and initialise a volume at /www/website. Run a bash terminal as your container process
		docker run -it -v /www/website ubuntu:14.04 bash
	2. Inside the container, verify that you can get to /www/website
	3. Create a file inside the /www/website folder
	4. Exit the container
	5. Commit the updated container as a new image called test and tag it as 1.0
		docker commit <container ID> test:1.0
	6. Execute a new container with your test image and go into it's bash shell
		docker run -it test:1.0 bash
	7. Verify that the /www/website folder exists and that there are no files inside
	
####Linking Containers
	Linking is a communication method between containers which allows them to securely transfer the data from one to another.
		-> Source and recipient containers
		-> Recipient containers have access to data on source containers
		-> Links are established based on container names
![Container Linking](https://photos.google.com/share/AF1QipOhd_mbmluuXOs5YI2x5DbmTTtmrZHCwH3-bqr021-5SlKiLzA5ZOiTR0QZGxK_2w/photo/AF1QipMdpP4c3rbm32ov_ErujJvOdJg0JxrJ_2IuT0im?key=MGJfazZZQVVZcXdvTUJray1JOFAxVV81X1BWelRn)
