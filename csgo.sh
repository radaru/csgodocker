#!/bin/bash

~/Steam/steamcmd.sh +login anonymous \
                 +force_install_dir /home/steam/Steam/csgo \
                 +app_update 740 validate +quit 

~/Steam/csgo/srcds_run -game csgo -console -usercon +game_type $GAME_TYPE \
                               +game_mode $GAME_MODE \
                               +mapgroup $MAPGROUP \
                               +map $MAP 
