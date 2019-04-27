FROM ubuntu:14.04
MAINTAINER peter
RUN apt-get update
RUN apt-get install -y git

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
git clone https://github.com/bochkapb/pytonTest.git

WORKDIR pytonTest
RUN cp requirements.txt /tmp/

#ADD ./webapp/requirements.txt /tmp/requirements.txt
RUN pip install -qr /tmp/requirements.txt
#ADD ./webapp /opt/webapp/
RUN cp requirements.txt /tmp/
WORKDIR /opt/webapp
EXPOSE 5000
CMD ["python", "app.py"]