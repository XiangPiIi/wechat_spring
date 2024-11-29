package com.example.wechat_spring.repository;

import com.example.wechat_spring.entity.FriendDto;
import com.example.wechat_spring.entity.FriendRelationship;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FriendRelationshipRepository extends JpaRepository<FriendRelationship, Long> {
    @Query("SELECT new com.example.wechat_spring.entity.FriendDto(" +
            "CASE WHEN fr.userId1 = :userId THEN fr.userId2 ELSE fr.userId1 END, " +
            "m.messageContent, " +
            "m.timestamp, " +
            "u.avatarUrl, u.username) " +
            "FROM FriendRelationship fr " +
            "LEFT JOIN User u ON u.userId = CASE WHEN fr.userId1 = :userId THEN fr.userId2 ELSE fr.userId1 END " +
            "LEFT JOIN ChatMessage m ON m.id = (" +
            "SELECT m2.id FROM ChatMessage m2 " +
            "WHERE (m2.senderId = fr.userId1 AND m2.receiverId = fr.userId2) " +
            "OR (m2.senderId = fr.userId2 AND m2.receiverId = fr.userId1) " +
            "ORDER BY m2.timestamp DESC " +
            "LIMIT 1" +
            ") " +
            "WHERE fr.userId1 = :userId OR fr.userId2 = :userId")
    List<FriendDto> findFriendsWithLastMessage(@Param("userId") String userId);

}