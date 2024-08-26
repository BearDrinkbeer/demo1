# Dockerfile

# 使用官方支持多架构的 OpenJDK 11 镜像
FROM openjdk:11-jre-slim

# 设置应用的工作目录
WORKDIR /app

# 将应用的 JAR 文件复制到镜像中
COPY target/springboot-demo-0.0.1-SNAPSHOT.jar /app/app.jar

# 暴露应用运行的端口
EXPOSE 8080

# 配置 JVM 参数以支持优雅关闭
ENV JAVA_OPTS="-XX:+ExitOnOutOfMemoryError -Djava.security.egd=file:/dev/./urandom"

# 设置入口点，运行 Spring Boot 应用
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar /app/app.jar"]
