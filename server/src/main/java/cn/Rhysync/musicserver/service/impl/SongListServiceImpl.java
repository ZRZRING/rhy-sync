package cn.Rhysync.musicserver.service.impl;

import cn.Rhysync.musicserver.domain.entity.ListSong;
import cn.Rhysync.musicserver.domain.entity.SongList;
import cn.Rhysync.musicserver.mapper.SongListMapper;
import cn.Rhysync.musicserver.service.IListSongService;
import cn.Rhysync.musicserver.service.ISongListService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class SongListServiceImpl extends ServiceImpl<SongListMapper, SongList> implements ISongListService {

    // 确保注入了 IListSongService
    private final IListSongService listSongService;

    /**
     * 实现接口中定义的方法
     * 请确保这个方法完整地存在于你的类中
     */
    @Override
    @Transactional(rollbackFor = Exception.class) // 声明这是一个事务性操作
    public boolean deleteSongListAndSongs(Integer id) {
        // 1. 删除中间表中的关联关系
        QueryWrapper<ListSong> wrapper = new QueryWrapper<>();
        wrapper.eq("song_list_id", id);
        listSongService.remove(wrapper);

        // 2. 删除歌单本身
        return this.removeById(id);
    }
}