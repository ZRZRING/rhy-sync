<template>
  <div class="hot-songs">
    <div class="filter-bar" style="margin-bottom: 16px; display: flex; align-items: center; gap: 12px;">
      <el-select v-model="selectedSinger" placeholder="按歌手筛选" clearable filterable style="width: 200px" @change="handleSingerChange">
        <el-option v-for="singer in singerList" :key="singer.id" :label="singer.name" :value="singer.id" />
      </el-select>
    </div>
    <el-tabs v-model="activeTab" @tab-click="handleTabClick">
      <el-tab-pane label="今日热榜" name="today">
        <div class="hot-list">
          <div 
            v-for="(song, index) in todayHotSongs" 
            :key="song.id" 
            class="hot-item"
            @click="playSong(song)"
          >
            <div class="rank" :class="getRankClass(index + 1)">{{ index + 1 }}</div>
            <div class="song-info">
              <div class="song-name">{{ song.name }}</div>
              <div class="song-likes">点赞: {{ song.todayLikes || 0 }}</div>
            </div>
            <div class="like-btn" @click.stop="handleLike(song)">
              <el-button 
                type="danger"
                size="small" 
                circle
                title="点赞"
              >
                <el-icon>
                  <StarFilled v-if="isLiked(song.id)" />
                  <Star v-else />
                </el-icon>
              </el-button>
            </div>
            <div class="like-btn" @click.stop="handleResetLikes(song)">
              <el-button 
                type="warning"
                size="small"
                circle
                title="清空点赞数"
              >
                <el-icon>
                  <i class="el-icon-delete">
                    <Delete />
                  </i>
                </el-icon>
              </el-button>
            </div>
          </div>
        </div>
        <el-pagination
          background
          layout="prev, pager, next"
          :total="todayTotal"
          :page-size="pageSize"
          :current-page="pageNo"
          @current-change="handlePageChange"
        />
      </el-tab-pane>
      
      <el-tab-pane label="总热榜" name="total">
        <div class="hot-list">
          <div 
            v-for="(song, index) in totalHotSongs" 
            :key="song.id" 
            class="hot-item"
            @click="playSong(song)"
          >
            <div class="rank" :class="getRankClass(index + 1)">{{ index + 1 }}</div>
            <div class="song-info">
              <div class="song-name">{{ song.name }}</div>
              <div class="song-likes">总点赞: {{ song.totalLikes || 0 }}</div>
            </div>
            <div class="like-btn" @click.stop="handleLike(song)">
              <el-button 
                type="danger"
                size="small" 
                circle
                title="点赞"
              >
                <el-icon>
                  <StarFilled v-if="isLiked(song.id)" />
                  <Star v-else />
                </el-icon>
              </el-button>
            </div>
            <div class="like-btn" @click.stop="handleResetLikes(song)">
              <el-button 
                type="warning"
                size="small"
                circle
                title="清空点赞数"
              >
                <el-icon>
                  <i class="el-icon-delete">
                    <Delete />
                  </i>
                </el-icon>
              </el-button>
            </div>
          </div>
        </div>
        <el-pagination
          background
          layout="prev, pager, next"
          :total="totalTotal"
          :page-size="pageSize"
          :current-page="pageNo"
          @current-change="handlePageChange"
        />
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { Delete, Star, StarFilled } from '@element-plus/icons-vue'
import { getTodayHotSongs, getTotalHotSongs, likeSong, resetSongLikes } from '@/api/song'
import { getSingerList } from '@/api/singer'

const activeTab = ref('today')
const todayHotSongs = ref([])
const totalHotSongs = ref([])
const singerList = ref([])
const selectedSinger = ref(null)
// 存储已点赞的歌曲ID
const likedSongs = ref(new Set())
const pageNo = ref(1)
const pageSize = ref(10)
const todayTotal = ref(0)
const totalTotal = ref(0)

// 获取歌手列表
const loadSingerList = async () => {
  try {
    const { data } = await getSingerList({ size: 100 })
    singerList.value = data?.records || data || []
  } catch (error) {
    ElMessage.error('获取歌手列表失败')
  }
}

// 检查歌曲是否已点赞
const isLiked = (songId) => {
  return likedSongs.value.has(songId)
}

