# freeradius3-docker

A docker image file for Freeradius 3 based on Fedora. A Work in progress.

The main goal of this is to have a freeradius3 server running with support for rlm-rest thats easy to spin off


How to use?

Clone this repository

Edit the mods-enabled/rest file and modify the URI to match the REST API endpoint the requests should be sent to.

Build the image (docker build -t docker-freeradius-rest . )

start the container (docker run -p 1812:1812/udp 1813:1813/udp -d docker-freeradius-rest)
