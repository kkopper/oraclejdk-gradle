Docker image based on [`ubuntu:latest`](https://hub.docker.com/_/ubuntu/).
Originally created to run GitLab CI jobs requiring the Oracle JDK.

The resulting Docker image is automatically deployed to both [Docker Hub](https://hub.docker.com/r/kkopper/oraclejdk-gradle/) and this projects [container registry](https://gitlab.com/kkopper/oraclejdk-gradle/container_registry).

All created Docker tags correspond to tags in this repository, with `latest` always being the most recent commit on the master branch.
