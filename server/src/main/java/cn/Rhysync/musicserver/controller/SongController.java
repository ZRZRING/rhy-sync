package cn.Rhysync.musicserver.controller;

import cn.Rhysync.musicserver.domain.dto.Result;
import cn.Rhysync.musicserver.domain.dto.ResultUtil;
import cn.Rhysync.musicserver.domain.entity.Song;
import cn.Rhysync.musicserver.service.ISongService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Map;

/**
 * <p>
 * 歌曲 前端控制器
 * </p>
 *
 * @author kgc
 * @since 2025-06-18
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/song")
public class SongController {
    private final ISongService songService;

    /**
     * 分页歌曲
     * @param pageNo
     * @param size
     * @return
     */
    @GetMapping("page")
    public Result getSongPage(
            @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
            @RequestParam(value = "size", defaultValue = "5") int size,
            @RequestParam(value = "search", required = false)String search) {
        System.out.println("pageNo---:"+pageNo);
        QueryWrapper<Song> wrapper = new QueryWrapper<>();
        wrapper.like(search != null, "name", search);
        // 修改为按ID正序排列
        wrapper.orderByAsc("id");  // 改为正序
        IPage<Song> page = new Page<>(pageNo, size);
        page = songService.page(page,wrapper);
        return ResultUtil.returnDataSuccess(page);
    }

    /**
     * 歌曲详情
     * @param id
     * @return
     */
    @GetMapping("detail")
    public Result getSongDetail(Integer id){
        if (id == null) {
            return ResultUtil.returnFail("ID不能为空");
        }
        Song song = songService.getById(id);
        if (song == null) {
            return ResultUtil.returnFail("歌曲不存在");
        }
        return ResultUtil.returnDataSuccess(song);
    }

    /**
     * 添加歌曲
     * @param song
     * @return
     */
    @PostMapping("add")
    public Result addSong(@RequestBody Song song) {
        // 数据验证
        if (song.getName() == null || song.getName().trim().isEmpty()) {
            return ResultUtil.returnFail("歌曲名称不能为空");
        }
        if (song.getSingerId() == null) {
            return ResultUtil.returnFail("歌手ID不能为空");
        }

        // 自动设置时间
        LocalDateTime now = LocalDateTime.now();
        song.setCreateTime(now);
        song.setUpdateTime(now);

        boolean success = songService.save(song);
        if (success) {
            return ResultUtil.returnSuccess("添加成功");
        } else {
            return ResultUtil.returnFail("添加失败");
        }
    }

    @PostMapping("update")
    public Result updateSong(@RequestBody Song song) {
        // 数据验证
        if (song.getId() == null) {
            return ResultUtil.returnFail("歌曲ID不能为空");
        }
        if (song.getName() == null || song.getName().trim().isEmpty()) {
            return ResultUtil.returnFail("歌曲名称不能为空");
        }
        if (song.getSingerId() == null) {
            return ResultUtil.returnFail("歌手ID不能为空");
        }

        // 自动设置更新时间
        song.setUpdateTime(LocalDateTime.now());

        boolean success = songService.updateById(song);
        if (success) {
            return ResultUtil.returnSuccess("编辑成功");
        } else {
            return ResultUtil.returnFail("编辑失败");
        }
    }

    /**
     * 删除歌曲
     * @param params
     * @return
     */
    @PostMapping("delete")
    public Result deleteSong(@RequestBody Map<String, Integer> params) {
        Integer id = params.get("id");
        if (id == null) {
            return ResultUtil.returnFail("ID不能为空");
        }

        // 检查歌曲是否存在
        Song existingSong = songService.getById(id);
        if (existingSong == null) {
            return ResultUtil.returnFail("歌曲不存在");
        }

        boolean success = songService.removeById(id);
        if (success) {
            return ResultUtil.returnSuccess("删除成功");
        } else {
            return ResultUtil.returnFail("删除失败");
        }
    }

    @GetMapping("del")
    public Result delSong(Integer id){
        if (id == null) {
            return ResultUtil.returnFail("ID不能为空");
        }

        // 检查歌曲是否存在
        Song existingSong = songService.getById(id);
        if (existingSong == null) {
            return ResultUtil.returnFail("歌曲不存在");
        }

        boolean b = songService.removeById(id);
        if(!b){
            return ResultUtil.returnFail("删除失败");
        }
        return ResultUtil.returnSuccess("删除成功");
    }
}