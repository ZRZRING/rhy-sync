create table if not exists admin
(
    id       int auto_increment comment '主键'
        primary key,
    name     varchar(255) null comment '账号',
    password varchar(255) null comment '密码'
)
    comment '管理员' charset = utf8mb3;

create table if not exists collect
(
    id           int auto_increment comment '主键'
        primary key,
    user_id      int        null comment '用户id',
    type         tinyint(1) null comment '收藏类型（0歌曲1歌单）',
    song_id      int        null comment '歌曲id',
    song_list_id int        null comment '歌单id',
    create_time  datetime   null comment '收藏时间'
)
    comment '收藏' charset = utf8mb3;

create table if not exists comment
(
    id           int auto_increment comment '主键'
        primary key,
    user_id      int           null comment '用户id',
    type         tinyint(1)    null comment '评论类型（0歌曲1歌单）',
    song_id      int           null comment '歌曲id',
    song_list_id int           null comment '歌单id',
    content      varchar(255)  null comment '评论内容',
    create_time  datetime      null comment '收藏时间',
    up           int default 0 null comment '评论点赞数'
)
    comment '评论' charset = utf8mb3;

create table if not exists consumer
(
    id           int auto_increment comment '主键'
        primary key,
    username     varchar(255) null comment '账号',
    password     varchar(255) null comment '密码',
    sex          tinyint(1)   null comment '性别（1男0女）',
    phone_num    char(15)     null comment '电话',
    email        char(30)     null comment '邮箱',
    birth        datetime     null comment '生日',
    introduction varchar(255) null comment '签名',
    location     varchar(255) null comment '地区',
    avator       varchar(255) null comment '头像',
    create_time  datetime     null comment '创建时间',
    update_time  datetime     null comment '更新时间'
)
    comment '前端用户' charset = utf8mb3;

create table if not exists fenlei
(
    id         int auto_increment
        primary key,
    fenleiname varchar(200) not null
);

create table if not exists flguanlian
(
    id     int auto_increment
        primary key,
    lbId   int not null,
    songid int not null
);

create table if not exists list_song
(
    id           int auto_increment comment '主键'
        primary key,
    song_id      int null comment '歌曲id',
    song_list_id int null comment '歌单id'
)
    comment '歌单包含歌曲列表' charset = utf8mb3;

create table if not exists rank_type
(
    id          int auto_increment
        primary key,
    name        varchar(50)  not null comment '榜单类型名称',
    description varchar(255) null comment '描述'
);

create table if not exists `rank`
(
    id           int auto_increment comment '主键'
        primary key,
    song_list_id int           not null comment '歌单id',
    consumer_id  int           not null comment '用户id',
    score        int           null comment '评分',
    type_id      int default 1 not null comment '榜单类型ID',
    period varchar (20) default 'current' not null comment '榜单期数',
    constraint consumer_id
        unique (song_list_id, consumer_id),
    constraint fk_rank_type
        foreign key (type_id) references rank_type (id)
)
    comment '评价' charset = utf8mb3;

create table if not exists region
(
    id   int auto_increment comment '区域id'
        primary key,
    name varchar(255) not null comment '区域名称'
);

create table if not exists singer
(
    id           int auto_increment comment '主键'
        primary key,
    name         varchar(255) null comment '姓名',
    sex          tinyint(1)   null comment '性别（0女1男2组合3不明）',
    pic          varchar(255) null comment '头像',
    birth        datetime     null comment '生日',
    location     varchar(255) null comment '地区',
    introduction varchar(255) null comment '简介'
)
    comment '歌手' charset = utf8mb3;

create table if not exists song
(
    id           int auto_increment comment '主键'
        primary key,
    singer_id    int           null comment '歌手id',
    name         varchar(255)  null comment '革命',
    introduction varchar(255)  null comment '简介',
    create_time  datetime      null comment '创建时间',
    update_time  datetime      null comment '更新时间',
    pic          varchar(255)  null comment '歌曲图片',
    lyric        text          null comment '歌词',
    url          varchar(255)  null comment '歌曲地址',
    like_count   int default 0 null comment '点赞数',
    play_count   int default 0 null comment '播放次数',
    today_likes  int default 0 null comment '今日点赞数',
    total_likes  int default 0 null comment '总点赞数',
    region_id    int           null comment '地区ID',
    constraint fk_song_region
        foreign key (region_id) references region (id)
)
    comment '歌曲' charset = utf8mb3;

create index idx_song_today_likes
    on song (today_likes desc);

create index idx_song_total_likes
    on song (total_likes desc);

create table if not exists song_like
(
    id          int auto_increment comment '主键'
        primary key,
    song_id     int                                not null comment '歌曲ID',
    today_likes int      default 0                 null comment '今日点赞数',
    total_likes int      default 0                 null comment '总点赞数',
    create_time datetime default CURRENT_TIMESTAMP null comment '创建时间',
    update_time datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    constraint uk_song_id
        unique (song_id)
)
    comment '歌曲点赞统计表';

create index idx_today_likes
    on song_like (today_likes desc);

create index idx_total_likes
    on song_like (total_likes desc);

create table if not exists song_list
(
    id           int auto_increment comment '主键'
        primary key,
    title        varchar(255) null comment '标题',
    pic          varchar(255) null comment '歌单图片',
    introduction text         null comment '简介',
    style        varchar(255) null comment '风格'
)
    comment '歌单' charset = utf8mb3;

create table if not exists song_type
(
    id        int auto_increment comment '音乐类型id'
        primary key,
    type_name varchar(50)  not null comment '类型',
    img       varchar(200) not null comment '类型图片'
);

create table if not exists title
(
    id   int auto_increment comment '标题id'
        primary key,
    name varchar(50) not null comment '标题名字'
);

create table if not exists type_song
(
    id      int auto_increment comment 'id'
        primary key,
    song_id int null comment '歌曲id',
    type_id int null comment '类型id'
);

create table if not exists type_title
(
    id       int comment 'id',
    title_id int not null comment '标题id',
    type_id  int not null comment '类型id'
);

create index id
    on type_title (id);

alter table type_title
    modify id int auto_increment comment 'id';

create table if not exists vedio
(
    id           int auto_increment comment '视频id'
        primary key,
    v_name       varchar(200) not null comment '视频名称',
    v_author     varchar(200) not null comment '作者',
    v_playback   int          not null comment '播放量',
    v_createtime date         not null comment '创建时间',
    v_img        varchar(200) not null comment '视频图片',
    v_url        varchar(255) not null comment '视频地址',
    regionid     int          not null comment '区域id',
    versionid    int          not null comment '版本id'
);

create table if not exists version
(
    id   int auto_increment comment '版本id'
        primary key,
    name varchar(255) not null comment '版本名称'
);

