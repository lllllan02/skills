# JavaScript/TypeScript 无服务器应用配方 (Serverless Recipes)

[![Open project in GitHub Codespaces](https://img.shields.io/badge/Codespaces-Open-blue?style=flat-square&logo=github)](https://codespaces.new/Azure-Samples/serverless-recipes-javascript?hide_repo_select=true&ref=main&quickstart=true)
[![Join Azure AI Foundry Discord](https://img.shields.io/badge/Discord-Azure_AI_Community-blue?style=flat-square&logo=discord&color=5865f2&logoColor=fff)](https://aka.ms/foundry/discord)
[![Build Status](https://img.shields.io/github/actions/workflow/status/Azure-Samples/serverless-recipes-javascript/build-test.yaml?style=flat-square&label=Build)](https://github.com/Azure-Samples/serverless-recipes-javascript/actions)
![Node version](https://img.shields.io/badge/Node.js->=20-3c873a?style=flat-square)
[![TypeScript](https://img.shields.io/badge/TypeScript-blue?style=flat-square&logo=typescript&logoColor=white)](https://www.typescriptlang.org)
[![License](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)](LICENSE)

⭐ 如果你喜欢这个项目，请在 GitHub 上点亮星标 —— 这对我们帮助很大！

[快速开始](#快速开始) • [运行示例](#运行示例) • [示例列表](#示例列表) • [相关资源](#相关资源) • [故障排除](#故障排除)

本存储库是一个代码示例集合，演示了如何使用 TypeScript 和 Azure 构建无服务器 (Serverless) 应用程序。每个配方都是一个独立的示例，演示了如何构建特定功能或使用特定技术。你可以将这些示例作为自己项目的起点，或用于学习有关 Azure 无服务器开发的更多知识。

> [!NOTE]
> **什么是无服务器 (Serverless)？** 
> 无服务器计算允许你在不管理基础设施的情况下构建和运行应用程序。你可以专注于代码，让云提供商处理其余的事情。Azure 提供了广泛的无服务器服务，包括 [Azure Functions](https://learn.microsoft.com/azure/azure-functions/functions-overview?pivots=programming-language-javascript)、[Azure Static Web Apps](https://learn.microsoft.com/azure/static-web-apps/overview)、[Azure Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/nosql/) 等。

## 为什么选择无服务器？

假设你是 Contoso Solutions 公司的开发人员，你的任务是以初创公司的风格快速构建新的应用程序。你需要以较低的初始预算快速构建这些应用程序，并且不想担心管理服务器、扩展或基础设施。**你想专注于编写代码并为用户提供价值。**

*这正是无服务器技术的绝佳用武之地！*

在浏览这组即用型代码示例时，你将学习如何解决常见问题，并使用 Azure 上提供的许多无服务器技术构建应用程序。最棒的是什么？你只需要关注代码和业务逻辑，所有示例都已准备好在你的 Azure 帐户中部署和运行。

## 前置条件
- **Azure 帐户**。如果你是 Azure 新手，[免费获取一个 Azure 帐户](https://azure.microsoft.com/free) 以获得免费的 Azure 额度来开始使用。
- **GitHub 帐户**。如果你还没有，可以 [创建一个免费的 GitHub 帐户](https://github.com/signup)。

## 快速开始

有多种方法可以开始使用此项目。最快的方法是使用 [GitHub Codespaces](#使用-github-codespaces)，它为你提供了一个预配置的环境。或者，你可以 [设置本地环境](#使用本地环境)。

### 使用本地环境

你需要在本地计算机上安装以下工具：

- [Node.js LTS](https://nodejs.org/en/download)
- [Azure Developer CLI](https://aka.ms/azure-dev/install)
- [Git](https://git-scm.com/downloads)

然后你可以获取项目代码：

1. [**Fork**](https://github.com/Azure-Samples/serverless-recipes-javascript/fork) 该项目以创建你自己的存储库副本。
2. 打开终端并运行此命令以克隆存储库：`git clone <your-repo-url>`

## 运行示例

设置环境后，你可以部署和运行任何示例。每个示例都是一个独立的项目，你可以独立运行。按照以下步骤运行示例：

```bash
# 打开示例目录
cd samples/<sample-name>

# 安装依赖项
npm install

# 将示例部署到 Azure
azd auth login
azd up
```

初始部署完成后，你还可以使用 `npm start` 在本地运行示例。
你可以查看每个示例目录中的 `README.md` 文件以获取更具体的说明。

## 示例列表

| | 示例 | 部署时间 |
| --- |:--- | --- |
| | [Azure Functions OpenAI 扩展 - 嵌入 (embeddings)](./samples/openai-extension-embeddings) | 5分钟 |
| | [Azure Functions OpenAI 扩展 - 文本补全 (text completion)](./samples/openai-extension-textcompletion) | 5分钟 |

## 相关资源

以下是一些用于了解所用技术的其他资源：

- [使用 Azure Functions 的 Serverless Node.js](https://learn.microsoft.com/azure/developer/javascript/how-to/develop-serverless-apps?tabs=v4-ts) (Microsoft Learn)
- [Azure Cosmos DB for NoSQL](https://learn.microsoft.com/azure/cosmos-db/nosql/) (Microsoft Learn)
- [Azure OpenAI 服务](https://learn.microsoft.com/azure/ai-services/openai/overview) (Microsoft Learn)
