## openresty + ngx_http_dyups_module

### 安装步骤

### 1. 下载openresty ```wget https://openresty.org/download/openresty-1.13.6.2.tar.gz```

### 2. 在解压的openresty 目录下 下载 ngx_http_dyups_module 模块 </br>```git clone git://github.com/yzprofile/ngx_http_dyups_module.git```

### 3. 编译安装openresty并添加进模块</br> ```./configure  --prefix=/Users/**/**/openresty  --with-cc-opt="-I/usr/local/opt/openssl/include/ -I/usr/local/opt/pcre/include/"    --with-ld-opt="-L/usr/local/opt/openssl/lib/ -L/usr/local/opt/pcre/lib/"    -j8 --add-module=./ngx_http_dyups_module```</br>（--prefix=/Users/**/**/openresty 是指定openresty 安装的位置，-j8 是macos 编译指定参数 <font color=#0099ff size=3 face="黑体">--add-module=./ngx_http_dyups_module</font> 就是新增的模块）

### 4.使用模块很简单 
![](https://github.com/StriveStruggleYou/openresty_collection/blob/master/dynamic_upstream/openresty%2Bngx_http_dyups_module/data/97828263-5a34-4b09-bcbd-352f78e5db90.png)
</br>
查看模块信息方式 curl http://127.0.0.1:9090/detail
![](https://github.com/StriveStruggleYou/openresty_collection/blob/master/dynamic_upstream/openresty%2Bngx_http_dyups_module/data/65f52d87-b3aa-4d40-850f-c43ed3b0fc36.png)
所有upstream操作如图所示
![](https://github.com/StriveStruggleYou/openresty_collection/blob/master/dynamic_upstream/openresty%2Bngx_http_dyups_module/data/9c9987f9-77cf-42c5-9a82-66cfe3eb3347.png)

### 5.使用了这个模块进行dynamic_upstream控制后，依赖的负载均衡是nginx本身的负载均衡，如果一些特殊的负载很难实现。还有我们需要实现一个持久化的过程（写在文件里也可以的）。不然一旦重启很难恢复。

### 6.推荐博客：https://www.jishuboke.com/article/41

--------------------
## Directives

Syntax: **dyups_interface**

Default: `none`

Context: `loc`

This directive set the interface location where you can add or delete the upstream list. See the section of Interface for detail.


Syntax: **dyups_read_msg_timeout** `time`

Default: `1s`

Context: `main`

This directive set the interval of workers readding the commands from share memory.


Syntax: **dyups_shm_zone_size** `size`

Default: `2MB`

Context: `main`

This directive set the size of share memory which used to store the commands.


Syntax: **dyups_upstream_conf** `path`

Default: `none`

Context: `main`

This directive has been deprecated


Syntax: **dyups_trylock** `on | off`

Default: `off`

Context: `main`

You will get a better prefomance but it maybe not stable, and you will get a '409' when the update request conflicts with others.


Syntax: **dyups_read_msg_log** `on | off`

Default: `off`

Context: `main`

You can enable / disable log of workers readding the commands from share memory. The log looks like:

```
2017/02/28 15:37:53 [info] 56806#0: [dyups] has 0 upstreams, 1 static, 0 deleted, all 1
```
