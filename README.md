# Discord Self Bot

Bot tự động gửi tin nhắn Discord theo khoảng thời gian ngẫu nhiên.

## Cấu hình trên Railway

1. Push code lên GitHub
2. Import project vào Railway
3. Thêm biến môi trường:
    - Variable name: `MY_DISCORD_TOKEN`
    - Value: Token Discord của bạn

## Cấu hình local

### Build project:
```bash
mvn clean package
```

### Chạy:
```bash
export MY_DISCORD_TOKEN="your_discord_token_here"
java -jar target/discord-self-bot-1.0.0.jar
```

## Chỉnh sửa

Mở file `src/main/java/SecureDiscordBot.java` để thay đổi:
- `CHANNEL_ID`: ID channel muốn gửi
- `MIN_MINUTES`, `MAX_MINUTES`: Khoảng thời gian random
- `MESSAGES`: Danh sách tin nhắn# wtf-bot
# wtf-bot
