## openresty + ngx_http_dyups_module

### 安装步骤

### 1. 下载openresty ```wget https://openresty.org/download/openresty-1.13.6.2.tar.gz```

### 2. 在解压的openresty 目录下 下载 ngx_http_dyups_module 模块 </br>```git clone git://github.com/yzprofile/ngx_http_dyups_module.git```

### 3. 编译安装openresty并添加进模块</br> ```./configure  --prefix=/Users/**/**/openresty  --with-cc-opt="-I/usr/local/opt/openssl/include/ -I/usr/local/opt/pcre/include/"    --with-ld-opt="-L/usr/local/opt/openssl/lib/ -L/usr/local/opt/pcre/lib/"    -j8 --add-module=./ngx_http_dyups_module```</br>（--prefix=/Users/**/**/openresty 是指定openresty 安装的位置，-j8 是macos 编译指定参数）





