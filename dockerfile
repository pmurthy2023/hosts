# base image
FROM python:3.8

# setup environment variable
ENV DockerHOME=/hosts
RUN mkdir -p $DockerHOME # where your code lives
WORKDIR $DockerHOME # set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1 # install dependencies
ENV SF_PROJECT_NAME "pmTest"
ENV SF_APP_NAME "django_app"
ENV SF_PROFILE_KEY "WPasBrdlN3kY+yDzrQfBRhMn75UPmNXpY4TAaBY9t1H9DoTBtHyRZatXoP/8zrnDHnSJTWwnfizv6SiWE9lPmOUGGAhT87z80Qf5yeprLmX1og+sOS0aX1W9U5QD8MVnsGUMO/e8URxNeJZwY15Ac0wdkc3H9C44TtNPi88ZMH7cYHr60NRw6bNnOJfFCg/W8VJblkpyJe6r/U7qdXydcYFSDmepb4c0Ha5vt7B4/8Ss2zc0EKypRsnS5d9sCG+DCR/yTvT0Ux3fSJmyMTuqibRDx3AVVSjIROwm4RNIQmwmhsJm1Vvsu5PHpqVVgh2EQGmNpctuF+Mlt5IczNATZq7TTDSzc/2mGIe7dx1J5LTpkocpNZedue1Oxp6v9VSU9VMb1+ckUGLEX9IeQtiqLPCp7SAuQs1EyLwvwMpB1jTrmNW64zlemcO35/ps0j11rZQ7t6Cj4a2SUVbmGVjx1ZrI9XauXC0l1SFLBq3h1Q/1vBX5kKNqE0R9xEg3h1Q4ea5AFjveUpPziYFzYusEaIfCEhJSIozi2RxWFxQotRO+8s5NsdqSg5vqr8nWpwAqLpZGPk7y12tkEvigR8iplRPFdDI/u5Pi/mJ8XtVzswtHycvIZV2YsT+d/SA3E5tGahqVifQXi+kZTs7HmVtieBk44x3x5BwSfm9pJOSfIoQem0QVqwqQm5MN2OHZvGJptM1J78m+RIfg8kRkQ2bkNUsWpMNa4UPMIEKME7gH+NHXJTjKGm5DDeLI4Hh/dPFbDYeEyA4IeBoZlE6BCCjxvPktuapoZv2Brjyik9JmsOZ9p1k0dJuQK294fu0rBn4STsuKu/dkA7T61YIi9aPR6JujDg1NlZYFUtBJQH5j3HA="

COPY . $DockerHOME

# run this command to install all dependencies
RUN pip3 install django
RUN pip3 install djangorestframework
RUN pip3 install sf-elastic-apm==6.7.2 
RUN pip3 install sf-apm-lib==0.1.1 
WORKDIR /hosts
RUN python3 manage.py migrate


# port where the Django app runs
EXPOSE 8000
# start server
CMD python manage.py runserver 0.0.0.0:8000
