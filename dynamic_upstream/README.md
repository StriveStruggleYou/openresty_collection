## dynamic_upstream

### ngx_dynamic_upstream and ngx_http_dyups_module 两个模式基本差不多，装插件和使用方式都差不多。但都是没法自定义负载均衡，都是nginx模块自带的负载均衡。

### openresty+ngx.balancer 模块就从零开始定制

---------
### 常见的负载均衡算法:

#### 1.轮询法(加权轮询法)

#### 2.随机法(加权随机法)

#### 3.源地址哈希法

#### 4.最小连接法

### 实际运用 （beta 集群设计）

#### 1.针对请求参数，转发到指定的 upstream
