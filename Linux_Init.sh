#!/bin/bash
#https://github.com/starFalll/Ubuntu_Init/
#
#Program:
#	linux environment configuration initialization
#	1.change sources.list,from official sources to USTC sources.
#	2.update and upgrade softwares.
#	3.install vim.
#	4.install sougoupinyin.
#	5.change directory to english.
#	6.delete some useless softwares.
#	7.System landscaping.
#	8.install vs code/sublime
#
#History:
#2017/10/18	ACool	12th  release

mkdir Backup

#gsettings set com.canonical.Unity.Launcher launcher-position Bottom

test -f sources.list && result_0="y"
if [ "${result_0}" == "y" ];then
	echo "Begin copy"
	sudo cp /etc/apt/sources.list Backup/sources.list
	sudo cp sources.list /etc/apt/sources.list
else
	echo -e "The sources file which contains USTC sources does not exist!"
	echo -e "Please check whether the file in the warehouse catalog is complete."
	echo -e "(包含中科大的源文件不存在!请检查仓库目录下文件是否完整.)"
	read -p "Coutinue?(Y/n)" yn
	if [ "${yn}" == "n" ] || [ "${yn}" == "N" ]; then
		exit 0;
	fi
fi

sudo apt-get autoclean
sudo apt-get clean
sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoremove


read -p "Is your system language Chinese?(y/n)" result_1
if [ "${result_1}" == "Y" ] || [ "${result_1}" == "y" ]; then
	echo -e "change directory to english,convenienting command line opration."
	echo -e "(改变中文目录为英文，方便命令行操作.)"
sleep 4

export LANG=en_US
xdg-user-dirs-gtk-update
export LANG=zh-CN
fi

read -p "Is your computer dual boot?(您的电脑是双系统吗)(Y/n)" result_2
if [ "${result_2}" == "Y" ] || [ "${result_2}" == "y" ]; then
	sudo apt-get install ntpdate
	sudo ntpdate time.windows.com
	sudo hwclock --localtime --systohc
fi

##Download softwares
sudo apt-get install vim
sudo apt-get install git
sudo apt-get install openjdk-8*

read -p"Download sougoupinyin?(安装搜狗拼音输入法) (Y/n) :" YN
if [ "${YN}" == "Y" ] || [ "${YN}" == "y" ]; then
	wget http://cdn2.ime.sogou.com/dl/index/1491565850/sogoupinyin_2.1.0.0086_amd64.deb?st=H6Fv3RXvgGFlgWBT3xkMZw&e=1507788214&fn=sogoupinyin_2.1.0.0086_amd64.deb
	sudo dpkg -i sogoupinyin_2.1.0.0086_amd64.deb*
	echo -e "Please read the page: https://github.com/starFalll/Ubuntu_Init/blob/master/README.md#sogou-pinyin-input-method-configuration"
	read -p "Have you followed the instructions?(您已经按照说明更改配置了吗?)(Y/n)" result_3
	if [ "${result_3}" == "n" ] || [ "${result_3}" == "N" ]; then
        	echo -e "Please follow the instructions."
        	read -p "Continue?(Y/n)" result_4
        	if [ "${result_4}" != "Y" ] || ["${result_4}" != "y" ]; then
                	exit 0
        	fi
	fi
fi
sudo apt-get purge unity-webapps-common

sudo add-apt-repository ppa:fossfreedom/indicator-sysmonitor  
sudo apt-get update  
sudo apt-get install indicator-sysmonitor
indicator-sysmonitor &
echo -e "Please read the page: https://github.com/starFalll/Ubuntu_Init/blob/master/README.md#title-bar-network-speed-monitoring-software-configuration"
read -p "Have you followed the instructions?(您已经按照说明更改配置了吗?)(Y/n)" result_5
if [ "${result_5}" == "n" ] || [ "${result_5}" == "N" ]; then
	echo -e "Please follow the instructions."
	read -p "Continue?(Y/n)" result_6
	if [ "${result_6}" != "Y" ] || ["${result_6}" != "y" ]; then
		exit 0
	fi
fi

sudo apt-get install unity-tweak-tool
sudo add-apt-repository ppa:noobslab/themes
sudo apt-get update
sudo apt-get install flatabulous-theme
sudo add-apt-repository ppa:noobslab/icons
sudo apt-get update
sudo apt-get install ultra-flat-icons
echo -e "Please read the page: https://github.com/starFalll/Ubuntu_Init/blob/master/README.md#system-landscaping"
read -p "Have you followed the instructions?(您已经按照说明更改配置了吗?)(Y/n)" result_8
if [ "${result_8}" == "n" ] || [ "${result_8}" == "N" ]; then
        echo -e "Please follow the instructions."
        read -p "Continue?(Y/n)" result_9
        if [ "${result_9}" != "Y" ] || ["${result_9}" != "y" ]; then
                exit 0
        fi
fi

echo -e "****************************************************"
echo -e "*Please select the following editor to install:    *"
echo -e "*(请选择以下编辑器安装)                            *"
echo -e "*1.Visual Studio Code                              *"
echo -e "*2.sublime text3                                   *"
echo -e "*3.no editor                                       *"
echo -e "****************************************************"
read -p "Please input your choose (1/2/3) (请输入选择序号):  " editer

if [ "${editer}" == "1" ]; then
	curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
	sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
	sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
	sudo apt-get update
	sudo apt-get install code
	echo -e "VS code was installed successfully!"
	echo -e "(vscode安装成功!)"
	sleep 3

elif [ "${editer}" == "2" ]; then
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	sudo apt-get install apt-transport-https
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt-get update
	sudo apt-get install sublime-text
	echo -e "The sublime text3 was installed successfully!"
	echo -e "(sublime安装成功!)"
	sleep 3
else 
	echo -e"No editor was installed!"	
	echo -e"(没有安装编辑器!)"
	sleep 3
fi

read -p "The configuration is complete and needs to be restarted(配置完成需要重启)(Y/n)" result_7

if [ "${result_7}" == "Y" ] || [ "${result_7}" == "y" ];then
	sudo reboot
elif [ "${result_7}" == "N" ] || [ "${result_7}" == "n" ];then
	echo -e "Please reboot later.(请稍后重启)"
fi





