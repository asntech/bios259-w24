FROM <your_docker_hub_id>/bios259:<add the tag here>

## Install latest version of seaborn uisng pip from PyPI - https://pypi.org/project/seaborn/
<add the command here to install>

## set working directory to /opt
WORKDIR /opt

## Copy the app.py file to /opt  
COPY app2.py /opt/app2.py

## Make app.py executeable
RUN chmod +x /opt/app2.py

## Add app.py to the path
ENV PATH=/opt:$PATH

## Run the application help
CMD ["app2.py", "--help"]