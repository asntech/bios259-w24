# Docker hands-on exercise 2

## Introduction
This exercise will guide you through using an existing image, the one you created in exercise 1, to create a new image. 

**Note:** Please complete [**exercise 1**](/04-containers/exercise1/) first before you work on this.

### Instructions

1. **Work on the forked/cloned repository**:You already have the GitHub repo https://github.com/asntech/bios259-w24 locally. Next change the working directory to  `04-containers/exercise2`  where you will find Dockerfile and the Python application `app2.py`.

    ```bash
    cd bios259-w24/04-containers/exercise2
    ```

2. **Modify the Dockerfile**: Open the `Dockerfile` in a text editor. You need to use the docker image from your docker hub account that you pushed in exercise 1 as the starting point. You will see in the app2.py that it now also requires `seaborn` package to run `app2.py` and we already have `python` and `click` pre-installed.


3. **Build the Docker image**: Once you have modified the Dockerfile, build the Docker image using the `docker build` command. Replace `<image_name>` with a suitable name for your Docker image.

    ```bash
    docker build -t <image_name> .
    ```

4. **Run the Docker container**: After the image is built successfully, you can run a container from the image to ensure it works as expected.

    ```bash
    docker run <image_name>
    ```

    By default, it will print the descriptive statistics for a `seaborn` dataset.

5. **Push the Docker image to Docker Hub**: Now, it's time to push your modified Docker image to Docker Hub. First, log in to Docker Hub using the `docker login` command.

    ```bash
    docker login
    ```

    Enter your Docker Hub credentials when prompted.

6. Tag your Docker image using your Docker Hub username and the desired repository name.

    ```bash
    docker tag <image_name> <username>/<repository_name>
    ```

7. Finally, push the tagged Docker image to Docker Hub.

    ```bash
    docker push <username>/<repository_name>
    ```

8. Verify on Docker Hub: Visit your Docker Hub profile online and confirm that your Docker image has been pushed successfully.

9. You may want to commit and push it to GitHub to brush up your Git skills from day 2 :-)

10. **Bonus task**: Create a `Singularity` image using the Docker image you just pushed to Docker Hub and try to run it as a Singularity container on an HPC.

## Conclusion

Congratulations! You have successfully built a Docker image by extending an existing one in the Docker Hub and installing the tools you need to run the application inside the container. This exercise demonstrates an advanced workflow for Docker image creation and distribution.