// 获取今日热榜
const loadTodayHotSongs = async () => {
  try {
    const params = { pageNo: pageNo.value, pageSize: pageSize.value }
    if (selectedSinger.value) params.singerId = selectedSinger.value
    const { data } = await getTodayHotSongs(params)
    todayHotSongs.value = data.records || data || []
    todayTotal.value = data.total || 0
  } catch (error) {
    console.error('获取今日热榜失败:', error)
    ElMessage.error('获取今日热榜失败')
  }
}

// 获取总热榜
const loadTotalHotSongs = async () => {
  try {
    const params = { pageNo: pageNo.value, pageSize: pageSize.value }
    if (selectedSinger.value) params.singerId = selectedSinger.value
    const { data } = await getTotalHotSongs(params)
    totalHotSongs.value = data.records || data || []
    totalTotal.value = data.total || 0
  } catch (error) {
    console.error('获取总热榜失败:', error)
    ElMessage.error('获取总热榜失败')
  }
}

// 歌手筛选变化
const handleSingerChange = () => {
  if (activeTab.value === 'today') {
    loadTodayHotSongs()
  } else {
    loadTotalHotSongs()
  }
}

// 处理点赞
const handleLike = async (song) => {
  try {
    const isCurrentlyLiked = likedSongs.value.has(song.id)
    const isLike = !isCurrentlyLiked // 如果当前已点赞，则取消点赞；否则点赞
    
    await likeSong(song.id, isLike)
    
    // 切换点赞状态
    if (isCurrentlyLiked) {
      likedSongs.value.delete(song.id)
      ElMessage.success('取消点赞')
    } else {
      likedSongs.value.add(song.id)
      ElMessage.success('点赞成功')
    }
    
    // 重新加载数据
    if (activeTab.value === 'today') {
      loadTodayHotSongs()
    } else {
      loadTotalHotSongs()
    }
  } catch (error) {
    console.error('点赞操作失败:', error)
    ElMessage.error('操作失败')
  }
}

// 清空点赞数
const handleResetLikes = async (song) => {
  try {
    await resetSongLikes(song.id)
    ElMessage.success('点赞数已清空')
    if (activeTab.value === 'today') {
      loadTodayHotSongs()
    } else {
      loadTotalHotSongs()
    }
  } catch (error) {
    ElMessage.error('清空点赞数失败')
  }
}

// 播放歌曲
const playSong = (song) => {
  // 触发父组件的播放事件
  emit('play-song', song)
}

// 获取排名样式
const getRankClass = (rank) => {
  if (rank === 1) return 'rank-1'
  if (rank === 2) return 'rank-2'
  if (rank === 3) return 'rank-3'
  return 'rank-normal'
}

// 标签页切换
const handleTabClick = () => {
  if (activeTab.value === 'today') {
    loadTodayHotSongs()
  } else {
    loadTotalHotSongs()
  }
}

const handlePageChange = (newPage) => {
  pageNo.value = newPage
  if (activeTab.value === 'today') {
    loadTodayHotSongs()
  } else {
    loadTotalHotSongs()
  }
}

// 定义事件
const emit = defineEmits(['play-song'])

onMounted(() => {
  loadSingerList()
  loadTodayHotSongs()
})
</script>

<style scoped>
.hot-songs {
  padding: 20px;
}

.hot-list {
  margin-top: 20px;
}

.hot-item {
  display: flex;
  align-items: center;
  padding: 12px;
  margin-bottom: 8px;
  border-radius: 8px;
  background: #f8f9fa;
  cursor: pointer;
  transition: all 0.3s ease;
}

.hot-item:hover {
  background: #e9ecef;
  transform: translateX(5px);
}

.rank {
  width: 30px;
  height: 30px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  margin-right: 15px;
  color: white;
}

.rank-1 {
  background: linear-gradient(45deg, #ff6b6b, #ff8e8e);
}

.rank-2 {
  background: linear-gradient(45deg, #4ecdc4, #6ee7df);
}

.rank-3 {
  background: linear-gradient(45deg, #45b7d1, #67c7e0);
}

.rank-normal {
  background: #6c757d;
}

.song-info {
  flex: 1;
}

.song-name {
  font-size: 16px;
  font-weight: 500;
  color: #333;
  margin-bottom: 4px;
}

.song-likes {
  font-size: 12px;
  color: #666;
}

.like-btn {
  margin-left: 10px;
}
</style>
