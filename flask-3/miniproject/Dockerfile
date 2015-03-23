
# Set the base image to Ubuntu
FROM debian

# File Author / Maintainer
MAINTAINER Andrew

# Update the sources list
RUN apt-get update

# Install basic applications
#RUN apt-get install -y 

# Install Python and Basic Python Tools
RUN apt-get install -y python python-dev python-distribute python-pip

ADD /miniproject /miniproject

RUN pip install -r /requirements.txt

# Expose ports
EXPOSE 80

# Set the default directory where CMD will execute
WORKDIR /miniproject

# Set the default command to execute    
# when creating a new container
# i.e. using CherryPy to serve the application
CMD python server.py
