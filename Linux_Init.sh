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

gsettings set com.canonical.Unity.Launcher launcher-position Bottom

test -f sources.list && result_0="y"
if [ "${result_0}"=="y" ];then
	cp /etc/apt/sources.list Backup/sources.list
	cp sources.list /etc/apt/sources.list
else
	echo -e "The sources file which contains USTC sources does not exist!"
	echo -e "Please check whether the file in the warehouse catalog is complete."
	echo -e "(包含中科大的源文件不存在!请检查仓库目录下文件是否完整.)"
	read -p "Coutinue?(Y/n)" yn
	if [ "${yn}"=="n" ] || [ "${yn}"=="N" ];then
		exit 0;
	fi
fi

sudo apt-get autoclean
sudo apt-get clean
sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoremove


read -p "Is your system language Chinese?(y/n)" result_1
if [ "${result_1}"=="Y" ] || [ "${result_1}"=="y" ];then
echo -e "change directory to english,convenienting command line opration."
echo -e "(改变中文目录为英文，方便命令行操作.)"
sleep 4

export LANG=en_US
xdg-user-dirs-gtk-update
export LANG=zh-CN
fi

read -p "Is your computer dual boot?(您的电脑是双系统吗)(Y/n)" result_2
if [ "${result_2}"=="Y" ] || [ "${result_2}"=="y" ];then
sudo apt-get install ntpdate
sudo ntpdate time.windows.com
sudo hwclock --localtime --systohc
fi

##Download softwares
sudo apt-get install vim
sudo apt-get install git

wget http://cdn2.ime.sogou.com/dl/index/1491565850/sogoupinyin_2.1.0.0086_amd64.deb?st=H6Fv3RXvgGFlgWBT3xkMZw&e=1507788214&fn=sogoupinyin_2.1.0.0086_amd64.deb
sudo dpkg -i sogoupinyin_2.1.0.0086_amd64.deb*

sudo apt-get purge unity-webapps-common





