---
name: git-commit-message
description: >-
  根据 git diff 生成符合 Conventional Commits 的中文提交信息。
  当用户要求生成 commit message、写提交说明、总结暂存区/工作区变更时使用。
  本技能只输出文本，不执行 git add/commit/push。
---

# Git Commit Message

## 适用范围

仅当用户只要提交信息/文案时启用。若用户明确要求「帮我 commit / 提交」，不要用本技能代行提交。

## 硬性约束

- **只读**：可运行 `git status`、`git diff`、`git diff --staged`、`git log`
- **禁止**：`git add`、`git commit`、`git push`、`git rebase` 等任何会改变仓库状态的命令
- **交付物**：仅一段可复制的 commit message 纯文本（放在 ` ```text ` 代码块中）

## 流程

1. 并行读取：`git status`、`git diff --staged`（若为空则 `git diff`）、`git log -5 --oneline`
2. 判断 type / scope；用中文写 subject，聚焦动机（why），不要复述 diff 流水账
3. 变更非一眼能懂时，补简短 body（可用列表）
4. 用单个代码块输出最终文案，不做额外解释（除非用户追问）

## 格式

```text
<type>(<scope>): <subject>

<body>
```

- `type`：`feat` / `fix` / `docs` / `style` / `refactor` / `perf` / `test` / `chore` / `revert`
- `scope`：选填，按模块缩写（如 `parser`、`db`）
- `subject`：必填、中文、简洁；对齐仓库已有 commit 文风
- `body`：选填，说明原因与关键改动点

## 边界情况

- 暂存区为空：分析工作区变更，或提示用户先 `git add`
- 多组无关变更：默认给一条主推荐；可附 2–3 个拆分提交建议
- 疑似含密钥/凭证的文件：在文案外简短提醒，勿写入 commit message 正文

## 示例

```text
feat(parser): 添加对 binlog 基础事件的解析支持

- 实现 FormatDescriptionEvent 解析
- 补充对应单元测试
```

```text
fix(db): 修复连接池在并发下泄露的问题

高并发时连接未正确归还导致池耗尽；在 defer 中确保归还。
```
