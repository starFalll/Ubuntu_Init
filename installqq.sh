#!/bin/bash
sudo apt-get clean
sudo apt-get -f install
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install -y lib32z1 lib32ncurses5
sudo dpkg -i crossover-15_15.0.3-1_all.deb
sudo dpkg -i crossover-15_15.0.3-1_all-free.deb
sudo dpkg -i deepin-crossover-helper_1.0deepin0_all.deb
sudo apt-get -yf install
sudo dpkg -i deepin-crossover-helper_1.0deepin0_all.deb
sudo dpkg -i apps.com.qq.im_8.1.17255deepin11_i386.deb
cp SIMSUN.TTC ~/.cxoffice/apps.com.qq.im/dosdevices/c\:/windows/Fonts/SIMSUN.TTC
