package cn.Rhysync.musicserver.controller;

import cn.Rhysync.musicserver.domain.dto.LikeRequest;
import cn.Rhysync.musicserver.domain.dto.Result;
import cn.Rhysync.musicserver.domain.dto.ResultUtil;
import cn.Rhysync.musicserver.service.ISongLikeService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 歌曲点赞 前端控制器
 * </p>
 *
 * @author kgc
 * @since 2025-06-22
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/song-like")
public class SongLikeController {
    private final ISongLikeService songLikeService;

    /**
     * 点赞/取消点赞歌曲
     *
     * @param request 包含歌曲ID和操作类型的请求体
     * @return
     */
    @PostMapping("like")
    public Result likeSong(@RequestBody LikeRequest request) {
        try {
            System.out.println("SongLikeController接收到点赞请求，歌曲ID: " + request.getId() + ", 操作: " + (request.getIsLike() ? "点赞" : "取消点赞"));
            boolean success = songLikeService.likeSong(request.getId(), request.getIsLike());
            if (success) {
                String message = request.getIsLike() ? "点赞成功" : "取消点赞成功";
                return ResultUtil.returnSuccess(message);
            } else {
                String message = request.getIsLike() ? "点赞失败" : "取消点赞失败";
                return ResultUtil.returnFail(message);
            }
        } catch (Exception e) {
            System.err.println("SongLikeController层捕获到异常: " + e.getMessage());
            e.printStackTrace();
            return ResultUtil.returnFail("操作失败: " + e.getMessage());
        }
    }

    /**
     * 获取今日热榜（支持分页和按歌手筛选）
     */
    @GetMapping("today-hot")
    public Result getTodayHotSongs(
        @RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
        @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
        @RequestParam(value = "singerId", required = false) Integer singerId
    ) {
        return ResultUtil.returnDataSuccess(songLikeService.getTodayHotSongsWithSongInfo(pageNo, pageSize, singerId));
    }

    /**
     * 获取总热榜（支持分页和按歌手筛选）
     */
    @GetMapping("total-hot")
    public Result getTotalHotSongs(
        @RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
        @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
        @RequestParam(value = "singerId", required = false) Integer singerId
    ) {
        return ResultUtil.returnDataSuccess(songLikeService.getTotalHotSongsWithSongInfo(pageNo, pageSize, singerId));
    }

    /**
     * 获取单个歌曲的点赞统计
     *
     * @param songId 歌曲ID
     * @return
     */
    @GetMapping("{songId}")
    public Result getSongLike(@PathVariable Integer songId) {
        try {
            return ResultUtil.returnDataSuccess(songLikeService.getSongLike(songId));
        } catch (Exception e) {
            System.err.println("获取歌曲点赞统计失败: " + e.getMessage());
            e.printStackTrace();
            return ResultUtil.returnFail("获取点赞统计失败");
        }
    }

    /**
     * 清空指定歌曲的点赞数
     * @param songId 歌曲ID
     * @return
     */
    @PostMapping("reset-likes/{songId}")
    public Result resetSongLikes(@PathVariable Integer songId) {
        try {
            songLikeService.resetLikesBySongId(songId);
            return ResultUtil.returnSuccess("点赞数已清空");
        } catch (Exception e) {
            return ResultUtil.returnFail("清空点赞数失败: " + e.getMessage());
        }
    }
} 