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

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SongListServiceImpl extends ServiceImpl<SongListMapper, SongList> implements ISongListService {

    private final IListSongService listSongService;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteSongListAndSongs(Integer id) {
        QueryWrapper<ListSong> wrapper = new QueryWrapper<>();
        wrapper.eq("song_list_id", id);
        listSongService.remove(wrapper);
        return this.removeById(id);
    }

    /**
     * 新增的批量更新方法实现
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateSongsInList(Integer songListId, List<Integer> songsToAdd, List<Integer> songsToRemove) {
        // 1. 处理移除
        if (songsToRemove != null && !songsToRemove.isEmpty()) {
            QueryWrapper<ListSong> removeWrapper = new QueryWrapper<>();
            removeWrapper.eq("song_list_id", songListId).in("song_id", songsToRemove);
            listSongService.remove(removeWrapper);
        }

        // 2. 处理添加
        if (songsToAdd != null && !songsToAdd.isEmpty()) {
            // 将歌曲ID列表转换为 ListSong 实体列表
            List<ListSong> newLinks = songsToAdd.stream().map(songId -> {
                ListSong link = new ListSong();
                link.setSongListId(songListId);
                link.setSongId(songId);
                return link;
            }).collect(Collectors.toList());
            listSongService.saveBatch(newLinks);
        }

        return true;
    }
}