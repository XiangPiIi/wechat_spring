package com.example.wechat_spring.handler;

import com.example.wechat_spring.entity.ChatMessage;
import com.example.wechat_spring.repository.ChatMessageRepository;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
@Service
public class ChatWebSocketHandler extends TextWebSocketHandler {

    private ChatMessageRepository chatMessageRepository; // 注入 JPA 仓库
    // 存储所有在线用户的WebSocket会话
    private ConcurrentHashMap<String, WebSocketSession> userSessions = new ConcurrentHashMap<>();
    @Autowired
    public ChatWebSocketHandler(ChatMessageRepository chatMessageRepository) {
        this.chatMessageRepository = chatMessageRepository;
    }
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

        String payload = message.getPayload();
        JsonObject jsonMessage = new Gson().fromJson(payload, JsonObject.class);
        String messageType = jsonMessage.get("type").getAsString();
        if ("identify".equals(messageType)) {
            // 处理身份认证消息，将 senderId 和 WebSocketSession 关联
            String senderId = jsonMessage.get("senderId").getAsString();
            String receiverId=jsonMessage.get("receiverId").getAsString();
            userSessions.put(senderId, session);
            System.out.println("用户已识别，ID：" + senderId);

            List<ChatMessage> messages = chatMessageRepository.findMessagesBetweenUsers(senderId, receiverId);

            // 将消息转换为JSON并发送
            JsonObject response = new JsonObject();
            response.addProperty("type", "history");
            response.add("messages", new Gson().toJsonTree(messages));

            session.sendMessage(new TextMessage(response.toString()));

        } else if ("chat".equals(messageType)) {
            // 处理聊天消息
            ChatMessage msgData = new Gson().fromJson(payload, ChatMessage.class);
            String receiverId = msgData.getReceiverId();
            System.out.println("收到了准备发布订阅");


            // 保存消息到数据库
            saveMessageToDatabase(msgData);

            // 获取接收者的 WebSocketSession 并发送消息
            WebSocketSession receiverSession = userSessions.get(receiverId);
            if (receiverSession != null && receiverSession.isOpen()) {
                // 转发消息给接收者
                receiverSession.sendMessage(new TextMessage(payload));
            } else {
                // 如果接收者离线，存储离线消息
                storeOfflineMessage(msgData);
            }
        }

    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // 从在线会话列表中移除断开连接的用户
        userSessions.values().removeIf(s -> s.getId().equals(session.getId()));
    }

    private ChatMessage parseMessageData(String payload) {

        return new Gson().fromJson(payload, ChatMessage.class);
    }
    private void saveMessageToDatabase(ChatMessage msgData) {

        // 使用 JPA 保存消息
        chatMessageRepository.save(msgData);
    }
    private void storeOfflineMessage(ChatMessage msgData) {

        System.out.println("离线存储了"+msgData.toString());
    }
}
