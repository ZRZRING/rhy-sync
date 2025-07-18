package cn.Rhysync.musicserver.controller;

import cn.hutool.core.util.ObjUtil;
import cn.Rhysync.musicserver.domain.dto.Result;
import cn.Rhysync.musicserver.domain.dto.ResultEnum;
import cn.Rhysync.musicserver.domain.dto.ResultUtil;
import cn.Rhysync.musicserver.domain.entity.Singer;
import cn.Rhysync.musicserver.service.FileStorageService;
import cn.Rhysync.musicserver.service.ISingerService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 歌手 前端控制器
 * </p>
 *
 * @author kgc
 * @since 2025-06-18
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/singer")
public class SingerController {
    private final ISingerService singerService;
    private final FileStorageService fileStorageService;

    /**
     * 获取歌手列表
     */
    @RequestMapping("page")
    public Result getSingerPage(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                @RequestParam(value = "size", defaultValue = "5") int size,
                                @RequestParam(value = "search", required = false) String search) {
        IPage<Singer> page = new Page<>(pageNo, size);
        page = singerService.page(page, search != null ? new QueryWrapper<Singer>().like("name", search) : null);
        return ResultUtil.returnDataSuccess(page);
    }

    /**
     * 获取歌手详情
     */
    @RequestMapping("detail")
    public Result getSingerDetail(Integer id) {
        Singer singer = singerService.getById(id);
        if(ObjUtil.isNull(singer)) {
            return ResultUtil.returnResult(ResultEnum.FAIL_PARAM);
        }
        return ResultUtil.returnDataSuccess(singer);
    }

    /**
     * 添加歌手
     */
    @PostMapping("add")
    public Result addSinger(@RequestBody Singer singer) {
        boolean res = singerService.save(singer);
        if(!res){
            return ResultUtil.returnFail("添加失败");
        }
        return ResultUtil.returnSuccess("添加成功");
    }

    /**
     * 编辑歌手
     */
    @PostMapping("update")
    public Result updateSinger(@RequestBody Singer singer) {
        if (singer.getId() == null) {
            return ResultUtil.returnFail("歌手ID不能为空");
        }
        boolean res = singerService.updateById(singer);
        if(!res){
            return ResultUtil.returnFail("编辑失败");
        }
        return ResultUtil.returnSuccess("编辑成功");
    }

    /**
     * 删除歌手
     */
    @PostMapping("delete")
    public Result deleteSinger(@RequestBody Map<String, Integer> params) {
        Integer id = params.get("id");
        if (id == null) {
            return ResultUtil.returnFail("ID不能为空");
        }
        boolean res = singerService.removeById(id);
        if (!res) {
            return ResultUtil.returnFail("删除失败");
        }
        return ResultUtil.returnSuccess("删除成功");
    }

    /**
     * 上传文件
     */
    @PostMapping("/upload")
    public Result uploadFile(@RequestParam("file") MultipartFile file) {
        Map<String, String> response = new HashMap<>();
        try {
            //本地
            String fileName = fileStorageService.storeFile(file);
            return ResultUtil.returnDataSuccess( "/img/singerPic/" + fileName);
        } catch (IOException e) {
            return ResultUtil.returnFail(e.getMessage());
        }
    }
}