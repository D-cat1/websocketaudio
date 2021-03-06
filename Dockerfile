FROM ubuntu:18.04
FROM heroku/heroku:18

# Set timezone
RUN ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
RUN apt update && apt -y upgrade && apt install -y tzdata locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN apt-get install -y youtube-dl git python python-pip ffmpeg --yes --fix-missing --no-install-recommends\
&& curl -sL https://deb.nodesource.com/setup_12.x | bash - \
&& apt-get install -y nodejs \
&& apt-get clean -y \
&& apt-get autoremove -y


RUN git clone https://github.com/D-cat1/websocketaudio.git /home/audiocat/
WORKDIR /home/audiocat/

RUN npm i 
RUN pip install -r requirements.txt


CMD ["bash source", "lemonmelon.sh"]

