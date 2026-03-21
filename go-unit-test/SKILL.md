---
name: go-unit-test
description: 为 Golang 代码生成高质量、符合地道规范（如表驱动测试、TDD原则）的单元测试。当用户要求编写、补充或优化 Go 语言的测试用例时使用。
---

# Golang 单元测试生成器

## 核心指令

当用户要求为 Go 代码生成单元测试时，请遵循以下核心规范和最佳实践（融合了 `golang-pro` 和 `go-testing` 的高标准要求）：

1. **表驱动测试 (Table-Driven Tests)**：
   - 必须优先使用表驱动测试模式（Go 官方推荐）。
   - 定义清晰的无名结构体切片作为测试用例集合，通常包含 `name`, `args`, `want`, `wantErr` 等字段。
   - 必须使用 `t.Run(tt.name, func(t *testing.T) { ... })` 执行子测试，以便在失败时能精确定位。

2. **断言与验证**：
   - 优先检查项目是否引入了 `github.com/stretchr/testify`。如果引入了，请使用 `assert` 或 `require` 包来简化断言。
   - 严格区分 `require`（遇到错误立即终止当前子测试）和 `assert`（记录错误并继续执行）。
   - 如果项目仅使用标准库，则使用 `if got != tt.want { t.Errorf(...) }` 的标准写法。

3. **测试覆盖率与边界条件 (TDD 思维)**：
   - 测试用例必须涵盖：正常路径 (Happy Path) 和异常路径 (Sad Path)。
   - 必须考虑边界条件、空值（`nil`）、零值以及各种可能的错误返回。

4. **Mock 与依赖注入**：
   - 如果被测函数依赖外部接口（如数据库、外部 API、文件系统），请识别这些依赖，并在测试代码中提供 Mock 实现（如使用 `gomock`、`testify/mock` 或手动实现 Fake 对象）。

5. **命名与包规范**：
   - 测试函数命名必须为 `TestXxx`（`Xxx` 为被测函数名，首字母大写）。
   - 测试文件必须以 `_test.go` 结尾。
   - 默认与被测文件处于同一个包中。如果用户要求纯黑盒测试，可以使用 `包名_test`。

## 测试代码模板示例

```go
package mypackage

import (
	"testing"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestMyFunction(t *testing.T) {
	// 1. 定义测试参数结构
	type args struct {
		input string
		count int
	}
	
	// 2. 定义表驱动测试用例
	tests := []struct {
		name    string
		args    args
		want    string
		wantErr bool
	}{
		{
			name: "正常情况_返回重复字符串",
			args: args{input: "hello", count: 2},
			want: "hellohello",
			wantErr: false,
		},
		{
			name: "边界情况_count为0返回空",
			args: args{input: "hello", count: 0},
			want: "",
			wantErr: false,
		},
		{
			name: "异常情况_非法输入返回错误",
			args: args{input: "", count: -1},
			want: "",
			wantErr: true,
		},
	}

	// 3. 遍历执行子测试
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			// 执行被测函数
			got, err := MyFunction(tt.args.input, tt.args.count)

			// 断言错误期望
			if tt.wantErr {
				require.Error(t, err, "期望返回错误，但得到了 nil")
				return // 如果期望报错，后续的正常值断言可跳过
			}
			require.NoError(t, err, "期望无错误，但得到了错误")

			// 断言返回值
			assert.Equal(t, tt.want, got, "返回值与期望不符")
		})
	}
}
```

## 执行步骤

1. **分析被测代码**：仔细阅读用户提供的 Go 函数/方法，识别输入参数、返回值、错误处理逻辑以及隐式/显式的外部依赖。
2. **设计测试用例**：在生成代码前，先构思并列出需要覆盖的场景（正常、异常、边界）。
3. **生成代码**：严格按照上述表驱动模板输出完整的 `_test.go` 代码。
4. **添加注释**：在关键的 Mock 逻辑或复杂的断言处添加简短的中文注释，说明测试意图。