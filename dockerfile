# base image
FROM python:3.8

# setup environment variable
ENV DockerHOME=/hosts
RUN mkdir -p $DockerHOME # where your code lives
WORKDIR $DockerHOME # set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1 # install dependencies

COPY . $DockerHOME

# run this command to install all dependencies
RUN pip3 install django
RUN pip3 install djangorestframework
RUN pip3 install sf-elastic-apm==6.7.2 
RUN pip3 install sf-apm-lib==0.1.1 
WORKDIR /hosts


# port where the Django app runs
EXPOSE 8000
