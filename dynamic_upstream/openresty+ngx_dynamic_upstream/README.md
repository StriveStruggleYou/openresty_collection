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
