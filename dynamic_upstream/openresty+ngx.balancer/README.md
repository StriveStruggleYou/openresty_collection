## openresty+ngx.balancer

### 主要是使用ngx.balancer模块，重新的定义动态的跳转

### 1.根据header内容进行判断
 ```local headers = ngx.resp.get_headers()
      for k, v in pairs(headers) do
        ngx.log(ngx.ERR, "headers=>", k .. ":" .. v)
    end
    ```

### 2.根据cookie 内容进行判断
```local ck = require "resty.cookie"
local cookie, err = ck:new()
if not cookie then
    ngx.log(ngx.ERR, err)
    return
end
```
