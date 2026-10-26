# spring-gateway

基于 [Spring Cloud Alibaba integrated-gateway](https://github.com/alibaba/spring-cloud-alibaba/tree/2025.0.x/spring-cloud-alibaba-examples/integrated-example/integrated-gateway) 示例，为 `spring-cloud-demo` 提供的 API 网关。

## 能力

- Spring Cloud Gateway + Nacos 服务发现
- 路由配置放在 Nacos（`spring-gateway.yaml`，与 `spring-micro-01` 同属 `spring-cloud-demo` 配置组）
- Spring Cloud LoadBalancer（`lb://` 转发）
- Sentinel 网关限流（由 `spring-cloud-alibaba-sentinel-gateway` 自动装配过滤器；路由 ID：`springMicro01Hello`）
- 全局 CORS

## 路由

| 网关路径 | 下游服务 | 说明 |
|----------|----------|------|
| `GET /hello` | `spring-micro-01` | 直连微服务 `/hello` |
| `GET /micro-01/**` | `spring-micro-01` | 去掉前缀 `/micro-01` 后转发（如 `/micro-01/hello` → `/hello`） |

## 本地运行

1. 将 `config-init/config/spring-gateway.yaml` 与 `logging-config.yaml` 发布到 Nacos（`group=spring-cloud-demo`）。
2. 启动 `spring-micro-01` 并注册到同一 Nacos。
3. 在本目录执行：

```bash
mvn spring-boot:run
```

4. 访问 `http://localhost:8080/hello` 或 `http://localhost:8080/micro-01/hello`。

环境变量 `NACOS_SERVER_ADDR` 默认与 `spring-micro-01` 一致：`192.168.1.205:30524`。
