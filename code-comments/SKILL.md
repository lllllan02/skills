---
name: code-comments
description: 生成符合规范的代码注释与文档，并清理低质量或冗余的 AI 生成注释。当用户要求添加注释、编写文档、解释代码或清理废话注释时使用。
---

# 代码注释与文档助手

## 核心指令

当用户要求生成代码注释、编写文档，或清理现有代码中的注释时，请遵循以下两大核心原则：

### 1. 规范注释生成 (Standardized Comment Generation)

编写高质量的注释和文档，重点在于传达**上下文**和**意图**：

*   **解释“为什么”（Why）而不是“做了什么”（What）**：代码本身已经说明了它在做什么，注释应该解释为什么这么做、背后的业务逻辑、妥协（Trade-offs）或特殊情况。
*   **清晰的行内/代码块注释**：**不需要**生成冗长的标准文档格式（如带有 `@param` 或 `@returns` 的格式）。重点是在代码逻辑之间添加清晰的中文注释，帮助开发者快速理解代码意图。
*   **Golang 注释习惯**：遵循 Go 语言的习惯，主要使用 `//` 进行单行或多行注释。对于导出的函数、类型或变量，可以在其上方添加一两句话的简短描述即可，无需过度格式化。
*   **保持更新**：如果修改了代码逻辑，必须同步更新相关的注释。

### 2. 清理冗余注释 (Clean up Redundant Comments)

识别并移除低价值、无意义的注释（特别是 AI 容易生成的废话注释）：

*   **移除“旁白式”注释**：例如 `// 结束 if 语句`、`// 循环遍历数组`。
*   **移除“翻译式”注释**：例如 `print(error) // 打印错误`、`count++ // 计数器加一`。
*   **按需保留或添加“步骤式”分段注释**：
    *   **移除废话**：如果方法很短、代码结构已经很清晰，类似 `// 第一步：获取数据` 的注释纯属多余，应当移除。
    *   **保留/添加分段**：当一个方法内的代码行数较多、逻辑较复杂时，**非常推荐**使用步骤式注释（如 `// 1. 获取并校验用户输入`，`// 2. 构建查询条件`）进行逻辑分段，让代码结构更清晰易读。
*   **移除空的占位符**：例如 `// TODO: add comment here`（如果没有实际待办事项）。
*   **必须保留的有价值注释**：
    *   具有明确行动点的 `TODO` 或 `FIXME`。
    *   针对复杂逻辑或 Hack 写法的警告（Warnings）。
    *   解释业务规则或外部依赖的注释。
    *   标准的 API 文档（如 JSDoc）。

---

## 示例

### 示例 1：生成清晰的代码间注释 (Golang)

**输入代码：**
```go
func CalculateDiscount(price float64, userTier string) float64 {
	if userTier == "VIP" {
		return price * 0.8
	}
	if userTier == "GOLD" {
		return price * 0.9
	}
	return price
}
```

**输出注释：**
```go
// CalculateDiscount 根据用户等级计算最终折扣价格
// 业务规则：VIP 用户享受 8 折优惠，GOLD 用户享受 9 折优惠
// 注意：此函数不处理价格为负数的异常情况，调用方需自行校验
func CalculateDiscount(price float64, userTier string) float64 {
	if userTier == "VIP" {
		return price * 0.8
	}
	
	if userTier == "GOLD" {
		return price * 0.9
	}
	
	// 普通用户无折扣
	return price
}
```

### 示例 2：清理冗余的 AI 注释并添加分段注释 (Golang)

**输入代码（包含废话注释）：**
```go
func ProcessData(data []Item) []Item {
	// 初始化一个空切片来存储结果
	var results []Item
	
	// 遍历数据中的每一项
	for _, item := range data {
		// 如果项是有效的
		if item.IsValid() {
			// 转换项并将其添加到结果切片中
			transformed := transform(item)
			results = append(results, transformed)
		}
	}
			
	// 返回结果切片
	return results
}
```

**清理后的输出代码：**
```go
// ProcessData 过滤并转换有效的数据项
func ProcessData(data []Item) []Item {
	var results []Item
	
	for _, item := range data {
		// 1. 过滤无效数据
		if !item.IsValid() {
			continue
		}
		
		// 2. 转换数据格式并收集
		results = append(results, transform(item))
	}
	
	return results
}
```