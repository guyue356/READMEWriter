# Mermaid 图常用模式

## 1. 系统架构图

适用于展示整体系统模块和关系。

```mermaid
flowchart TD
    User[用户] --> API[API 网关]
    API --> Auth[认证服务]
    API --> Core[核心服务]
    Core --> DB[(数据库)]
    Core --> Cache[(缓存)]
    Core --> Queue[消息队列]
    Queue --> Worker[后台任务]
    Worker --> Storage[对象存储]
```

**使用场景**：全栈应用、微服务架构、平台型项目

---

## 2. 数据流图

适用于展示数据从输入到输出的流转过程。

```mermaid
flowchart LR
    Input[数据输入] --> Parse[解析]
    Parse --> Transform[转换]
    Transform --> Validate[校验]
    Validate --> Output[数据输出]
    Validate -->|失败| Error[错误处理]
```

**使用场景**：数据处理管道、ETL 流程、编译器

---

## 3. Agent 编排图

适用于展示 AI Agent 的协作关系。

```mermaid
flowchart TD
    Orchestrator[编排 Agent] --> Planner[规划 Agent]
    Orchestrator --> Executor[执行 Agent]
    Orchestrator --> Reviewer[审查 Agent]
    Planner --> |任务分解| Executor
    Executor --> |执行结果| Reviewer
    Reviewer --> |反馈| Orchestrator
    Executor --> Tools[外部工具]
    Executor --> LLM[大语言模型]
```

**使用场景**：Multi-Agent 系统、AI 编排平台

---

## 4. Prompt Pipeline 图

适用于展示 Prompt 的流转和处理过程。

```mermaid
flowchart LR
    Context[上下文收集] --> Template[模板填充]
    Template --> Optimize[Prompt 优化]
    Optimize --> LLM[LLM 推理]
    LLM --> Parse[结果解析]
    Parse --> |合格| Output[输出]
    Parse --> |不合格| Retry[重试]
    Retry --> Optimize
```

**使用场景**：Prompt 工程、AI 应用

---

## 5. RAG 流程图

适用于展示检索增强生成的完整流程。

```mermaid
flowchart TD
    Query[用户查询] --> Embed[向量化]
    Embed --> Search[向量检索]
    Search --> Rerank[重排序]
    Rerank --> Context[上下文组装]
    Context --> LLM[LLM 生成]
    LLM --> Answer[回答]

    Doc[文档] --> Chunk[分块]
    Chunk --> DocEmbed[向量化]
    DocEmbed --> VectorDB[(向量数据库)]
    VectorDB --> Search
```

**使用场景**：RAG 系统、知识库问答

---

## 6. 时序图

适用于展示组件间的时序交互。

```mermaid
sequenceDiagram
    participant U as 用户
    participant A as API
    participant S as 服务
    participant D as 数据库

    U->>A: 发送请求
    A->>S: 处理逻辑
    S->>D: 查询数据
    D-->>S: 返回结果
    S-->>A: 响应数据
    A-->>U: 返回结果
```

**使用场景**：API 调用流程、认证流程、支付流程

---

## 7. 状态图

适用于展示系统或对象的状态转换。

```mermaid
stateDiagram-v2
    [*] --> Pending
    Pending --> Running: 开始执行
    Running --> Success: 执行成功
    Running --> Failed: 执行失败
    Failed --> Running: 重试
    Success --> [*]
    Failed --> [*]: 超过重试次数
```

**使用场景**：任务状态机、订单流程、部署流程

---

## 8. 部署架构图

适用于展示部署拓扑和基础设施。

```mermaid
flowchart TD
    LB[负载均衡] --> App1[应用实例 1]
    LB --> App2[应用实例 2]
    LB --> App3[应用实例 3]
    App1 --> DB[(主数据库)]
    App2 --> DB
    App3 --> DB
    DB --> Replica[(从数据库)]
    App1 --> Redis[(Redis 缓存)]
    App1 --> OSS[对象存储]
```

**使用场景**：云原生应用、微服务部署

---

## 9. 类/模块关系图

适用于展示代码层面的抽象关系。

```mermaid
classDiagram
    class Agent {
        +name: str
        +tools: List
        +run(input)
    }
    class Planner {
        +plan(task)
    }
    class Executor {
        +execute(plan)
    }
    Agent <|-- Planner
    Agent <|-- Executor
    Agent --> LLM
    Agent --> Tool
```

**使用场景**：库/SDK 设计、框架架构

---

## 使用原则

1. **选择合适的图表类型** — 不要为了用 Mermaid 而用 Mermaid
2. **保持简洁** — 节点不超过 15 个，层级不超过 4 层
3. **标注关键信息** — 数据流向、协议、关键决策点
4. **与文字配合** — 图后必须有文字说明各模块职责
5. **中文标签** — 所有节点标签使用中文
