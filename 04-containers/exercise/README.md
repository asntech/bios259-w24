# Docker hands-on exercise

## Introduction

This exercise will guide you through the process of modifying a Dockerfile and pushing the resulting Docker image to Docker Hub. The Dockerfile contains a simple Python application that takes a ``--name`` argument with a default value. Your task is to replace the default name with your first name and then rebuild and push the modified Docker image to Docker Hub.

### Instructions

1. **Fork and clone the repository**: First go to the GitHub repo https://github.com/asntech/bios259-w24 and Fork it. Next clone the repository containing the Dockerfile and the Python application app.py in the `04-containers/exercise` directory.

    ```bash
    git clone https://github.com/<username>/bios259-w24.git
    cd bios259-w24/04-containers/exercise
    ```

2. **Modify the Dockerfile**: Open the `Dockerfile` in a text editor. Find the line that sets the default value for the `--name` argument in the `CMD` instruction. Replace the default name with your first name.

    Example:

    ```Dockerfile
    CMD ["python", "app.py", "--name", "YourFirstName"]
    ```

3. **Build the Docker image**: Once you have modified the Dockerfile, build the Docker image using the `docker build` command. Replace `<image_name>` with a suitable name for your Docker image.

    ```bash
    docker build -t <image_name> .
    ```

4. **Run the Docker container**: After the image is built successfully, you can run a container from the image to ensure that it works as expected.

    ```bash
    docker run <image_name>
    ```

    Make sure that your first name is displayed as expected in the output of the application.

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

8. Verify on Docker Hub: Visit your Docker Hub profile on the web and confirm that your Docker image has been pushed successfully.

9. You may want to commit and push it GitHub to brush-up your Git skills from day 2 :-)

10. **Bonus task**: Create a `Singularity` image using the Docker image you just pushed to Docker Hun and try to run it as a Singularity container.

## Conclusion

Congratulations! You have successfully modified a Dockerfile, built a Docker image with your changes, and pushed it to Docker Hub. This exercise demonstrates a basic workflow for Docker image modification and distribution.
