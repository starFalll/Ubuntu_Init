#!/bin/bash
#Program:
#	linux environment configuration initialization
#	1.change sources.list,from official sources to USTC sources.
#	2.update and upgrade softwares.
#	3.install vim.
#	4.install sougoupinyin.
#	5.change directory to english.
#	6.delete some useless softwares.
#
#History:
#2017/10/12	ACool	First release
mkdir Backup
cp /etc/apt/sources.list Backup/sources.list
cp sources.list /etc/apt/sources.list

sudo apt-get autoclean
sudo apt-get clean
sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoremove

sudo apt-get install vim

export LANG=en_US
xdg-user-dirs-gtk-update
export LANG=zh-CN

wget http://cdn2.ime.sogou.com/dl/index/1491565850/sogoupinyin_2.1.0.0086_amd64.deb?st=H6Fv3RXvgGFlgWBT3xkMZw&e=1507788214&fn=sogoupinyin_2.1.0.0086_amd64.deb

sudo dpkg -i sogoupinyin_2.1.0.0086_amd64.deb*

sudo apt-get purge unity-webapps-common





