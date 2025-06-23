package cn.Rhysync.musicserver.service;

import cn.Rhysync.musicserver.domain.entity.SongList;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 歌单(SongList)表服务接口
 *
 * @author makejava
 * @since 2025-06-22 08:43:48
 */
public interface ISongListService extends IService<SongList> {
    boolean deleteSongListAndSongs(Integer id);

    boolean updateSongsInList(Integer songListId, List<Integer> songsToAdd, List<Integer> songsToRemove);
}
