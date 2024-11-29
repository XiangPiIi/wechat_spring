package com.example.wechat_spring.entity;

import java.sql.Timestamp;


public class FriendDto {
    private String friendId;           // 好友的ID
    private String lastMessage;        // 最后发送的消息内容
    private Long lastMessageTime;      // 最后发送消息的时间戳
    private String avatarUrl;          // 好友的头像URL
    private String friendName;         // 好友的用户名

    // 构造函数
    public FriendDto(String friendId, String lastMessage, Long lastMessageTime, String avatarUrl, String friendName) {
        this.friendId = friendId;
        this.lastMessage = lastMessage;
        this.lastMessageTime = lastMessageTime;
        this.avatarUrl = avatarUrl;
        this.friendName = friendName;
    }

    // Getter 和 Setter 方法

    public String getFriendId() {
        return friendId;
    }

    public void setFriendId(String friendId) {
        this.friendId = friendId;
    }

    public String getLastMessage() {
        return lastMessage;
    }

    public void setLastMessage(String lastMessage) {
        this.lastMessage = lastMessage;
    }

    public Long getLastMessageTime() {
        return lastMessageTime;
    }

    public void setLastMessageTime(Long lastMessageTime) {
        this.lastMessageTime = lastMessageTime;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getFriendName() {
        return friendName;
    }

    public void setFriendName(String friendName) {
        this.friendName = friendName;
    }

    // 可选：重写toString()方法，方便调试和输出
    @Override
    public String toString() {
        return "FriendDto{" +
                "friendId='" + friendId + '\'' +
                ", lastMessage='" + lastMessage + '\'' +
                ", lastMessageTime=" + lastMessageTime +
                ", avatarUrl='" + avatarUrl + '\'' +
                ", friendName='" + friendName + '\'' +
                '}';
    }
}
