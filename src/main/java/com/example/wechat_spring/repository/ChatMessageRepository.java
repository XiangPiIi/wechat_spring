package com.example.wechat_spring.repository;

import com.example.wechat_spring.entity.ChatMessage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;
@Repository
public interface ChatMessageRepository extends JpaRepository<ChatMessage, Long> {
    // 其他自定义查询方法
    @Query("SELECT m FROM ChatMessage m WHERE (m.senderId = ?1 AND m.receiverId = ?2) OR (m.senderId = ?2 AND m.receiverId = ?1) ORDER BY m.timestamp ASC")
    List<ChatMessage> findMessagesBetweenUsers(String user1Id, String user2Id);
}

