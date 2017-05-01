#!/bin/bash
# this is an example of a runtime of csgo docker container

docker run -v ~/csgo/addons:/home/steam/Steam/csgo/csgo/addons \
       -v ~/csgo/cfg/server.cfg:/home/steam/Steam/csgo/csgo/cfg/server.cfg \
       -v ~/csgo/cfg/autoexec.cfg:/home/steam/Steam/csgo/csgo/cfg/autoexec.cfg \
       -v ~/csgo/cfg/sourcemod:/home/steam/Steam/csgo/csgo/cfg/sourcemod \
       -e GAME_TYPE=0 -e GAME_MODE=1 -e MAPGROUP=mg_active \
       -e MAP=de_dust2 -p 27015:27015 -p 27015:27015/udp \
       -d csgo:latest
