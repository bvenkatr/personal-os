####What is Docker ?
 	Docker is a platform for developing, shipping and running applications using container virtualization technology.
  
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
