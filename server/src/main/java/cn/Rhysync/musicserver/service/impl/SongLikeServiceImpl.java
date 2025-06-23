package cn.Rhysync.musicserver.service.impl;

import cn.Rhysync.musicserver.domain.entity.Song;
import cn.Rhysync.musicserver.domain.entity.SongLike;
import cn.Rhysync.musicserver.mapper.SongLikeMapper;
import cn.Rhysync.musicserver.service.ISongLikeService;
import cn.Rhysync.musicserver.service.ISongService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 歌曲点赞统计 服务实现类
 * </p>
 *
 * @author kgc
 * @since 2025-06-22
 */
@Service
@RequiredArgsConstructor
public class SongLikeServiceImpl extends ServiceImpl<SongLikeMapper, SongLike> implements ISongLikeService {

    private final ISongService songService;

    @Override
    public boolean likeSong(Integer songId, boolean isLike) {
        System.out.println("开始" + (isLike ? "点赞" : "取消点赞") + "歌曲，ID: " + songId);
        try {
            // 查找或创建点赞记录
            SongLike songLike = getSongLike(songId);
            if (songLike == null) {
                // 如果不存在，创建新记录
                songLike = new SongLike();
                songLike.setSongId(songId);
                songLike.setTodayLikes(0);
                songLike.setTotalLikes(0);
                songLike.setCreateTime(LocalDateTime.now());
            }
            
            songLike.setUpdateTime(LocalDateTime.now());
            
            System.out.println("操作前 - 今日点赞数: " + songLike.getTodayLikes() + ", 总点赞数: " + songLike.getTotalLikes());
            
            // 根据操作类型增减点赞数
            if (isLike) {
                // 点赞：增加点赞数
                songLike.setTodayLikes(songLike.getTodayLikes() + 1);
                songLike.setTotalLikes(songLike.getTotalLikes() + 1);
            } else {
                // 取消点赞：减少点赞数，但不低于0
                songLike.setTodayLikes(Math.max(0, songLike.getTodayLikes() - 1));
                songLike.setTotalLikes(Math.max(0, songLike.getTotalLikes() - 1));
            }
            
            System.out.println("操作后 - 今日点赞数: " + songLike.getTodayLikes() + ", 总点赞数: " + songLike.getTotalLikes());
            
            boolean result = this.saveOrUpdate(songLike);
            System.out.println("更新结果: " + result);
            return result;
        } catch (Exception e) {
            System.err.println("点赞操作过程中发生异常: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public SongLike getSongLike(Integer songId) {
        QueryWrapper<SongLike> wrapper = new QueryWrapper<>();
        wrapper.eq("song_id", songId);
        return this.getOne(wrapper);
    }

    @Override
    public List<SongLike> getTodayHotSongs(Integer limit) {
        QueryWrapper<SongLike> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("today_likes");
        wrapper.last("LIMIT " + limit);
        return this.list(wrapper);
    }

    @Override
    public List<SongLike> getTotalHotSongs(Integer limit) {
        QueryWrapper<SongLike> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("total_likes");
        wrapper.last("LIMIT " + limit);
        return this.list(wrapper);
    }

    @Override
    @Scheduled(cron = "0 0 0 * * ?")
    public void resetTodayLikes() {
        QueryWrapper<SongLike> wrapper = new QueryWrapper<>();
        wrapper.gt("today_likes", 0);
        List<SongLike> songLikes = this.list(wrapper);
        
        for (SongLike songLike : songLikes) {
            songLike.setTodayLikes(0);
            songLike.setUpdateTime(LocalDateTime.now());
            this.updateById(songLike);
        }
        
        System.out.println("今日点赞数已重置，共重置 " + songLikes.size() + " 首歌曲");
    }

    @Override
    public Page<Map<String, Object>> getTodayHotSongsWithSongInfo(Integer pageNo, Integer pageSize, Integer singerId) {
        QueryWrapper<SongLike> wrapper = new QueryWrapper<>();
        if (singerId != null) {
            List<Integer> songIds = songService.lambdaQuery().eq(Song::getSingerId, singerId).list()
                .stream().map(Song::getId).toList();
            if (songIds.isEmpty()) return new Page<>(pageNo, pageSize, 0);
            wrapper.in("song_id", songIds);
        }
        wrapper.orderByDesc("today_likes");
        Page<SongLike> page = new Page<>(pageNo, pageSize);
        Page<SongLike> songLikePage = this.page(page, wrapper);
        List<Map<String, Object>> records = buildSongInfoList(songLikePage.getRecords());
        Page<Map<String, Object>> resultPage = new Page<>(pageNo, pageSize, songLikePage.getTotal());
        resultPage.setRecords(records);
        return resultPage;
    }

    @Override
    public Page<Map<String, Object>> getTotalHotSongsWithSongInfo(Integer pageNo, Integer pageSize, Integer singerId) {
        QueryWrapper<SongLike> wrapper = new QueryWrapper<>();
        if (singerId != null) {
            List<Integer> songIds = songService.lambdaQuery().eq(Song::getSingerId, singerId).list()
                .stream().map(Song::getId).toList();
            if (songIds.isEmpty()) return new Page<>(pageNo, pageSize, 0);
            wrapper.in("song_id", songIds);
        }
        wrapper.orderByDesc("total_likes");
        Page<SongLike> page = new Page<>(pageNo, pageSize);
        Page<SongLike> songLikePage = this.page(page, wrapper);
        List<Map<String, Object>> records = buildSongInfoList(songLikePage.getRecords());
        Page<Map<String, Object>> resultPage = new Page<>(pageNo, pageSize, songLikePage.getTotal());
        resultPage.setRecords(records);
        return resultPage;
    }

    @Override
    public void resetLikesBySongId(Integer songId) {
        SongLike songLike = getSongLike(songId);
        if (songLike != null) {
            songLike.setTodayLikes(0);
            songLike.setTotalLikes(0);
            songLike.setUpdateTime(LocalDateTime.now());
            this.updateById(songLike);
        }
    }

    /**
     * 构建带歌曲信息的热榜列表
     */
    private List<Map<String, Object>> buildSongInfoList(List<SongLike> songLikes) {
        List<Map<String, Object>> result = new ArrayList<>();
        
        for (SongLike songLike : songLikes) {
            Map<String, Object> songInfo = new HashMap<>();
            
            // 获取歌曲信息
            Song song = songService.getById(songLike.getSongId());
            if (song != null) {
                songInfo.put("id", song.getId());
                songInfo.put("name", song.getName());
                songInfo.put("singerId", song.getSingerId());
                songInfo.put("pic", song.getPic());
                songInfo.put("url", song.getUrl());
                songInfo.put("lyric", song.getLyric());
                songInfo.put("createTime", song.getCreateTime());
            }
            
            // 添加点赞信息
            songInfo.put("todayLikes", songLike.getTodayLikes());
            songInfo.put("totalLikes", songLike.getTotalLikes());
            
            result.add(songInfo);
        }
        
        return result;
    }

    @Override
    public List<Map<String, Object>> getTodayHotSongsWithSongInfo(Integer limit, Integer singerId) {
        List<SongLike> songLikes;
        if (singerId != null) {
            // 先查出该歌手的所有歌曲ID
            List<Integer> songIds = songService.lambdaQuery().eq(Song::getSingerId, singerId).list()
                    .stream().map(Song::getId).toList();
            if (songIds.isEmpty()) return new ArrayList<>();
            songLikes = this.lambdaQuery()
                    .in(SongLike::getSongId, songIds)
                    .orderByDesc(SongLike::getTodayLikes)
                    .last("LIMIT " + limit)
                    .list();
        } else {
            songLikes = getTodayHotSongs(limit);
        }
        return buildSongInfoList(songLikes);
    }

    @Override
    public List<Map<String, Object>> getTotalHotSongsWithSongInfo(Integer limit, Integer singerId) {
        List<SongLike> songLikes;
        if (singerId != null) {
            List<Integer> songIds = songService.lambdaQuery().eq(Song::getSingerId, singerId).list()
                    .stream().map(Song::getId).toList();
            if (songIds.isEmpty()) return new ArrayList<>();
            songLikes = this.lambdaQuery()
                    .in(SongLike::getSongId, songIds)
                    .orderByDesc(SongLike::getTotalLikes)
                    .last("LIMIT " + limit)
                    .list();
        } else {
            songLikes = getTotalHotSongs(limit);
        }
        return buildSongInfoList(songLikes);
    }
} 