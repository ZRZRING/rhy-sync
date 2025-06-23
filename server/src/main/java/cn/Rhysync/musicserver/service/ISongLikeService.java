package cn.Rhysync.musicserver.service;

import cn.Rhysync.musicserver.domain.entity.SongLike;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 歌曲点赞统计 服务类
 * </p>
 *
 * @author kgc
 * @since 2025-06-22
 */
public interface ISongLikeService extends IService<SongLike> {

    /**
     * 点赞/取消点赞歌曲
     * @param songId 歌曲ID
     * @param isLike true为点赞，false为取消点赞
     * @return 是否成功
     */
    boolean likeSong(Integer songId, boolean isLike);

    /**
     * 获取歌曲的点赞统计
     * @param songId 歌曲ID
     * @return 点赞统计
     */
    SongLike getSongLike(Integer songId);

    /**
     * 获取今日热榜
     * @param limit 限制数量
     * @return 热榜歌曲列表
     */
    java.util.List<SongLike> getTodayHotSongs(Integer limit);

    /**
     * 获取总热榜
     * @param limit 限制数量
     * @return 热榜歌曲列表
     */
    java.util.List<SongLike> getTotalHotSongs(Integer limit);

    /**
     * 重置今日点赞数
     */
    void resetTodayLikes();

    /**
     * 清空指定歌曲的点赞数
     * @param songId 歌曲ID
     */
    void resetLikesBySongId(Integer songId);

    Page<Map<String, Object>> getTodayHotSongsWithSongInfo(Integer pageNo, Integer pageSize, Integer singerId);
    Page<Map<String, Object>> getTotalHotSongsWithSongInfo(Integer pageNo, Integer pageSize, Integer singerId);

    List<Map<String, Object>> getTodayHotSongsWithSongInfo(Integer limit, Integer singerId);

    List<Map<String, Object>> getTotalHotSongsWithSongInfo(Integer limit, Integer singerId);
}