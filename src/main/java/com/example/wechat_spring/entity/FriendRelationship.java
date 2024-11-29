package com.example.wechat_spring.entity;

import jakarta.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "friend_relationship")
public class FriendRelationship {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id1", nullable = false)
    private String userId1;

    @Column(name = "user_id2", nullable = false)
    private String userId2;

    @Column(name = "created_at", nullable = false)
    private Long createdAt;


    // Getters and Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserId1() {
        return userId1;
    }

    public void setUserId1(String userId1) {
        this.userId1 = userId1;
    }

    public String getUserId2() {
        return userId2;
    }

    public void setUserId2(String userId2) {
        this.userId2 = userId2;
    }

    public Long getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Long createdAt) {
        this.createdAt = createdAt;
    }
}