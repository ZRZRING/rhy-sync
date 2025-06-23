package cn.Rhysync.musicserver.service.impl;

// UserServiceImpl.java
import cn.Rhysync.musicserver.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.Rhysync.musicserver.domain.entity.User;
import cn.Rhysync.musicserver.mapper.UserMapper;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {}