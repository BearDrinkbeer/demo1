# 使用官方 OpenJDK 镜像作为基础镜像
FROM openjdk:17-jdk-alpine

# 将 JAR 文件添加到镜像中
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar

# 暴露端口
EXPOSE 8080

# 启动 Spring Boot 应用
ENTRYPOINT ["java", "-jar", "/app.jar"]
