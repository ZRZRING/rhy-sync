package cn.Rhysync.musicserver.mapper;

import cn.Rhysync.musicserver.domain.entity.SongLike;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 歌曲点赞统计 Mapper 接口
 * </p>
 *
 * @author kgc
 * @since 2025-06-22
 */
@Mapper
public interface SongLikeMapper extends BaseMapper<SongLike> {

} 