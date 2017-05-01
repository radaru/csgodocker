FROM centos
LABEL maintainer "http://steamcommunity.com/id/gangrene"

#initial patching and required installation of software
RUN yum update -y && \
    yum install -y wget glibc.i686 libstdc++.i686 && \
    adduser -m steam

#environment and default game settings
ENV STEAM_DIR /home/steam/Steam
ENV CSGO_DIR $STEAM_DIR/csgo/csgo
ENV GAME_TYPE 0
ENV GAME_MODE 1
ENV MAPGROUP mg_active
ENV MAP de_dust2

# steam user and dir for Steam apps
USER steam
RUN mkdir -p $STEAM_DIR
WORKDIR $STEAM_DIR

#csgo app installation
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - && \
    ./steamcmd.sh +login anonymous +force_install_dir ./csgo +app_update 740 validate +quit 

VOLUME $CSGO_DIR/addons
RUN ln -s $CSGO_DIR/addons/metamod.vdf metamod.vdf 

EXPOSE 27015

ADD csgo.sh /
CMD ["/csgo.sh"]
