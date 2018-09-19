[![](https://img.shields.io/badge/language-shell-green.svg)](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) [![](https://img.shields.io/badge/Ubuntu-14.04/16.04-orange.svg)](https://www.ubuntu.com/download/desktop) [![Packagist](https://img.shields.io/packagist/l/doctrine/orm.svg)](https://github.com/starFalll/Ubuntu_Init/blob/master/LICENSE)
# Ubuntu_Init
ubuntu 64位系统一键环境配置脚本

**请务必认真阅读以下说明：**

**注：**
- 支持14.04/16.04版本（暂不支持18.04），安装过程中，请保持联网状态。若网络断开，或者有软件项目配置失败，请重新运行脚本。
- 运行权限:请以普通用户身份运行，不需要使用root用户运行。
- 安装成功的软件如果要固定到左边启动器，需要在左上角搜索，然后启动软件，左边图标右键点击，选择锁定到启动器即可

配置完毕的界面如所示:

![9KeSE.png](https://s1.ax2x.com/2017/10/14/9KeSE.png)

## 如何使用

如果ubuntu上面没有下载git，首先下载git：

`sudo apt-get install git`

然后clone仓库到本地：

`git clone https://github.com/starFalll/Ubuntu_Init.git`

然后进入Ubuntu_Init目录:

`cd Ubuntu_Init`

在Ubuntu_Init目录，输入以下命令

`chmod u+x Linux_Init.sh`

然后运行脚本:

`./Linux_Init.sh 2>  error.log` 

去喝杯咖啡吧！

ps: 脚本运行完最后会询问您是否重启。

## 配置项说明

**config**文件为配置项，可以根据自己的需要修改配置项，参数说明如下：

y---------安装

n---------不安装

1---------安装

0---------不安装

`editor `选项比较特殊，请参见下面说明。

```
ChangeSources=y #换源，换清华源，默认需要换源
Update=y   #更新软件
DualBoot=n #如果是windows/Ubuntu 双系统则是"y"，否则为"n"，默认为单系统
YN=1 #搜狗拼音输入法
browser=0 #该选项为安装chrome(会卸载自带的firefox)
Music=0 #网易云音乐
Docky=1 #Docky，Docky介绍:https://github.com/starFalll/Ubuntu_Init#what-is-docky
editer=1 #编辑器，1为Vs code，2为sublime text3，3为不安装编辑器
Vim=y #Vim
Openjdk=y #openjdk
Uget=y #uget下载器
Typora=y #typora-Markdown编辑器
Sysmonitor=y #标题栏网速监控软件
SystemBeautification=y #系统美化

```



## 可能出现的问题

如果出现error.log里面出现 **It is impossible to install or remove any software. Please use the package manager "Synaptic" or run "sudo apt-get install -f" in a terminal to fix this issue at first.** 的语句，输入以下命令手动安装:

```
cd Ubuntu_Init

sudo apt-get -y install -f 
```

然后再次运行脚本：

`./Linux_Init.sh 2>  error.log`


## 目前支持：

- [x] 换清华镜像源(16.04/14.04)
- [x] 更新系统软件
- [x] 更换目录为英文(若是中文目录的话)
- [x] 同步windows/Ubuntu双系统时间
- [x] 安装vim
- [x] 安装openjdk8
- [x] 安装搜狗中文输入法
- [x] 删除Amazon的链接
- [x] 安装标题栏网速监控软件
- [x] 系统美化
- [x] 安装编辑器(可选vscode/sublime)
- [x] 安装uGet下载管理器
- [x] 安装Typora优雅的markdown编辑器
- [x] 安装qq ([见此](https://github.com/starFalll/Ubuntu_Init/blob/master/installqq_README.md))
- [x] 可选安装Chrome
- [x] 可选安装网易云音乐（仅适用于16.04以上版本）
- [x] 可选安装docky

## 重启以后的软件配置

安装完成重启以后请按照如下说明配置软件。

### Sogou Pinyin input method configuration

搜狗拼音输入法配置(**请重启以后配置!!!**)

点击右上角输入法，搜狗拼音->设置->高级->打开Fcitx设置，如下图所示：

![9L5Fe.md.png](https://s1.ax2x.com/2017/10/13/9L5Fe.md.png)

Fcitx配置如下图所示，如果没有"键盘-英语(美国)"，点击"+"号添加即可.

![9L9ud.md.png](https://s1.ax2x.com/2017/10/13/9L9ud.md.png)

###Title bar network speed monitoring software configuration

标题栏网速监控软件配置

点击右上角监控栏的Preferences按钮，在打开的设置面板里面按照如下设置：

![9EqyO.md.png](https://s1.ax2x.com/2017/10/13/9EqyO.md.png)

勾选"Run on startup",开机启动.

![9Ewlq.md.png](https://s1.ax2x.com/2017/10/13/9Ewlq.md.png)

在"Customize output"栏添加"net:{net}"项，添加网速监控.

### System landscaping

系统美化手动设置项：

在搜索栏搜索"unity tweak tool",打开Unity 图形化管理工具，如下图所示：

![D0193.png](https://s1.ax2x.com/2017/10/15/D0193.png)

点击“主题”，选择“Flatabulous”扁平化主题：

![D0eJ6.png](https://s1.ax2x.com/2017/10/15/D0eJ6.png)

点击“图标”，选择“Ultra-flat”图标:

![D0UIp.png](https://s1.ax2x.com/2017/10/15/D0UIp.png)

系统美化设置完成。

### What is docky

Docky 是一款类似于 MAC OS X 底部启动器的软件程序。同时，它可显示天气预报，并提供了一大堆 docklets，比如显示时钟和CPU使用情况，在某种程度上类似于 AWN 和 cairo-dock。如图:

![z49YX.png](https://s1.ax2x.com/2017/12/21/z49YX.png)

如何使用:

脚本运行完成以后，在左上角搜索栏里搜索docky，点击即可启动，以后开机也会自动启动，无须再次手动启动。如图：

![zPs3q.png](https://s1.ax2x.com/2017/12/22/zPs3q.png)

**Enjoy it!**

## 协议
本脚本遵从 [MIT协议](https://github.com/starFalll/Ubuntu_Init/blob/master/LICENSE)


