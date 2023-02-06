FROM python:3.8-slim-buster
WORKDIR /Rabbit
COPY . /Rabbit
EXPOSE 1234
RUN apt-get update \
     && apt-get install -yq --no-install-recommends sudo gcc python3-dev libc-dev git \
     && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
     && echo "Asia/Shanghai" >> /etc/timezone \
     && pip3 install -r requirements.txt
RUN chmod 777 /Rabbit/*
ENTRYPOINT ["python3", "Rabbit.py"]
