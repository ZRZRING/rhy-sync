package cn.Rhysync.musicserver.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 歌单-歌曲关联表(ListSong)实体类
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("list_song") // 确保表名与数据库一致
public class ListSong implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Integer id;

    /**
     * 歌曲ID
     */
    private Integer songId;

    /**
     * 歌单ID
     */
    private Integer songListId;
}