package cn.Rhysync.musicserver.domain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("consumer")
public class User {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String username;
    private String password;
    private Integer sex;
    private String phone_num;
    private String email;
    private java.util.Date birth;
    private String introduction;
    private String location;
    private String avator;
    private java.util.Date create_time;
    private java.util.Date update_time;
}
