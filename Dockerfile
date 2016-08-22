FROM debian:latest
MAINTAINER 
RUN apt-get -y update && apt-get install -y \
  python \
  python-dev \
  python-pip \
  git
WORKDIR /srv
RUN git clone https://github.com/volleyballing/volleyballing.github.io
RUN pip install -r requirements.txt


FROM python:3
MAINTAINER Jeremy Breiding <jbreiding@hotmail.com>

# Update OS
RUN apt-get update
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
RUN apt-get -y upgrade

# Install dependencies
# I need LaTeX and pandoc to generate the CV:
RUN apt-get install make git -y
RUN pip install pelican Markdown ghp-import
RUN pip install --upgrade pelican Markdown ghp-import

WORKDIR /site
# Generate the website when running the container:
CMD pelican content/ -o output/ -s publishconf.py