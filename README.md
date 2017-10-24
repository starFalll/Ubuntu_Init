# Ubuntu_Init
ubuntu 64位系统一键环境配置脚本

**注：支持14.04以上版本，安装过程中，请保持联网状态。若网络断开，或者有软件项目配置失败，请重新运行脚本。**

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

`./Linux_Init.sh`

## 可能出现的问题

如果出现 **It is impossible to install or remove any software. Please use the package manager "Synaptic" or run "sudo apt-get install -f" in a terminal to fix this issue at first.** 的情况，请按AIL+F4退出当前终端。

然后按ctrl+alt+t打开终端，输入以下命令手动安装:

```
cd Ubuntu_Init

sudo apt-get install -f 

```

然后再次运行脚本：

`./Linux_Init.sh`


## 目前支持：

- [x] 换USTC源
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

**以下为脚本运行中的配置项，请按照脚本提示修改**

## Sogou Pinyin input method configuration

搜狗拼音输入法配置(重启以后配置)

点击右上角输入法，搜狗拼音->设置->高级->打开Fcitx设置，如下图所示：

![9L5Fe.md.png](https://s1.ax2x.com/2017/10/13/9L5Fe.md.png)

Fcitx配置如下图所示，如果没有"键盘-英语(美国)"，点击"+"号添加即可.

![9L9ud.md.png](https://s1.ax2x.com/2017/10/13/9L9ud.md.png)


## Title bar network speed monitoring software configuration

标题栏网速监控软件配置

点击右上角监控栏的Preferences按钮，在打开的设置面板里面按照如下设置：

![9EqyO.md.png](https://s1.ax2x.com/2017/10/13/9EqyO.md.png)

勾选"Run on startup",开机启动.

![9Ewlq.md.png](https://s1.ax2x.com/2017/10/13/9Ewlq.md.png)

在"Customize output"栏添加"net:{net}"项，添加网速监控.

## System landscaping

系统美化手动设置项：

在搜索栏搜索"unity tweak tool",打开Unity 图形化管理工具，如下图所示：

![D0193.png](https://s1.ax2x.com/2017/10/15/D0193.png)

点击“主题”，选择“Flatabulous”扁平化主题：

![D0eJ6.png](https://s1.ax2x.com/2017/10/15/D0eJ6.png)

点击“图标”，选择“Ultra-flat”图标:

![D0UIp.png](https://s1.ax2x.com/2017/10/15/D0UIp.png)

系统美化设置完成。



