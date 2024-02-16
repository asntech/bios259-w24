FROM python:3.9-slim

## Install click 7.1.2 uisng pip from PyPI
RUN pip install click==7.1.2

## set working directory to /opt
WORKDIR /opt

## Copy the app.py file to /opt  
COPY app.py /opt

## Run the application
CMD ["python", "/opt/app.py", "--name", "Participant"]