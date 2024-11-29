package com.example.wechat_spring.handler;

import com.example.wechat_spring.entity.User;
import com.example.wechat_spring.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;

@RestController
@RequestMapping("/api")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody User request) {
        // 验证用户名和密码
        User user = userRepository.findByUserId(request.getUserId());

        if (user != null && user.getPassword().equals(request.getPassword())) {
            user.setPassword(" ");//安全性不返回密码
            return ResponseEntity.ok(user);
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("用户名或密码错误");
        }
    }
}

