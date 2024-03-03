FROM python:3.9-slim

## Install click 7.1.2 uisng pip from PyPI
RUN pip install click==7.1.2

## set working directory to /opt
WORKDIR /opt

## Copy the app.py file to /opt  
COPY app.py /opt

## Make app.py executeable
#RUN chmod +x /opt/app.py

## Add app.py to the path
#RUN export PATH=/opt:$PATH

## Run the application
CMD ["python", "/opt/app.py", "--name", "Participant"]