package com.example.wechat_spring.handler;

import com.example.wechat_spring.entity.FriendDto;
import com.example.wechat_spring.entity.FriendRelationship;
import com.example.wechat_spring.service.FriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/friends")
public class FriendController {
    @Autowired
    private FriendService friendService;

    @GetMapping
    public List<FriendDto> getFriends(@RequestParam String userId) {
        return friendService.getFriends(userId);
    }
}