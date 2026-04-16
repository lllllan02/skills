# Makefile

# Cursor 全局 skills 目录
CURSOR_SKILLS_DIR := ~/.cursor/skills

# 获取当前目录下所有包含 SKILL.md 的文件夹
SKILL_DIRS := $(patsubst %/,%,$(dir $(wildcard */SKILL.md)))

.PHONY: all install clean list

all: install

install:
	@echo "🚀 开始同步 skills 到 $(CURSOR_SKILLS_DIR)..."
	@mkdir -p $(CURSOR_SKILLS_DIR)
	@for dir in $(SKILL_DIRS); do \
		echo "📁 正在复制 $$dir..."; \
		cp -R $$dir $(CURSOR_SKILLS_DIR)/; \
	done
	@echo "✅ 所有 skills 同步完成！请重启 Cursor 或重新加载窗口以生效。"

clean:
	@echo "🗑️ 开始从 $(CURSOR_SKILLS_DIR) 清理当前项目的 skills..."
	@for dir in $(SKILL_DIRS); do \
		if [ -d "$(CURSOR_SKILLS_DIR)/$$dir" ]; then \
			echo "🗑️ 正在删除 $$dir..."; \
			rm -rf "$(CURSOR_SKILLS_DIR)/$$dir"; \
		fi \
	done
	@echo "✅ 清理完成！"

list:
	@echo "📦 当前项目包含以下 skills："
	@for dir in $(SKILL_DIRS); do \
		echo "  - $$dir"; \
	done
