# 用户中心管理系统 (UserCenter)

基于 ASP.NET Core 10 + React 18 的统一用户认证与管理中心。

## 技术栈

| 层级 | 技术 |
|------|------|
| 后端框架 | ASP.NET Core 10 |
| ORM | Entity Framework Core |
| 认证框架 | ASP.NET Core Identity + OpenIddict / Duende IdentityServer |
| 前端 | React 18+ + TypeScript + Tailwind CSS 4 (Vite) |
| 数据库 | PostgreSQL (开发/生产)，兼容 SQL Server / MySQL |
| 缓存 | IMemoryCache / Redis |
| 日志 | Serilog |
| 部署 | Docker + Docker Compose |

## 项目结构

```
UserCenter/
├── src/
│   ├── UserCenter.Api/              # ASP.NET Core Web API
│   ├── UserCenter.Domain/           # 领域实体、值对象
│   ├── UserCenter.Application/      # 应用服务、DTO、接口
│   ├── UserCenter.Infrastructure/   # EF Core、邮件、外部服务
│   └── UserCenter.Shared/           # 共享常量、工具类
├── frontend/                        # React SPA
├── tests/
│   ├── UserCenter.UnitTests/
│   └── UserCenter.IntegrationTests/
├── docs/                            # PRD、工作计划、设计文档
├── docker-compose.yml
└── Dockerfile
```

## 快速开始

### 前置条件

- .NET 10 SDK
- Node.js 18+
- Docker Desktop

### 本地开发

```bash
# 启动数据库
docker compose up -d db

# 启动后端
cd src/UserCenter.Api
dotnet run

# 启动前端
cd frontend
npm install
npm run dev
```

### Docker 一键启动

```bash
docker compose up -d
```

## 分支策略

- `main` — 生产就绪代码，仅通过 PR 合并
- `develop` — 开发主线，功能分支从此分出
- `feature/*` — 功能开发分支
- `fix/*` — 缺陷修复分支
- `release/*` — 发布准备分支

## 文档

- [产品需求文档 (PRD)](docs/PRD.md)
- [工作计划](docs/work-plan.md)
