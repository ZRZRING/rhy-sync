package cn.Rhysync.musicserver.domain.entity;

import java.io.Serializable;

/**
 * 歌单(SongList)实体类
 *
 * @author makejava
 * @since 2025-06-22 08:43:44
 */
public class SongList implements Serializable {
    private static final long serialVersionUID = -64653536665545704L;
    /**
     * 主键
     */
    private Integer id;
    /**
     * 标题
     */
    private String title;
    /**
     * 歌单图片
     */
    private String pic;
    /**
     * 简介
     */
    private String introduction;
    /**
     * 风格
     */
    private String style;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

}

