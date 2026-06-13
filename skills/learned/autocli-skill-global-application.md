# AutoCLI 技能全局应用模式

**提取时间：** 2026-06-13
**适用场景：** Claude Code 插件架构 — 适用于创建或推广可跨项目复用的技能

## 问题

定义在项目目录（`<project>/.claude/skills/`）中的技能仅在该项目中可用。当某个技能对多个代码库都有价值时（如 CLI 自动化、编码规范、安全检查），则需要将其设为全局可访问。

## 解决方案

将技能放置在 `~/.claude/skills/[skill-name]/SKILL.md`，结构如下：

```
~/.claude/skills/
└── [skill-name]/
    └── SKILL.md          ← 前置元数据 + 内容
```

前置元数据格式：

```yaml
---
name: skill-name
description: 用于技能路由的单句描述
origin: ECC              # 或：learned、custom 等
---
```

关键章节：
1. **何时激活** — 通用触发条件（不包含任何项目特定引用）
2. 内容 — 模式、示例、检查清单

## 晋升工作流

将项目级本能提升为全局范围：

```bash
/promote [instinct-id]              # 晋升指定本能
/promote --dry-run                  # 预览候选项
/evolve --generate                  # 聚类本能 → 技能/命令/代理
```

已晋升的本能保存至：`~/.claude/homunculus/instincts/personal/`，`scope: global`

通过 `/learn` 提取的已学技能保存至：`~/.claude/skills/learned/`

## 技能放置策略

| 位置 | 作用域 | 适用场景 |
|---|---|---|
| `<project>/.claude/skills/` | 项目本地 | 专属于某一代码库 |
| `~/.claude/skills/` | 全局 | 可跨所有项目复用 |
| `~/.claude/skills/learned/` | 全局（自动生成） | 由 `/learn` 提取 |
| `~/.claude/homunculus/` | 全局（基于本能） | 通过 `/promote` 晋升 |

## 何时使用

- 某技能在 2 个及以上项目中无需修改即可复用
- 某编码模式、CLI 工具或工作流与项目无关
- 希望在任何 Claude Code 会话中直接使用该技能，无需手动复制文件
- 在 `/learn` 识别出值得全局化的可复用模式后触发
