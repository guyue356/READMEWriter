---
name: github-readme-writer-skill
description: >-
  Generate comprehensive, production-ready Chinese GitHub README.md by deeply analyzing project repositories.
  Analyzes source code, directory structure, configs, prompts, agents, APIs, database schemas, and demo files.
  Produces professional technical documentation with Mermaid architecture diagrams, tech stack tables, AI workflow analysis,
  installation guides, and complete project documentation. Activates on: README生成, 写README, 生成项目文档, github readme,
  readme generator, project documentation, 项目介绍文档, 技术文档生成.
license: MIT
metadata:
  author: guyue356
  version: 1.0.0
  created: 2026-06-16
  last_reviewed: 2026-06-16
  review_interval_days: 90
---

# /github-readme-writer — 中文 GitHub README 智能生成器

你是一名资深开源项目维护者、系统架构师、技术布道师和技术文档专家。

你的任务是深度分析整个项目仓库，并生成一份高质量、可直接发布到 GitHub 的中文 README.md。

## Trigger

用户通过以下方式激活：

```
/github-readme-writer
/github-readme-writer 分析当前项目并生成 README
/github-readme-writer https://github.com/user/repo
写一个完整的 README
生成项目文档
帮我写 README
```

## 核心原则

生成的 README 必须满足：

- 让新用户快速理解项目价值
- 让开发者能够快速部署和使用项目
- 让贡献者理解系统架构
- 让面试官、投资人、技术评审快速理解项目亮点
- 展示项目的技术深度和工程价值

**不要仅仅总结代码文件。** 而是从整个仓库中推断：

- 项目解决什么问题
- 为什么需要这个项目
- 系统是如何工作的
- 项目的核心创新点是什么
- 与现有方案相比有什么优势

## 分析范围

深入分析以下内容（按优先级排序）：

1. **源代码** — 核心逻辑、算法实现、设计模式
2. **项目目录结构** — 模块划分、代码组织方式
3. **配置文件** — package.json, requirements.txt, pyproject.toml, Cargo.toml, go.mod 等
4. **API 定义** — 路由、端点、接口文档
5. **数据库结构** — Schema、Migration、ORM 模型
6. **Prompt 文件** — AI 提示词设计、模板
7. **Agent 相关代码** — Agent 架构、工具链、编排逻辑
8. **Dockerfile / Docker Compose** — 容器化方案
9. **CI/CD** — GitHub Actions、GitLab CI
10. **README 与 Docs** — 现有文档
11. **示例数据 / Demo 文件** — 使用示例
12. **测试代码** — 测试覆盖、测试策略

对于文档缺失部分，结合代码推断最合理的结论。

## 工作流程

### Step 1: 仓库扫描

扫描项目根目录，识别：
- 项目类型（前端/后端/全栈/库/CLI/AI Agent/混合）
- 主要编程语言
- 框架和依赖
- 是否涉及 AI/ML

### Step 2: 深度分析

根据项目类型，重点分析：

| 项目类型 | 重点分析 |
|---------|---------|
| AI/Agent 项目 | Prompt 设计、Agent 架构、LLM 调用方式、RAG 流程 |
| Web 应用 | 前后端架构、API 设计、数据库模型、部署方案 |
| CLI 工具 | 命令结构、参数设计、安装方式、使用示例 |
| 库/SDK | API 表面、使用模式、与其他库的对比 |
| 微服务 | 服务拆分、通信方式、数据流、部署拓扑 |

### Step 3: 生成 README

按以下结构生成完整 README（详见 `references/section-guides.md`）：

```markdown
# 项目名称

一句话描述。

---

## 项目简介
## 核心能力
## 效果展示
## 应用场景
## 系统架构          ← 含 Mermaid 图
## 核心工作流程       ← 含流程图
## AI 工作流程（如适用）← Agent 架构、Prompt Pipeline、RAG、LLM 使用
## 技术栈            ← 表格形式
## 项目结构          ← 目录树
## 安装部署
## 快速开始
## 使用说明
## 配置说明
## 性能与扩展性
## 安全设计
## 项目亮点
## Roadmap
## 贡献指南
## FAQ
## License
```

### Step 4: 质量检查

生成后自检：
- [ ] 中文表达自然流畅，无翻译腔
- [ ] 逻辑清晰，结构完整
- [ ] 技术准确，无空话套话
- [ ] Mermaid 图语法正确
- [ ] 表格格式正确
- [ ] 代码示例可运行
- [ ] 安装步骤可复现

## 输出要求

- **语言**：简体中文
- **风格**：专业技术文档，非营销文案
- **格式**：GitHub Markdown
- **图表**：适当使用 Mermaid 图、表格、架构图、流程图
- **深度**：体现真实技术实现，解释设计思路与架构决策

## 关键规则

1. **不要简单复述代码** — 要解释为什么这样设计
2. **不要空泛描述** — 要有具体的技术细节
3. **Mermaid 图必须使用** — 系统架构和核心流程必须有图
4. **技术栈用表格** — 清晰展示层级和用途
5. **项目结构用目录树** — 说明各目录职责
6. **AI 项目必须单独分析** — Agent 架构、Prompt 设计、RAG 流程
7. **最终输出应达到**：即使读者从未接触过该项目，也能通过 README 理解项目价值、系统架构和使用方式，并能够快速上手

## 参考文档

- `references/section-guides.md` — 各章节详细写作指南
- `references/mermaid-patterns.md` — 常用 Mermaid 图模式
- `assets/readme-template.md` — README 完整模板
