# 个人 Skills 整理

这个项目用于收集和整理我个人使用的 AI Agent Skills（技能）。通过这些 Skills，可以为 AI 编程助手（如 Cursor）提供特定的领域知识、规范和标准操作流程。

## 获取更多 Skills

如果你需要寻找更多适用于 AI Agent 的 Skills，推荐访问 [Agent Skills Directory (skills.sh)](https://skills.sh/)。
这是一个开放的 AI Agent Skills 生态系统，你可以在该网站上直接搜索、发现并获取各种强大的技能库（涵盖前端规范、后端架构、UI设计、测试等各个领域），用来进一步增强你的 AI 编程助手。

## 快速部署与使用

如果你想在你的 AI 编程助手中快速部署并使用本项目中的 Skill，可以执行以下命令：

```bash
npx skills add lllllan02/skills --skill <skill-folder-name>
```

例如，要安装 `git-commit-message` 技能，请运行：

```bash
npx skills add lllllan02/skills --skill git-commit-message
```

## 已有 Skills 列表

### 1. Git Commit Message (`git-commit-message/SKILL.md`)

这是一个用于规范化 Git 提交信息的 Skill。它基于 Conventional Commits（约定式提交）规范，指导 AI 助手根据代码的实际差异（diff）智能分析并生成标准化的提交信息（如 `feat`, `fix`, `docs`, `refactor` 等），同时遵循严格的 Git 安全操作协议。

**参考来源：**
该 Skill 参考自：[github/awesome-copilot/git-commit](https://skills.sh/github/awesome-copilot/git-commit)
