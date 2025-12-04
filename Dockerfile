FROM eclipse-temurin:17-jdk-alpine AS build

WORKDIR /app

# Copy Maven files
COPY pom.xml .

# Copy source code
COPY src ./src

# Build the application
RUN apk add --no-cache maven && \
    mvn clean package -DskipTests

# Runtime stage
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Copy JAR from build stage
COPY --from=build /app/target/*.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
```

### 3. **.gitignore**
```
# Maven
target/
pom.xml.tag
pom.xml.releaseBackup
pom.xml.versionsBackup
pom.xml.next
release.properties
dependency-reduced-pom.xml
buildNumber.properties
.mvn/timing.properties

# Java
*.class
*.log
*.jar
*.war
*.ear
*.zip
*.tar.gz
*.rar

# IDE
.idea/
*.iml
.vscode/
.eclipse/
.settings/
.classpath
.project

# OS
.DS_Store
Thumbs.db

# Environment
.env
*.env