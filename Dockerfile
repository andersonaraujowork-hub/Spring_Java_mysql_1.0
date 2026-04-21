FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

# Adiciona um usuário sem privilégios para segurança (opcional, mas recomendado)
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

# Copia o jar gerado pelo seu Maven (certifique-se de ter rodado 'mvn clean package')
COPY target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]