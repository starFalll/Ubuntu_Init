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
#	9.install uget
#	10.install typora
#	11.install chrome
#
#History:
#2017/10/30	ACool	34th  release

mkdir Backup

#gsettings set com.canonical.Unity.Launcher launcher-position Bottom

test -f sources.list && result_0="y"
if [ "${result_0}" == "y" ];then
	echo "Begin copy"
	sudo cp /etc/apt/sources.list Backup/sources.list
	sudo cp sources.list /etc/apt/sources.list
else
	echo -e "\033[41;37m The sources file which contains USTC sources does not exist! \033[0m"
	echo -e "\033[41;37m Please check whether the file in the warehouse catalog is complete. \033[0m"
	echo -e "\033[41;37m (包含中科大的源文件不存在!请检查仓库目录下文件是否完整.) \033[0m"
	read -p "Coutinue?(Y/n) :" yn
	if [ "${yn}" == "n" ] || [ "${yn}" == "N" ]; then
		exit 0;
	fi
fi
sudo rm /var/lib/apt/lists/lock
sudo rm /var/lib/dpkg/lock
sudo apt-get autoclean
sudo apt-get clean
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove



read -p "Is your computer dual boot?(您的电脑是双系统吗)(Y/n) :" result_2
if [ "${result_2}" == "Y" ] || [ "${result_2}" == "y" ]; then
	sudo apt-get install -y ntpdate
	sudo ntpdate time.windows.com
	sudo hwclock --localtime --systohc
fi

##Download softwares
sudo apt-get install -y vim
sudo apt-get install -y openjdk-8*
sudo add-apt-repository -y ppa:plushuang-tw/uget-stable
sudo apt-get update
sudo apt-get -y install uget
sudo apt-get install -y aria2i

# optional, but recommended
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
# add Typora's repository
sudo add-apt-repository 'deb http://typora.io linux/'
sudo apt-get update
# install typora
sudo apt-get -y install typora

read -p"Download sougoupinyin?(安装搜狗拼音输入法) (Y/n) :" YN
if [ "${YN}" == "Y" ] || [ "${YN}" == "y" ]; then
	sudo apt-get remove -y fcitx*
	sudo apt-get autoremove
	rm sogoupinyin_2.1.0.0086_amd64.deb*
	wget http://cdn2.ime.sogou.com/dl/index/1491565850/sogoupinyin_2.1.0.0086_amd64.deb?st=H6Fv3RXvgGFlgWBT3xkMZw&e=1507788214&fn=sogoupinyin_2.1.0.0086_amd64.deb

	sleep 100

	sudo apt-get -yf install
	sudo dpkg -i sogoupinyin*

#	echo -e "\033[46;37m Please read the page: https://github.com/starFalll/Ubuntu_Init/blob/master/README.md#sogou-pinyin-input-method-configuration \033[0m"
#	read -p "Have you followed the instructions?(您已经按照说明更改配置了吗?)(Y/n)" result_3
#	if [ "${result_3}" == "n" ] || [ "${result_3}" == "N" ]; then
#        	echo -e "\033[46;37m Please follow the instructions. \033[0m"
#        	read -p "Continue?(Y/n)" result_4
#        	if [ "${result_4}" == "n" ] || ["${result_4}" == "N" ]; then
#                	exit 0
#        	fi
#	fi
fi
sudo apt-get purge -y unity-webapps-common

sudo add-apt-repository -y ppa:fossfreedom/indicator-sysmonitor  
sudo apt-get update  
sudo apt-get install -y indicator-sysmonitor
indicator-sysmonitor &
echo -e "\033[44;37m Please read the page: https://github.com/starFalll/Ubuntu_Init/blob/master/README.md#title-bar-network-speed-monitoring-software-configuration \033[0m"
read -p "Have you followed the instructions?(您已经按照说明更改配置了吗?)(Y/n) :" result_5
if [ "${result_5}" == "n" ] || [ "${result_5}" == "N" ]; then
	echo -e "\033[44;37m Please follow the instructions. \033[0m"
	read -p "Continue?(Y/n) :" result_6
	if [ "${result_6}" == "n" ] || ["${result_6}" == "N" ]; then
		exit 0
	fi
fi

sudo apt-get install -y unity-tweak-tool
sudo add-apt-repository -y ppa:noobslab/themes
sudo apt-get update
sudo apt-get install -y flatabulous-theme
sudo add-apt-repository -y ppa:noobslab/icons
sudo apt-get update
sudo apt-get install -y ultra-flat-icons
echo -e "\033[44;37m Please read the page(请按照以下说明配置): https://github.com/starFalll/Ubuntu_Init/blob/master/README.md#system-landscaping \033[0m"
read -p "Have you followed the instructions?(您已经按照说明更改配置了吗?)(Y/n) :" result_8
if [ "${result_8}" == "n" ] || [ "${result_8}" == "N" ]; then
        echo -e "\033[44;37m Please follow the instructions. \033[0m"
        read -p "Continue?(Y/n) :" result_9
        if [ "${result_9}" == "N" ] || ["${result_9}" == "n" ]; then
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
	sleep 4
	sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
	sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
	sudo apt-get update
	sudo apt-get -y install code
	echo -e "\033[46;37m VS code was installed successfully! \033[0m"
	echo -e "\033[46;37m (vscode安装成功!) \033[0m"
	sleep 3

elif [ "${editer}" == "2" ]; then
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	sleep 2
	sudo apt-get install -y  apt-transport-https
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt-get update
	sudo apt-get -y install sublime-text
	echo -e "\033[46;37m The sublime text3 was installed successfully! \033[0m"
	echo -e "\033[46;37m (sublime安装成功!) \033[0m"
	sleep 3
else 
	echo -e"\033[41;37m No editor was installed! \033[0m"	
	echo -e"\033[41;37m (没有安装编辑器!) \033[0m"
	sleep 3
fi

read -p"系统自带的Firefox浏览器可能会出现一些问题,是否卸载该浏览器,安装chrome?(Y/n): " browser

if [ "${browser}" = "y" ] || [ "{browser}" = "Y" ]; then
	wget -q -O - http://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
	sudo apt-get update
	sudo apt-get -y install google-chrome-stable
	sudo apt-get purge firefox firefox-locale* unity-scope-firefoxbook

fi

if [ $LANG == "zh_CN.UTF-8" ]; then
	echo -e "\033[44;37m change directory to english,convenienting command line opration. \033[0m"
	echo -e "\033[44;37m (改变中文目录为英文，方便命令行操作.) \033[0m"
sleep 4

export LANG=en_US
xdg-user-dirs-gtk-update
export LANG=zh-CN
fi

echo -e "\033[46;37m The configuration is complete ,Please follow the instructions after rebooting:https://github.com/starFalll/Ubuntu_Init/blob/master/README.md#sogou-pinyin-input-method-configuration(配置完成，请重启后按照以下页面配置 https://github.com/starFalll/Ubuntu_Init/blob/master/README.md#sogou-pinyin-input-method-configuration) \033[0m"
read -p "Reboot now?(是否立即重启？)(Y/n) :" result_7



if [ "${result_7}" == "Y" ] || [ "${result_7}" == "y" ];then
	sudo reboot
elif [ "${result_7}" == "N" ] || [ "${result_7}" == "n" ];then
	echo -e "\033[41;37m Please reboot later.(请稍后重启) \033[0m"
fi





