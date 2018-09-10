## openresty+ngx.balancer

### 主要是使用ngx.balancer模块，重新的定义动态的跳转

### 1.根据header内容进行判断
 ```   
    local headers = ngx.resp.get_headers()
      for k, v in pairs(headers) do
        ngx.log(ngx.ERR, "headers=>", k .. ":" .. v)
    end
```  

### 2.根据cookie 内容进行判断
```  
  local ck = require "resty.cookie"
  local cookie, err = ck:new()
  if not cookie then
      ngx.log(ngx.ERR, err)
      return
  end
```

### 3.根据url参数 进行内容判断
```
  local arg = ngx.req.get_uri_args()
  for k,v in pairs(arg) do
      ngx.log(ngx.ERR, "url pairs: ", k.." ==> "..v)
  end
```

###

### 4.根据post body内容进行判断
```
  local arg = ngx.req.get_post_args()
  for k,v in pairs(arg) do
      ngx.log("[POST] key:", k, " v:", v)
  end
```
---------------
### 注意事项1：根据cookie的时候需要一个新的模块 lua-resty-cookie
```
  需要设置库的路径
  lua_package_path "/Users/*/*/*/*/lua/lua-resty-cookie/lib/?.lua;;";
  require "resty.cookie"
```

### 注意事项2：根据post body内容进行判断
```
ngx.req.read_body()在 balancer_by_lua_* 模块是不能使用，只能全局进行设置
lua_need_request_body on;
```

-------
### 测试命令推荐
```
curl -l -H "Content-type: application/json" -X POST -d '{"phone":"sadad","password":"test"}' 127.0.0.1:9000/1111?na23=12
```
