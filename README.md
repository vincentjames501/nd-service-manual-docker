# 2016+ Mazda MX-5 Service Manual For Mac/Linux

The 2016+ MX-5 Service Manual mirror is designed to run on Windows. You can find the
service manual [here](https://docs.google.com/uc?id=0B7jy8h0yRBccRnhyb2hGRWNBZ2s&export=download). It runs Apache/PHP/MySQL by executing a Windows executable. To run this on Mac, you can either run Windows on your machine, or we can do this with Docker.

## Setup

- Download and install [Docker](https://docs.docker.com/v17.12/install/).
- Clone this repository
- Copy the `root` directory from the zip you downloaded above into the cloned repository and rename it to `public_html`
- Start the services with `./start.sh`
- Once the services boot, setup the environment and database with `./setup.sh`
- You can stop the services with `./stop.sh`
