# AI Agent Skills

> 为 AI 智能体（Agent）提供专业化能力的自定义技能（Skills）集合。

本项目包含了一系列为 AI 编程助手（如 Cursor 等支持自定义规则的工具）量身定制的技能配置（`SKILL.md`）。通过这些预设的技能指令，可以显著提升 AI 在特定开发任务中的表现，使其输出更加规范、专业且符合最佳实践。

## 包含的技能

目前本项目提供了以下专业技能：

- **[Create README](./create-readme/SKILL.md)**: 为当前项目生成一个结构清晰、内容丰富且易读的 `README.md` 文件。支持从示例中汲取规范，并遵循 GFM 标准。
- **[Code Comments](./code-comments/SKILL.md)**: 生成符合规范的高质量代码注释与文档，并自动清理低质量或冗余的 AI 生成废话注释。
- **[Git Commit Message](./git-commit-message/SKILL.md)**: 根据代码变更自动生成符合规范的中文 Git 提交信息（Commit Message），准确总结代码变更意图。
- **[Go Unit Test](./go-unit-test/SKILL.md)**: 为 Golang 代码生成高质量、符合地道规范（如表驱动测试、TDD 原则）的单元测试用例。

## 如何使用

这些技能本质上是结构化的 Markdown 提示词（Prompts），可以被集成到支持自定义技能或规则的各种 AI 编程工具中。

### 在 Cursor 等原生支持的 IDE 中使用

1. 将所需的技能文件夹（例如 `go-unit-test`）复制到你目标项目的 `.cursor/skills/` 目录下。
2. 当你在 IDE 中与 AI 对话时，AI 会自动识别并加载这些可用的技能。
3. 你可以直接通过自然语言触发这些技能，例如：
   - *"为当前项目重新生成 readme"*
   - *"帮我给这段 Go 代码写个单元测试"*
   - *"总结一下目前的更改并生成 commit message"*

### 在其他 AI 工具中使用

你可以直接将 `SKILL.md` 中的内容作为系统提示词（System Prompt）、自定义指令（Custom Instructions）或项目规则（Project Rules）提供给你的 AI 助手，以获得同样专业的输出效果。

> [!TIP]
> 确保每个技能文件夹中都包含完整的 `SKILL.md` 文件，这是 AI Agent 识别和执行技能指令的核心依据。AI 会读取该文件中的 Frontmatter（名称和描述）来决定何时调用它。

## 技能文件结构

每个技能都由一个 `SKILL.md` 文件定义，通常包含以下核心部分：

- **Frontmatter**: 包含技能的 `name`（名称）和 `description`（描述），帮助 AI 理解该技能的用途以及触发时机。
- **角色定位**: 为 AI 设定一个专业的角色（如资深工程师、测试专家），以规范其输出的语气和专业度。
- **任务说明**: 详细且明确的步骤、规则和约束条件，指导 AI 如何一步步完成特定任务。
