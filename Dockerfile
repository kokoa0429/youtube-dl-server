FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /app
RUN apt update && apt install -y nodejs npm
COPY package.json .
COPY package-lock.json .
RUN npm i
COPY index.js .
COPY youtube-dl* .
RUN apt update && apt install -y ffmpeg wget git
RUN mkdir output
RUN wget https://golang.org/dl/go1.13.8.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.13.8.linux-amd64.tar.gz
RUN export PATH=$PATH:/usr/local/go/bin
RUN /usr/local/go/bin/go get github.com/google/skicka
RUN export PATH=~/go/bin;$PATH
CMD ["node","index.js"]
