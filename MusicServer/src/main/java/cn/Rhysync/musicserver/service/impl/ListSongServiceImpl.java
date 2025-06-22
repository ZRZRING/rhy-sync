package cn.Rhysync.musicserver.service.impl;

import cn.Rhysync.musicserver.domain.entity.ListSong;
import cn.Rhysync.musicserver.mapper.ListSongMapper;
import cn.Rhysync.musicserver.service.IListSongService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class ListSongServiceImpl extends ServiceImpl<ListSongMapper, ListSong> implements IListSongService {
}