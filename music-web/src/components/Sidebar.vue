<script>

import { ref } from 'vue'
// 导入图标
import { Headset, VideoPlay, VideoCamera, ArrowDown } from '@element-plus/icons-vue'
</script>

<template>
  <div class="logo"></div>
  <el-menu active-text-color="#ffd04b" background-color="#545c64" class="el-menu-vertical-demo"
    :default-active="$route.path" text-color="#fff" :router="true">
    <el-sub-menu index="">
      <template #title>
        <el-icon>
          <Headset />
        </el-icon>
        <span>音频视频</span>
      </template>
      <el-menu-item index="/song">
        <el-icon>
          <VideoPlay />
        </el-icon>
        <span>音频管理</span>
      </el-menu-item>
    </el-sub-menu>
    <el-menu-item index="/songlist">
      <el-icon>
        <VideoPlay />
      </el-icon>
      <span>歌单管理</span>
    </el-menu-item>
  </el-menu>
</template>