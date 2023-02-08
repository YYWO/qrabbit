FROM python:3.8-slim-buster
WORKDIR /Rabbit
EXPOSE 1234
ARG url=https://github.com/HT944/QRabbit.git
RUN apt-get update \
     && apt-get install -yq --no-install-recommends sudo gcc python3-dev libc-dev git \
     && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
     && echo "Asia/Shanghai" >> /etc/timezone \
     && git clone $url \
     && pip3 install -r requirements.txt
COPY . /Rabbit
RUN chmod 777 /Rabbit/*
ENTRYPOINT ["python3", "Rabbit.py"]
