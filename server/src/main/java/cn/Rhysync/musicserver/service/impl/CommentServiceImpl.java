package cn.Rhysync.musicserver.service.impl;


import cn.Rhysync.musicserver.domain.entity.Comment;
import cn.Rhysync.musicserver.mapper.CommentMapper;
import cn.Rhysync.musicserver.service.ICommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements ICommentService{

}
