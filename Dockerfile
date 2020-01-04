FROM python:3
WORKDIR /usr/src/iplwebdev
ADD requirements.txt /usr/src/iplwebdev
RUN pip install -r requirements.txt
ADD . /usr/src/iplwebdev
