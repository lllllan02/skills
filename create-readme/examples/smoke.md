# :dash: smoke

[![NPM version](https://img.shields.io/npm/v/smoke.svg)](https://www.npmjs.com/package/smoke)
[![Build Status](https://github.com/sinedied/smoke/workflows/build/badge.svg)](https://github.com/sinedied/smoke/actions)
![Node version](https://img.shields.io/node/v/smoke.svg)
[![XO code style](https://img.shields.io/badge/code_style-XO-5ed9c7.svg)](https://github.com/sindresorhus/xo)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

> 简单而强大的基于文件的模拟 (mock) 服务器，具有记录功能

![demo](https://user-images.githubusercontent.com/593151/49312821-9f2cc680-f4e5-11e8-900a-117120c38422.gif)

只需将一堆 (JSON) 文件放入文件夹中，您就可以开始使用了！

### 基本模拟示例
1. 启动服务器：`smoke`
2. 创建一个名为 `get_api#hello.json` 的文件：
    ```json
    {
      "message": "hello world!"
    }
    ```
3. 测试模拟：`curl http://localhost:3000/api/hello`

### 核心特性

**Smoke** 是一个基于文件、约定优于配置的模拟服务器，无需任何复杂的设置即可满足您的 API 模拟需求。同时，它支持许多高级功能和动态模拟，几乎适用于任何情况：

- 通过记录现有服务器的响应快速生成模拟数据
- 使用文件夹和文件名来描述 API 路由和 REST 方法
- 使用模板根据输入查询和路由参数生成响应
- 无需重启服务器即可添加/编辑/删除模拟数据
- 使用 JavaScript 生成模拟数据以获得更复杂的响应
- 定义不同的模拟集以模拟各种场景（错误等），并带有后备功能
- 如果需要，自定义标头和状态代码，如果未指定，则自动检测内容类型
- 添加自定义中间件以修改请求/响应
- 仅模拟特定请求，并将其余请求代理到现有服务器
- 支持 CORS（跨源资源共享）

## 安装

```bash
npm install -g smoke
```

## 使用方法

CLI 使用非常简单，除非您想添加一些选项，否则只需运行 `smoke` 即可：

```
Usage: smoke [<mocks_folder>] [options]

基础选项:
  -p, --port <num>                  服务器端口           [默认: 3000]
  -h, --host <host>                 服务器主机           [默认: "localhost"]
  -s, --set <name>                  要使用的模拟集      [默认: none]
  -n, --not-found <glob>            404 错误的模拟      [默认: "404.*"]
  -i, --ignore <glob>               要忽略的文件        [默认: none]
  -k, --hooks <file>                中间件钩子          [默认: none]
  -x, --proxy <host>                如果找不到模拟数据的后备代理
  -o, --allow-cors [all|<hosts>]    启用 CORS 请求      [默认: none]
  --https                           使用 HTTPS 启用安全请求服务 [默认: false]
  -l, --logs                        启用服务器日志
  -v, --version                     显示版本
  --help                            显示帮助

模拟记录:
  -r, --record <host>               如果找不到模拟数据，则代理并记录请求
  -c, --collection <file>           保存到单文件模拟集合
  -d, --depth <N>                   模拟数据的文件夹深度  [默认: 1]
  -a, --save-headers                保存响应标头
  -q, --save-query                  保存查询参数
```

### 文件命名规则

**通用格式:** `methods_api#route#@routeParam$queryParam=value.__set.extension`

模拟数据的路径和文件名用于确定：

#### 支持的 HTTP 方法
可选择通过支持的 HTTP 方法后跟下划线（例如 `get_`）作为文件的前缀。
如果未指定方法，该模拟数据将用于任何 HTTP 方法。

#### 服务器路由和命名路由参数
使用文件夹或哈希分隔组件的任何组合来指定服务器路由。
例如 `api/example/get_hello.json` 等同于 `get_api#example#hello.json`，并将响应 `GET api/example/hello` 请求。

#### 查询参数
在定义路由后，您可以通过使用 `$`（而不是常规的 `?`）添加要匹配的查询参数来进一步区分模拟数据。
例如 `get_api#hello$who=john.json` 将匹配请求 `api/get_hello?who=john`。

### 自定义状态和标头

默认情况下，所有模拟响应都以状态代码 `200` (OK) 发送，如果模拟文件为空，则发送 `204` (No content)。

您可以使用 JSON 和 JavaScript 文件自定义响应状态和（可选的）标头：
```js
{
  "statusCode": 400,
  "body": {
    "error": "Bad request"
  },
  "headers": {
    "Content-Type": "text/plain"
  } 
}
```
