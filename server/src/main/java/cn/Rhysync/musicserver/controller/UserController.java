package cn.Rhysync.musicserver.controller;

import cn.Rhysync.musicserver.domain.dto.Result;
import cn.Rhysync.musicserver.domain.dto.ResultUtil;
import cn.Rhysync.musicserver.domain.entity.User;
import cn.Rhysync.musicserver.service.IUserService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
    private final IUserService userService;

    // 分页显示用户
    @GetMapping("/page")
    public Result getUserPage(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                              @RequestParam(value = "size", defaultValue = "10") int size,
                              @RequestParam(value = "search", required = false) String search) {
        IPage<User> page = new Page<>(pageNo, size);
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        if (search != null && !search.isEmpty()) {
            wrapper.like("username", search);
        }
        page = userService.page(page, wrapper);
        return ResultUtil.returnDataSuccess(page);
    }

    // 添加用户
    @PostMapping("/add")
    public Result addUser(@RequestBody User user) {
        boolean res = userService.save(user);
        if (res) {
            return ResultUtil.returnSuccess("添加成功");
        }
        return ResultUtil.returnFail("添加失败");
    }

    // 修改用户
    @PostMapping("/update")
    public Result updateUser(@RequestBody User user) {
        if (user.getId() == null) {
            return ResultUtil.returnFail("用户ID不能为空");
        }
        boolean res = userService.updateById(user);
        if (res) {
            return ResultUtil.returnSuccess("修改成功");
        }
        return ResultUtil.returnFail("修改失败");
    }

    // 删除用户
    @PostMapping("/delete")
    public Result deleteUser(@RequestBody Map<String, Integer> params) {
        Integer id = params.get("id");
        if (id == null) {
            return ResultUtil.returnFail("ID不能为空");
        }
        boolean res = userService.removeById(id);
        if (res) {
            return ResultUtil.returnSuccess("删除成功");
        }
        return ResultUtil.returnFail("删除失败");
    }
}