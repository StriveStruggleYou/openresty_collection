## openresty+ngx.balancer

### 主要是使用ngx.balancer模块，重新的定义动态的跳转

### 1.根据header内容进行判断
 ```   local headers = ngx.resp.get_headers()
      for k, v in pairs(headers) do
        ngx.log(ngx.ERR, "headers=>", k .. ":" .. v)
    end
```  

### 2.根据cookie 内容进行判断
```  local ck = require "resty.cookie"
local cookie, err = ck:new()
if not cookie then
    ngx.log(ngx.ERR, err)
    return
end
```

### 3.根据url参数 进行内容判断
```  local arg = ngx.req.get_uri_args()

for k,v in pairs(arg) do
    ngx.log(ngx.ERR, "url pairs: ", k.." ==> "..v)
end
```

###

### 4.根据post body内容进行判断
```  ngx.req.read_body() -- 解析 body 参数之前一定要先读取 body
  local arg = ngx.req.get_post_args()
  for k,v in pairs(arg) do
      ngx.log("[POST] key:", k, " v:", v)
  end
```

### 5.
