# AGENTS.md

## 项目概述

用户中心管理系统（UserCenter）是一个统一用户认证与管理中心，提供用户注册/登录、OAuth2 授权、多应用绑定、审计日志、邮件通知、站点配置等功能。

## 技术栈

- 后端：ASP.NET Core 10 + EF Core + ASP.NET Core Identity
- 认证：OpenIddict 或 Duende IdentityServer（待选型）
- 前端：React 18+ + TypeScript + Tailwind CSS 4 + Vite
- 数据库：PostgreSQL（默认），兼容 SQL Server / MySQL
- 部署：Docker + Docker Compose

## 项目结构

- `src/UserCenter.Api/` — Web API 入口，控制器、中间件、配置
- `src/UserCenter.Domain/` — 领域实体、值对象、枚举、领域事件接口
- `src/UserCenter.Application/` — 应用服务接口与实现、DTO、AutoMapper Profile
- `src/UserCenter.Infrastructure/` — EF Core DbContext、仓储实现、邮件服务、外部集成
- `src/UserCenter.Shared/` — 跨层共享的常量、工具类、响应模型
- `frontend/` — React SPA 用户端页面
- `tests/` — 单元测试和集成测试
- `docs/` — PRD、工作计划、设计文档

## 开发约定

### 分支策略

- `main` — 生产分支，仅通过 PR 合并
- `develop` — 开发主线
- `feature/<name>` — 功能分支
- `fix/<name>` — 修复分支

### 命名规范

- C# 命名遵循 Microsoft 官方约定（PascalCase 公开成员，camelCase 私有字段）
- React 组件文件使用 PascalCase，hooks 使用 camelCase 并以 `use` 前缀
- API 路由使用 kebab-case：`/api/auth/register`

### 提交信息

```
<type>(<scope>): <subject>

feat: 新功能
fix: 缺陷修复
docs: 文档更新
refactor: 重构
test: 测试
chore: 构建/工具
```

## 当前状态

项目处于 **阶段 0：项目初始化与环境搭建**。详见 `docs/work-plan.md`。
