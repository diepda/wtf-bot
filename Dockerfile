# ========== DOCKERFILE ==========
# Dùng OpenJDK 21 slim (nhẹ nhất, đủ dùng)
FROM eclipse-temurin:21-jdk-alpine

# Tạo thư mục làm việc
WORKDIR /app

# Copy toàn bộ file (hoặc chỉ file jar nếu mày đã build sẵn)
# Cách 1: Copy source + build luôn trong Docker (dành cho mày chưa có jar)
COPY . .

# Nếu mày dùng Maven/Gradle thì uncomment dòng dưới
# RUN ./mvnw clean package -DskipTests   # Maven
# RUN ./gradlew build                    # Gradle

# Nếu mày chỉ có file .java đơn lẻ thì compile luôn:
RUN javac SmartLevelSpammer.java

# Chạy file .class (không cần jar cũng được)
ENTRYPOINT ["java", "SmartLevelSpammer"]

# Nếu mày muốn build thành jar thì dùng cái này thay 2 dòng trên:
# RUN jar cfe app.jar SmartLevelSpammer *.class
# ENTRYPOINT ["java", "-jar", "app.jar"]
# =================================
