package cn.Rhysync.musicserver.domain.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 歌曲点赞统计
 * </p>
 *
 * @author kgc
 * @since 2025-06-22
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("song_like")
public class SongLike implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 歌曲ID
     */
    @TableField("song_id")
    private Integer songId;

    /**
     * 今日点赞数
     */
    @TableField("today_likes")
    private Integer todayLikes;

    /**
     * 总点赞数
     */
    @TableField("total_likes")
    private Integer totalLikes;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField("update_time")
    private LocalDateTime updateTime;
} 