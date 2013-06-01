#!/bin/bash

sudo pip install -r requirements.txt
sudo cp build_light.sh /etc/init.d/
sudo service build_light.sh restart
