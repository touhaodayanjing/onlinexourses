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







git