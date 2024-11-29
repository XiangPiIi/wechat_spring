package com.example.wechat_spring.repository;

import com.example.wechat_spring.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
    User findByUserId(String userId); // 根据用户名查找用户
}