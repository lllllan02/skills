# 使用 LangChain.js 和 RAG 构建的 Serverless AI 聊天应用

[![Open project in GitHub Codespaces](https://img.shields.io/badge/Codespaces-Open-blue?style=flat-square&logo=github)](https://codespaces.new/Azure-Samples/serverless-chat-langchainjs?hide_repo_select=true&ref=main&quickstart=true)
[![Join Azure AI Foundry Discord](https://img.shields.io/badge/Discord-Azure_AI_Community-blue?style=flat-square&logo=discord&color=5865f2&logoColor=fff)](https://aka.ms/foundry/discord)
[![Official Learn documentation](https://img.shields.io/badge/Documentation-00a3ee?style=flat-square)](https://learn.microsoft.com/azure/developer/javascript/ai/get-started-app-chat-template-langchainjs)
[![Watch to learn about RAG and this sample on YouTube](https://img.shields.io/badge/YouTube-d95652.svg?style=flat-square&logo=youtube)](https://www.youtube.com/watch?v=xkFOmx5yxIA&list=PLlrxD0HtieHi5ZpsHULPLxm839IrhmeDk&index=4)
[![dev.to blog post walkthrough](https://img.shields.io/badge/Blog%20post-black?style=flat-square&logo=dev.to)](https://dev.to/azure/build-a-serverless-chatgpt-with-rag-using-langchainjs-3487)
 
[![Build Status](https://img.shields.io/github/actions/workflow/status/Azure-Samples/serverless-chat-langchainjs/build-test.yaml?style=flat-square&label=Build)](https://github.com/Azure-Samples/serverless-chat-langchainjs/actions)
![Node version](https://img.shields.io/badge/Node.js->=20-3c873a?style=flat-square)
[![Ollama + Llama3.1](https://img.shields.io/badge/Ollama-Llama3.1-ff7000?style=flat-square)](https://ollama.com/library/llama3.1)
[![TypeScript](https://img.shields.io/badge/TypeScript-blue?style=flat-square&logo=typescript&logoColor=white)](https://www.typescriptlang.org)
[![License](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)](LICENSE)

:star: 如果你喜欢这个示例，请在 GitHub 上点亮星标 —— 这对我们帮助很大！

[项目概述](#项目概述) • [快速开始](#快速开始) • [运行示例](#运行示例) • [相关资源](#相关资源) • [常见问题](#常见问题) • [故障排除](#故障排除)

![展示聊天应用运行的动画](./docs/images/demo.gif)

本示例展示了如何使用 [LangChain.js](https://js.langchain.com/) 和 Azure 构建具有检索增强生成 (RAG) 功能的无服务器 AI 聊天体验。该应用程序托管在 [Azure Static Web Apps](https://learn.microsoft.com/azure/static-web-apps/overview) 和 [Azure Functions](https://learn.microsoft.com/azure/azure-functions/functions-overview?pivots=programming-language-javascript) 上，并使用 [Azure Cosmos DB for NoSQL](https://learn.microsoft.com/azure/cosmos-db/nosql/vector-) 作为向量数据库。你可以将其作为构建更复杂 AI 应用程序的起点。

> [!TIP]
> 你可以使用 [Ollama](https://ollama.com/) 在本地免费测试此应用程序。请按照 [本地开发](#本地开发) 部分的说明开始。

## 项目概述

构建 AI 应用程序可能复杂且耗时，但使用 LangChain.js 和 Azure 无服务器技术可以大大简化这一过程。此应用程序是一个聊天机器人，它使用一组企业文档来生成对用户查询的响应。

我们提供了示例数据以便于测试，你也可以随时将其替换为你自己的数据。我们使用了一家名为 _Contoso Real Estate_ 的虚构公司，该体验允许其客户询问有关其产品使用的支持问题。示例数据包括描述其服务条款、隐私政策和支持指南的一组文档。

此应用程序由多个组件组成：

- 一个 Web 应用，由使用 [Lit](https://lit.dev) 构建的单一聊天 Web 组件组成，托管在 [Azure Static Web Apps](https://learn.microsoft.com/azure/static-web-apps/overview) 上。代码位于 `packages/webapp` 文件夹中。
- 一个无服务器 API，使用 [Azure Functions](https://learn.microsoft.com/azure/azure-functions/functions-overview?pivots=programming-language-javascript) 构建，并使用 [LangChain.js](https://js.langchain.com/) 摄取文档并生成对用户聊天查询的响应。代码位于 `packages/api` 文件夹中。
- 一个数据库，用于存储聊天会话、从文档中提取的文本以及由 LangChain.js 生成的向量，使用 [Azure Cosmos DB for NoSQL](https://learn.microsoft.com/azure/cosmos-db/nosql/)。
- 一个文件存储，用于存储源文档，使用 [Azure Blob Storage](https://learn.microsoft.com/azure/storage/blobs/storage-blobs-introduction)。

我们使用 [AI 聊天应用 HTTP 协议](https://aka.ms/chatprotocol) 在 Web 应用和 API 之间进行通信。

## 核心特性

- **无服务器架构**：利用 Azure Functions 和 Azure Static Web Apps 实现完全无服务器部署。
- **检索增强生成 (RAG)**：结合 Azure Cosmos DB 和 LangChain.js 的强大功能，提供相关且准确的响应。
- **聊天会话历史记录**：为每个用户维护个人聊天历史记录，允许他们重温以前的对话。
- **可扩展且经济高效**：利用 Azure 的无服务器产品提供可扩展且经济高效的解决方案。
- **本地开发**：支持使用 Ollama 进行本地开发，无需任何云成本即可进行测试。

## 快速开始

有多种方法可以开始使用此项目。最快的方法是使用 [GitHub Codespaces](#使用-github-codespaces)，它为你提供了一个预配置的环境。或者，你可以按照以下说明 [设置本地环境](#使用本地环境)。

### 使用本地环境

你需要在本地计算机上安装以下工具：

- [Node.js LTS](https://nodejs.org/download/)
- [Azure Developer CLI](https://aka.ms/azure-dev/install)
- [Git](https://git-scm.com/downloads)

然后你可以获取项目代码：

1. [**Fork**](https://github.com/Azure-Samples/serverless-chat-langchainjs/fork) 该项目以创建你自己的存储库副本。
2. 打开终端并运行此命令以克隆存储库：`git clone <your-repo-url>`

## 运行示例

有多种方法可以运行此示例：在本地使用 Ollama 或 Azure OpenAI 模型，或者将其部署到 Azure。

### 将示例部署到 Azure

1. 打开终端并导航到项目的根目录。
2. 运行 `azd auth login` 使用 Azure 进行身份验证。
3. 运行 `azd up` 将应用程序部署到 Azure。

部署过程将需要几分钟时间。完成后，你将在终端中看到 Web 应用的 URL。
