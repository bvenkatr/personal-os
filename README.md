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
