<template>
  <div class="hot-page">
    <el-card class="hot-card">
      <template #header>
        <div class="page-header">
          <h2>🎵 音乐热榜</h2>
          <p>发现最受欢迎的音乐</p>
        </div>
      </template>
      
      <HotSongs @play-song="handlePlaySong" />
    </el-card>
    
    <!-- 音乐播放器组件 -->
    <MusicPlayer :songs="songsList" :singers="singersMap" :autoPlay="true" />
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { baseURL } from '@/api/request'
import { getSongDetail } from '@/api/song'
import HotSongs from '@/components/HotSongs.vue'
import MusicPlayer from '@/components/MusicPlayer.vue'

// 歌曲列表
const songsList = ref([])

// 歌手映射表 {id: name}
const singersMap = ref({
  101: '歌手A',
  102: '歌手B'
})

// 处理热榜歌曲播放
const handlePlaySong = async (song) => {
  const { data } = await getSongDetail(song.id)
  data.url = baseURL + data.url
  data.pic = baseURL + data.pic
  songsList.value.unshift(data)
}
</script>

<style scoped>
.hot-page {
  padding: 20px;
  max-width: 1200px;
  margin: 0 auto;
}

.hot-card {
  margin-bottom: 20px;
}

.page-header {
  text-align: center;
  margin-bottom: 20px;
}

.page-header h2 {
  color: #333;
  margin-bottom: 8px;
  font-size: 28px;
}

.page-header p {
  color: #666;
  font-size: 16px;
  margin: 0;
}
</style>