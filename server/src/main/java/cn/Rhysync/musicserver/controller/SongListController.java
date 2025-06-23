package cn.Rhysync.musicserver.controller;

import cn.Rhysync.musicserver.domain.dto.AddSongToListDto;
import cn.Rhysync.musicserver.domain.dto.Result;
import cn.Rhysync.musicserver.domain.dto.ResultUtil;
import cn.Rhysync.musicserver.domain.dto.UpdateSongListSongsDto;
import cn.Rhysync.musicserver.domain.entity.ListSong;
import cn.Rhysync.musicserver.domain.entity.Song;
import cn.Rhysync.musicserver.domain.entity.SongList;
import cn.Rhysync.musicserver.service.IListSongService;
import cn.Rhysync.musicserver.service.ISongListService;
import cn.Rhysync.musicserver.service.ISongService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 歌单(SongList)表控制层
 *
 * @author Rhysync
 * @since 2025-06-22
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("songlist")
public class SongListController {
    /**
     * 服务对象
     */
    @Resource
    private ISongListService songListService;
    private final ISongService songService;
    private final IListSongService listSongService; // 注入中间表服务


    @GetMapping()
    public Result queryByPage(
            @RequestParam(value = "page", defaultValue = "1") int pageNo,
            @RequestParam(value = "size", defaultValue = "5") int size,
            @RequestParam(value = "search", required = false) String search
    ) {
        QueryWrapper<SongList> wrapper = new QueryWrapper<>();
        wrapper.like(StringUtils.isNotBlank(search), "title", search);
        wrapper.orderByDesc("id");
        IPage<SongList> page = new Page<>(pageNo, size);
        page = songListService.page(page, wrapper);
        return ResultUtil.returnDataSuccess(page);
    }

    @GetMapping("/{id}")
    public Result querySongByListAndPage(
            @PathVariable int id,
            @RequestParam(value = "page", defaultValue = "1") int pageNo,
            @RequestParam(value = "size", defaultValue = "5") int size,
            @RequestParam(value = "search", required = false) String search
    ) {
        IPage<Song> page = new Page<>(pageNo, size);
        LambdaQueryWrapper<Song> wrapper = new LambdaQueryWrapper<>();
        // 使用 inSql 子查询关联 list_song 表
        wrapper.inSql(Song::getId, "SELECT song_id FROM list_song WHERE song_list_id = " + id);
        wrapper.like(StringUtils.isNotBlank(search), Song::getName, search);
        wrapper.orderByDesc(Song::getId);
        page = songService.page(page, wrapper);

        return ResultUtil.returnDataSuccess(page);
    }


    @PostMapping
    public Result addSongList(@RequestBody SongList songList) {
        if (StringUtils.isBlank(songList.getTitle()) || StringUtils.isBlank(songList.getStyle())) {
            return ResultUtil.returnFail("歌单标题和风格不能为空");
        }
        boolean isSuccess = songListService.save(songList);
        return isSuccess ? ResultUtil.returnSuccess("新增歌单成功") : ResultUtil.returnFail("新增歌单失败");
    }


    @PutMapping
    public Result updateSongList(@RequestBody SongList songList) {
        if (songList.getId() == null) {
            return ResultUtil.returnFail("更新时必须提供歌单ID");
        }
        boolean isSuccess = songListService.updateById(songList);
        return isSuccess ? ResultUtil.returnSuccess("修改歌单成功") : ResultUtil.returnFail("修改歌单失败");
    }


    @DeleteMapping("/{id}")
    public Result deleteSongList(@PathVariable Integer id) {
        // 使用我们封装的事务方法
        boolean isSuccess = songListService.deleteSongListAndSongs(id);
        return isSuccess ? ResultUtil.returnSuccess("删除歌单成功") : ResultUtil.returnFail("删除歌单失败");
    }

    @PutMapping("/{songListId}/songs")
    public Result updateSongListSongs(
            @PathVariable Integer songListId,
            @RequestBody UpdateSongListSongsDto dto) {
        boolean success = songListService.updateSongsInList(songListId, dto.getSongsToAdd(), dto.getSongsToRemove());
        return success ? ResultUtil.returnSuccess("歌单歌曲更新成功") : ResultUtil.returnFail("歌单歌曲更新失败");
    }

    /**
     * 向歌单中添加一首歌曲
     */
    @PostMapping("/{songListId}/songs")
    public Result addSongToSongList(
            @PathVariable Integer songListId,
            @RequestBody AddSongToListDto dto
    ) {
        Integer songId = dto.getSongId();
        // 1. 检查歌曲和歌单是否存在 (可选但推荐)
        if (songService.getById(songId) == null) {
            return ResultUtil.returnFail("歌曲不存在");
        }
        if (songListService.getById(songListId) == null) {
            return ResultUtil.returnFail("歌单不存在");
        }

        // 2. 检查是否已存在关联
        QueryWrapper<ListSong> wrapper = new QueryWrapper<>();
        wrapper.eq("song_list_id", songListId).eq("song_id", songId);
        if (listSongService.count(wrapper) > 0) {
            return ResultUtil.returnFail("歌曲已存在于歌单中");
        }

        // 3. 添加关联
        ListSong listSong = new ListSong();
        listSong.setSongListId(songListId);
        listSong.setSongId(songId);
        boolean isSuccess = listSongService.save(listSong);

        return isSuccess ? ResultUtil.returnSuccess("添加成功") : ResultUtil.returnFail("添加失败");
    }

    /**
     * 从歌单中移除一首歌曲
     */
    @DeleteMapping("/{songListId}/songs/{songId}")
    public Result removeSongFromSongList(
            @PathVariable Integer songListId,
            @PathVariable Integer songId
    ) {
        QueryWrapper<ListSong> wrapper = new QueryWrapper<>();
        wrapper.eq("song_list_id", songListId).eq("song_id", songId);
        boolean isSuccess = listSongService.remove(wrapper);

        return isSuccess ? ResultUtil.returnSuccess("移除成功") : ResultUtil.returnFail("移除失败或歌曲本就不在歌单中");
    }
}