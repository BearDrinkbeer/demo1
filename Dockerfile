# 使用官方的 OpenJDK 镜像作为基础镜像
FROM adoptopenjdk/openjdk8

# 将应用的 JAR 文件复制到镜像中
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

# 启动应用
ENTRYPOINT ["java", "-jar", "/app.jar"]

# 优雅停止 (健康检查)
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:8080/actuator/health || exit 1
