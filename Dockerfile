# from the image i.e the original image from DOCKER
FROM python:3.10 

# copy files from current directory to the app directory
COPY . /app

# create a new directory called app 
WORKDIR /app

# install all the dependencies
RUN pip install -r requirements.txt

# give port from where the app is going to work
EXPOSE $PORT

# command used to run the application
# providing no of workers
# binding local host with the deploying server
# gunicorn is required whenever we are deploying anything in heroku platform
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app