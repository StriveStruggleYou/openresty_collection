## openresty+ngx.balancer

### 主要是使用ngx.balancer模块，重新的定义动态的跳转

### 1.根据header内容进行判断
 ```local headers = ngx.resp.get_headers()
      for k, v in pairs(headers) do
        ngx.log(ngx.ERR, "headers=>", k .. ":" .. v)
    end
    ```
