##### Git基础与实操

## 1理论篇

### 1.1 版本控制工具简介

#### 1.1.1 版本控制工具简介 

​	版本控制是记录一个或者若干个文件内容的变化，以便将来查阅特定版本修订情况的系统，方便查看历史，备份以前的版本，保证多人的协作不出问题。

​        **原始版本控制：*diff*与*patch***

​	*diff* : 用来比较两个文件或目录之间的差异 

```shell
diff -u left.c right.c      // 比较两个文件的差异，会生成一个差异文件diff.txt(名字自定义)
```

​	***patch*  是 *diff* 的反向操作**

```shell
patch left.c diff.txt        //通过diff.txt把left.c变成right.c的内容
patch -R right.c diff.txt    //通过diff.txt把right.c变成原来left.c的内容
```

​        **CVS&SVN ：集中式版本控制工具**

​		CVS支持原子操作，网络传输低

​		SVN支持院子操作

​		集中式版本控制工具：多人同时提交需要排队，缺乏安全检查

​		几乎所有操作都要与服务器之间进行同步操作

​	**Git 分布式版本控制工具**

​		内容快照，其中一个版本文件损坏，不会影响到其他版本。

​		git操作在本地。只有与服务器同步数据时才需要使用网络

​		数据完整，适合分布式开发。

​		不适合word等二进制文档的版本控制

### 1.2 版本控制工具安装配置

### 1.2.1 Linux下安装Git

**包管理器安装**

linux系统 Ubuntu、Debian

```shell
sudo aptitude install git
sudo aptitude install git-doc git-svn git-email gitk
```

linux系统 RHEL、Fedora、CentOS

```shell
yum install git
yum install git-svn git-eamil gitk
```

源代码安装

官网下载Git源码包 例如git-2.19.0.tar.gz

```shell
tar -jxvf git-2.19.0.tar.bz2  //解压
cd git-2.19.0
make prefix=/usr/local all  //将Git安装在/usr/local/bin中
sudo make preifx=/usr/local install

// 安装git文档（可选）
make prefix=/usr/local doc info
sudo make prefix=/usr/local install-doc install-html install-info

// Git命令自动补全（可选）
全局文件 /etc/nashrc文件中添加
if [-f /etc/bash_completion]; then
. /etc/bash_completion
fi
```

1.2.2 Windows下安装Git

在windows的GitBase中使用和在linux下使用的Git指令完全一致

下载地址：https://git-scm.com/download/win

默认安装：C:\Program Files\Git

重点：在安装中弹出的select components中将git-lfs前面的勾去掉。

​          （这里开源的git-lfs有问题，huawei提供了自己的修复版本）

在安装中选择环境变量：建议选择 Use Git Bash Only

windows下安装TortoiseGit

下载地址：https://tortoisegit.org/



3 Git基本配置

git  config ：对配置文件进行读写

系统配置（对所有用户都适用）

​     存放在git的安装目录下： %Git%/etc/gitconfg :      git config  --system  修改系统配置

​     git config  --system  core.autocrlf   读取系统配置文件中的 core.autocrlf的值

用户配置 （只适用于该用户） 

​     存放在用户目录下   ~/.gitconfig

​     git config   --global user.name     读取用户配置文件中 user.name的值

仓库配置（只对当前项目有效）

​     当前仓库配置文件（也就是工作目录中的.git/config）

​    git config    --local remote.origin.url

注：每一个级别的配置都会覆盖上层相同的配置，例如用户配置会覆盖系统配置中同名的变量



3.1 配置个人身份

设定身份

git config --global user.name "zzh"

git config --global user.email  touhaodayanjing@163.com

这个配置信息会在Git仓库中提交的修改信息中体现，但和Git服务器认证使用的密码或公钥密码无关。

3.2 文本换行配置

windows 换行 使回车和换行两个操作符来结束一行

mac/linux 换行 使用换行一个字符

针对跨平台合作，解决换行不同的问题

Git在提交代码是会自动把结束符CRLF转换成LF，在再签出代码时把LF转换成CRLF， 使用core.autocrlf来打开此项功能，

如果在windows上，则把它设置成true      git config  --global core.autocrlf true

如果在linuxssh上，不需要在签出时将LF转成CRLF；当不小心引入了CRLF作为行结束符，则可以把core.autocrlf 设置成input;     git config --global auto.corecrlf input

3.3文本编码

 il8n.commitEncoding 选项：用来让 git commit log 存储时，采用的编码，默认UTF-8

 il8n.logOutputEncoding 选项：查看git log时，显示采用的编码，建议设置为UTF-8

中文编码支持

git config --global gui.encoding utf-8

git config --global  il8n.commitEncoding utf-8

git config --global  il8n.logOutputEncoding utf-8

显示中文路径

git config --global core.quotepath false

3.4 与服务器的两种协议认证方式

http/https协议认证

设置口令缓存  git config  --global credential.helper store

添加 HTTPS证书信任 git config http.sslverify false

ssh协议认证

ssh协议是一种常常用的git仓库访问协议，使用公钥认证，无需输入密码，加密传输，操作便利又能保证安全性

ssh-keygen -t rsa -C touhaodayanjing@   163  .com



Git常用命令

###### 工程准备

 工程克隆	git clone

###### 查看工作区

查看工作区内容	git diff

查看工作区文件状态	git status

###### 文件修改后提交推送

新增/删除/移动文件到暂存区	git add/   git rm/  git mv

提交更改的文件	git commit

推送远端仓库		git push

###### 查看日志

查看当前分支上的提交日志	git log

###### 分支管理

列出本地分支		git branch

新建分支		git branch / git checkout -b

删除分支		git branch -d

切换分支		git checkout

更新分支		git pull

合并分支		git merge

###### 撤销操作

强制回退到历史节点	git reset

回退本地所有修改而未提交的	git  checkout

###### 分支合并

合并目标分支内容到当前分支	git merge / git rebase