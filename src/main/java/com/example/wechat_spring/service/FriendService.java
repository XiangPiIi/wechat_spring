package com.example.wechat_spring.service;

import com.example.wechat_spring.entity.FriendDto;
import com.example.wechat_spring.entity.FriendRelationship;
import com.example.wechat_spring.repository.FriendRelationshipRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FriendService {
    @Autowired
    private FriendRelationshipRepository friendRelationshipRepository;

    public List<FriendDto> getFriends(String userId) {
        return friendRelationshipRepository.findFriendsWithLastMessage(userId);
    }
}