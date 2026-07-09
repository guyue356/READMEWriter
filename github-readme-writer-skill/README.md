# github-readme-writer-skill

中文 GitHub README 智能生成器 — 深度分析项目仓库，生成高质量、可直接发布的技术文档。

## 功能

- 自动分析源代码、配置文件、API、数据库结构、Agent 代码等
- 生成完整中文 README，包含 20+ 专业章节
- 自动生成 Mermaid 架构图和流程图
- 技术栈表格、项目结构目录树
- AI 项目专用分析（Agent 架构、Prompt Pipeline、RAG 流程）
- 支持所有主流 AI 编码工具

## 安装

### Claude Code

```bash
# 克隆到 Claude Code 技能目录
git clone <repo-url> ~/.claude/skills/github-readme-writer-skill
```

### GitHub Copilot CLI

```bash
git clone <repo-url> ~/.copilot/skills/github-readme-writer-skill
```

### Codex CLI / Gemini CLI

```bash
git clone <repo-url> ~/.agents/skills/github-readme-writer-skill
```

### Cursor（项目级）

```bash
git clone <repo-url> .cursor/skills/github-readme-writer-skill
```

### Cline

```bash
git clone <repo-url> ~/.cline/skills/github-readme-writer-skill
```

### Windsurf

```bash
git clone <repo-url> ~/.codeium/windsurf/skills/github-readme-writer-skill
```

### 自动安装

```bash
cd github-readme-writer-skill
chmod +x install.sh
./install.sh                # 自动检测平台
./install.sh --all          # 安装到所有平台
./install.sh --platform claude  # 指定平台
```

## 使用

在任意支持的 AI 工具中，输入：

```
/github-readme-writer
```

或自然语言触发：

```
帮我写一个完整的 README
生成项目文档
分析当前项目并生成 README
```

## 包含内容

```
github-readme-writer-skill/
├── SKILL.md                    # 技能定义（主文件）
├── AGENTS.md                   # 伴侣指令文件
├── references/
│   ├── section-guides.md       # 各章节详细写作指南
│   └── mermaid-patterns.md     # 常用 Mermaid 图模式
├── assets/
│   └── readme-template.md      # README 完整模板
├── install.sh                  # 跨平台安装脚本
└── README.md                   # 本文件
```

## 生成的 README 结构

| 章节 | 说明 |
|------|------|
| 项目名称 + 一句话描述 | 核心价值概括 |
| 项目简介 | 背景、问题、价值 |
| 核心能力 | 功能列表 + 价值说明 |
| 效果展示 | 输入/输出/Demo |
| 应用场景 | 具体使用场景 |
| 系统架构 | Mermaid 架构图 |
| 核心工作流程 | 流程图 + 步骤说明 |
| AI 工作流程 | Agent 架构、Prompt、RAG、LLM |
| 技术栈 | 表格形式 |
| 项目结构 | 目录树 |
| 安装部署 | 完整安装指南 |
| 快速开始 | 5 分钟上手 |
| 使用说明 | CLI/API/Web 示例 |
| 配置说明 | 环境变量表格 |
| 性能与扩展性 | 瓶颈分析、扩展方案 |
| 安全设计 | 认证、权限、数据安全 |
| 项目亮点 | 技术/工程/产品创新 |
| Roadmap | 开发计划 |
| 贡献指南 | 参与贡献流程 |
| FAQ | 常见问题 |
| License | 许可证 |

## License

MIT
