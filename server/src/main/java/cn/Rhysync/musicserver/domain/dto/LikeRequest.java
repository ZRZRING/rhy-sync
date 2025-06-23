package cn.Rhysync.musicserver.domain.dto;

import lombok.Data;

/**
 * 点赞请求DTO
 */
@Data
public class LikeRequest {
    private Integer id;
    private Boolean isLike = true; // true为点赞，false为取消点赞，默认为true
}