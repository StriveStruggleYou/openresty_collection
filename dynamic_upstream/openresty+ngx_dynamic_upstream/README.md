## openresty + ngx_dynamic_upstream

### 安装步骤

### 1. 下载openresty ```wget https://openresty.org/download/openresty-1.13.6.2.tar.gz```

### 2. 在解压的openresty 目录下 下载 ngx_http_dyups_module 模块 </br>```https://github.com/cubicdaiya/ngx_dynamic_upstream.git```

### 3. 编译安装openresty并添加进模块</br> ```./configure  --prefix=/Users/**/**/openresty  --with-cc-opt="-I/usr/local/opt/openssl/include/ -I/usr/local/opt/pcre/include/"    --with-ld-opt="-L/usr/local/opt/openssl/lib/ -L/usr/local/opt/pcre/lib/"    -j8 --add-module=--add-module=./ngx_dynamic_upstream```</br>（--prefix=/Users/**/**/openresty 是指定openresty 安装的位置，-j8 是macos 编译指定参数 <font color=#0099ff size=3 face="黑体">--add-module=--add-module=./ngx_dynamic_upstream</font> 就是新增的模块）

### 4.使用模块很简单 
![](https://github.com/StriveStruggleYou/openresty_collection/blob/master/dynamic_upstream/openresty%2Bngx_dynamic_upstream/data/f7c0f43d-f87f-48e0-9a4e-92cafa57598f.png)
</br>
查看模块信息方式 curl "http://127.0.0.1:6000/dynamic?upstream=zone_for_backends"
![](https://github.com/StriveStruggleYou/openresty_collection/blob/master/dynamic_upstream/openresty%2Bngx_dynamic_upstream/data/ab09a61f-6de4-4085-80c0-a158a3b073b4.png)

### 5.使用了这个模块进行dynamic_upstream控制后，依赖的负载均衡是nginx本身的负载均衡，如果一些特殊的负载很难实现。还有我们需要实现一个持久化的过程（写在文件里也可以的）。不然一旦重启很难恢复。这两个模块都差不多的。


------------

# HTTP APIs

You can operate upstreams dynamically with HTTP APIs.

## list

```bash
$ curl "http://127.0.0.1:6000/dynamic?upstream=zone_for_backends"
server 127.0.0.1:6001;
server 127.0.0.1:6002;
server 127.0.0.1:6003;
$
```

## verbose

```bash
$ curl "http://127.0.0.1:6000/dynamic?upstream=zone_for_backends&verbose="
server 127.0.0.1:6001 weight=1 max_fails=1 fail_timeout=10;
server 127.0.0.1:6002 weight=1 max_fails=1 fail_timeout=10;
server 127.0.0.1:6003 weight=1 max_fails=1 fail_timeout=10;
$
```

## update_parameters

```bash
$ curl "http://127.0.0.1:6000/dynamic?upstream=zone_for_backends&server=127.0.0.1:6003&weight=10&max_fails=5&fail_timeout=5"
server 127.0.0.1:6001 weight=1 max_fails=1 fail_timeout=10;
server 127.0.0.1:6002 weight=1 max_fails=1 fail_timeout=10;
server 127.0.0.1:6003 weight=10 max_fails=5 fail_timeout=5;
$
```

The supported parameters are blow.

* weight
* max_fails
* fail_timeout

## down

```bash
$ curl "http://127.0.0.1:6000/dynamic?upstream=zone_for_backends&server=127.0.0.1:6003&down="
server 127.0.0.1:6001 weight=1 max_fails=1 fail_timeout=10;
server 127.0.0.1:6002 weight=1 max_fails=1 fail_timeout=10;
server 127.0.0.1:6003 weight=1 max_fails=1 fail_timeout=10 down;
$
```

## up

```bash
$ curl "http://127.0.0.1:6000/dynamic?upstream=zone_for_backends&server=127.0.0.1:6003&up="
server 127.0.0.1:6001 weight=1 max_fails=1 fail_timeout=10;
server 127.0.0.1:6002 weight=1 max_fails=1 fail_timeout=10;
server 127.0.0.1:6003 weight=1 max_fails=1 fail_timeout=10;
$
```

## add

```bash
$ curl "http://127.0.0.1:6000/dynamic?upstream=zone_for_backends&add=&server=127.0.0.1:6004"
server 127.0.0.1:6001;
server 127.0.0.1:6002;
server 127.0.0.1:6003;
server 127.0.0.1:6004;
$
```

## remove

```bash
$ curl "http://127.0.0.1:6000/dynamic?upstream=zone_for_backends&remove=&server=127.0.0.1:6003"
server 127.0.0.1:6001;
server 127.0.0.1:6002;
server 127.0.0.1:6004;
$
```
