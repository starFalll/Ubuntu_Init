## Ubuntu16.04 安装 QQ2017

首先下载网盘文件链接: https://pan.baidu.com/s/1dE85IPN 密码: 4kq7，下载整个linuxQQ文件，

下载完成以后，进入到linuxQQ文件目录下，如所示：

![github35.png](https://i.loli.net/2019/10/26/GqCIKTMDX34d8OS.png)

将**installqq.sh**脚本复制linuxQQ目录下，如所示：

![github36.png](https://i.loli.net/2019/10/26/1wsYO3eHNcKgq2I.png)

运行脚本:

```
chmod u+x installqq.sh

./installqq.sh
```

最后点击右上角图标搜索qq，找到以后点击启动.

![github34.png](https://i.loli.net/2019/10/26/DCpvcAtib1IMeEl.png)

可以看到现在qq是乱码状态:

再在终端输入:

`cp SIMSUN.TTC ~/.cxoffice/apps.com.qq.im/dosdevices/c\:/windows/Fonts/SIMSUN.TTC`

然后再次打开qq，乱码解决:

### 关于QQ关闭以后再次登录显示被占用的解决方案

运行脚本

```
chmod u+x killqq.sh
./killqq.sh
```
然后再次登录即可。


**Enjoy!**
