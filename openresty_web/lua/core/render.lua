---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by manager.
--- DateTime: 2018/11/29 上午11:06
---

local template = require "/lua-resty-template/lib/resty/template"
-- Using template.render
ngx.header.content_type="text/html"
template.render("view.html", { message = "Hello, World!" })