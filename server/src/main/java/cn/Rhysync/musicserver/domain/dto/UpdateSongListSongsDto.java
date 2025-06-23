package cn.Rhysync.musicserver.domain.dto;

import lombok.Data;
import java.util.List;

/**
 * 更新歌单歌曲的数据传输对象
 */
@Data
public class UpdateSongListSongsDto {
    /**
     * 需要添加到歌单的歌曲ID列表
     */
    private List<Integer> songsToAdd;

    /**
     * 需要从歌单移除的歌曲ID列表
     */
    private List<Integer> songsToRemove;
}