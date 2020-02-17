FROM ubuntu
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update
RUN apt-get install -y git python-dev build-essential gdebi-core
RUN apt-get install -y xvfb firefox python-pip libffi-dev libssl-dev
RUN apt-get -fy install
RUN git clone https://github.com/insanemode/krogergooglecalendar
WORKDIR krogergooglecalendar
RUN git pull
RUN pip install -r requirements.txt
