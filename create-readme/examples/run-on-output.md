# run-on-output
*当检测到特定的 CLI 输出模式时执行任务*

[![Build Status](https://img.shields.io/github/actions/workflow/status/sinedied/run-on-output/ci.yml?style=flat-square)](https://github.com/sinedied/run-on-output/actions)
[![npm version](https://img.shields.io/npm/v/run-on-output?style=flat-square)](https://www.npmjs.com/package/run-on-output)
[![Node.js](https://img.shields.io/badge/Node.js->=20-3c873a?style=flat-square)](https://nodejs.org)
[![XO code style](https://shields.io/badge/code_style-5ed9c7?logo=xo&labelColor=gray&style=flat-square)](https://github.com/xojs/xo)
[![License](https://img.shields.io/badge/License-MIT-blue?style=flat-square)](LICENSE)

⭐ 如果你喜欢这个项目，请在 GitHub 上点亮星标！

[核心特性](#核心特性) • [安装](#安装) • [使用方法](#使用方法) • [示例](#示例)

一个轻量级的 Node.js CLI 工具，可实时监控命令输出，并在找到特定模式时触发操作。非常适合自动化工作流、开发环境和 CI/CD 管道。

## 核心特性

- 🎯 **模式匹配** - 监控 stdout/stderr 中的正则表达式模式或纯文本字符串
- ⚡ **实时监控** - 在监控的同时实时转发输出
- 🔧 **灵活的操作** - 当模式匹配时显示消息或执行命令
- 📝 **多重模式** - 等待多个模式匹配后再触发操作
- 🚀 **零依赖** - 仅使用 Node.js 内置模块构建

## 安装

```bash
npm install -g run-on-output
```

或者不安装直接使用：

```bash
npx run-on-output [options] <command> [args...]
```

## 使用方法

### 基本示例

**当服务器启动时显示消息：**
```bash
run-on-output -s "Server started" -m "🚀 Server is ready" npm start
```

**当服务器正在监听时执行健康检查：**
```bash
run-on-output -p "listening on port \\d+" -r "curl http://localhost:3000/health" node server.js
```

**监控开发环境启动：**
```bash
run-on-output -s "webpack compiled,server ready" -m "✅ Development environment ready" npm run dev
```

> [!TIP]
> 你可以使用简短别名 `roo` 代替 `run-on-output` 以加快输入速度：
> ```bash
> roo -s "Server started" -m "🚀 Server is ready" npm start
> ```

### 命令行选项

```
run-on-output [OPTIONS] <command> [args...]

选项:
  -p, --patterns <patterns>    要监视的正则表达式模式的逗号分隔列表
  -s, --strings <strings>      要监视的纯文本字符串的逗号分隔列表
  -r, --run <command>          在找到所有模式后要执行的命令
  -n, --npm <script>           在找到所有模式后要运行的 npm 脚本
  -m, --message <text>         在找到所有模式后要显示的消息
  -h, --help                   显示此帮助消息

要求:
  - 必须指定 --patterns 或 --strings 之一（但不能同时指定两者）
  - 必须至少指定 --run、--npm 或 --message 之一
```

## 示例

**开发工作流**
```bash
# 等待 webpack 和 server 都准备好，然后打开浏览器
run-on-output -s "webpack compiled,Local:" -r "open http://localhost:3000" npm run dev
```

**CI/CD 管道**
```bash
# 等待部署完成并运行冒烟测试
run-on-output -p "deployment.*complete" -r "./scripts/smoke-test.sh" deploy.sh
```

**Docker & 容器**
```bash
# 等待容器健康检查通过并运行集成测试
run-on-output -s "healthy" -r "npm run test:integration" docker-compose up
```
