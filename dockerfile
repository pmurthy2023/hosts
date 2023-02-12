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
WORKDIR /hosts
Run python3 manage.py migrate


# port where the Django app runs
EXPOSE 8000
# start server
CMD python manage.py runserver 0.0.0.0:8000
