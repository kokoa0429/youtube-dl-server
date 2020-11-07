FROM node:14
WORKDIR /app
COPY package.json .
COPY package-lock.json .
RUN npm i
COPY index.js .
COPY ffmpeg* .
COPY youtube-dl* .
RUN mkdir output
RUN wget https://golang.org/dl/go1.15.4.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.15.4.linux-amd64.tar.gz
RUN export PATH=$PATH:/usr/local/go/bin
RUN go get github.com/google.skicka
RUN export PATH=~/go/bin;$PATH
CMD ["node","index.js"]
