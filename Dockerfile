#FROM eclipse-temurin:17
FROM eclipse-temurin:17-jdk-alpine

#Crear usuario para no usar root
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser

#Cambiamos al usuario creado
USER appuser

#Directorio de trabajo
WORKDIR /app

#ubicación del jar
ARG JAR_FILE=target/*.jar

#Copia el archivo .jar y lo deja en la ubicación
COPY ${JAR_FILE} demo-0.0.1.jar

EXPOSE 8000

ENTRYPOINT [ "java","-jar","demo-0.0.1.jar"]