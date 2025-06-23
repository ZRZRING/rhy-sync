<script setup>
import { ref, reactive, onMounted, computed } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage, ElMessageBox } from 'element-plus'
import { getSingerList, getSingerDetail, addSinger, updateSinger, deleteSinger } from '@/api/singer'
import { getSongList, getSongDetail } from '@/api/song'
import { baseURL } from '@/api/request'
import { formatDate } from '@/utils/format'
import MusicPlayer from '@/components/MusicPlayer.vue'

const router = useRouter()

// 响应式数据
const singersByRegion = ref({})
const dialogVisible = ref(false)
const dialogTitle = ref('添加歌手')
const isEdit = ref(false)
const currentSingerId = ref(null)
const loading = ref(false)

// 抽屉相关
const drawerVisible = ref(false)
const currentSingerName = ref('')
const singerSongs = ref([])
const songsLoading = ref(false)
const songsTotal = ref(0)
const songsQueryParams = ref({
  pageNo: 1,
  size: 10,
  search: ''
})

// 播放相关
const songsList = ref([])
const singersMap = ref({})

const singerForm = reactive({
  name: '',
  sex: 0,
  location: '',
  birth: '',
  pic: '',
  introduction: ''
})

const rules = {
  name: [{ required: true, message: '请输入歌手姓名', trigger: 'blur' }],
  sex: [{ required: true, message: '请选择性别', trigger: 'change' }],
  location: [{ required: true, message: '请输入地区', trigger: 'blur' }]
}

// 判断是否为中国的地区
const isChineseRegion = (location) => {
  if (!location) return false
  
  // 中国主要城市和地区
  const chineseRegions = [
    '中国', '北京', '上海', '广州', '深圳', '杭州', '南京', '成都', '重庆',
    '武汉', '西安', '天津', '苏州', '青岛', '大连', '厦门', '宁波', '无锡',
    '长沙', '郑州', '济南', '哈尔滨', '沈阳', '长春', '石家庄', '太原',
    '呼和浩特', '合肥', '福州', '南昌', '南宁', '海口', '贵阳', '昆明',
    '兰州', '西宁', '银川', '乌鲁木齐', '拉萨', '台湾', '香港', '澳门'
  ]
  
  return chineseRegions.some(region => location.includes(region))
}

// 获取歌手列表
const fetchSingers = async () => {
  loading.value = true
  try {
    // 只用getSingerList
    const response = await getSingerList({
      pageNo: 1,
      size: 1000, // 设置一个较大的值来获取所有数据
      search: ''
    })
    console.log('getSingerList API响应:', response)
    
    // 适配后端返回格式：code可能是"0"或0
    if (response.code === 200 || response.code === "0" || response.code === 0) {
      // 兼容records和数组两种结构
      const singers = response.data?.records || response.data || []
      console.log('歌手数据:', singers)
      
      if (singers.length === 0) {
        singersByRegion.value = {}
        return
      }
      
      // 按地区分组歌手
      const grouped = {}
      singers.forEach(singer => {
        let region = singer.location || '其他'
        
        // 将中国所有城市的歌手统一分类为"中国"
        if (isChineseRegion(region)) {
          region = '中国'
        }
        
        if (!grouped[region]) {
          grouped[region] = []
        }
        grouped[region].push(singer)
      })
      singersByRegion.value = grouped
      console.log('分组后的歌手数据:', singersByRegion.value)
    } else {
      console.log('API返回错误:', response)
      singersByRegion.value = {}
    }
  } catch (error) {
    console.error('获取歌手列表失败:', error)
    singersByRegion.value = {}
  } finally {
    loading.value = false
  }
}

// 地区显示名称映射
const getRegionDisplayName = (region) => {
  const regionMap = {
    '中国': '中国',
    '韩国': '韩国',
    '美国': '美国',
    '日本': '日本',
    '英国': '英国',
    '加拿大': '加拿大',
    '德国': '德国',
    '意大利': '意大利',
    '西班牙': '西班牙',
    '马来西亚': '马来西亚',
    '新加坡': '新加坡',
    '挪威': '挪威',
    '瑞典': '瑞典',
    '其他': '其他'
  }
  return regionMap[region] || region
}

// 性别文本
const getGenderText = (sex) => {
  const genderMap = {
    0: '女',
    1: '男',
    2: '组合',
    3: '不明'
  }
  return genderMap[sex] || '不明'
}

// 打开抽屉显示歌手的歌曲
const goToSongs = async (singerName) => {
  console.log('打开抽屉，搜索歌手歌曲:', singerName)
  currentSingerName.value = singerName
  songsQueryParams.value.search = singerName
  songsQueryParams.value.pageNo = 1
  drawerVisible.value = true
  await loadSingerSongs()
}

// 显示添加对话框
const showAddDialog = () => {
  isEdit.value = false
  dialogTitle.value = '添加歌手'
  resetForm()
  dialogVisible.value = true
}

// 显示编辑对话框
const showEditDialog = async (singer) => {
  isEdit.value = true
  currentSingerId.value = singer.id
  dialogTitle.value = '编辑歌手'
  
  try {
    const response = await getSingerDetail(singer.id)
    if (response.code === 200) {
      Object.assign(singerForm, response.data)
    }
  } catch (error) {
    ElMessage.error('获取歌手详情失败')
  }
  
  dialogVisible.value = true
}

// 重置表单
const resetForm = () => {
  Object.assign(singerForm, {
    name: '',
    sex: 0,
    location: '',
    birth: '',
    pic: '',
    introduction: ''
  })
}

// 提交表单
const submitForm = async () => {
  try {
    // 深拷贝，避免 Proxy 对象
    const submitData = JSON.parse(JSON.stringify(singerForm))
    // birth 字段格式化
    if (submitData.birth) {
      const date = new Date(submitData.birth)
      if (!isNaN(date.getTime())) {
        const year = date.getFullYear()
        const month = String(date.getMonth() + 1).padStart(2, '0')
        const day = String(date.getDate()).padStart(2, '0')
        submitData.birth = `${year}-${month}-${day}`
      }
    }
    if (isEdit.value) {
      submitData.id = currentSingerId.value
      const response = await updateSinger(submitData)
      if (response.code === 200 || response.code === "200" || response.code === 0 || response.code === "0") {
        ElMessage.success('编辑成功')
        dialogVisible.value = false
        fetchSingers()
      } else {
        ElMessage.error(response.msg || '编辑失败')
      }
    } else {
      const response = await addSinger(submitData)
      if (response.code === 200 || response.code === "200" || response.code === 0 || response.code === "0") {
        ElMessage.success('添加成功')
        dialogVisible.value = false
        fetchSingers()
      } else {
        ElMessage.error(response.msg || '添加失败')
      }
    }
  } catch (error) {
    ElMessage.error('操作失败')
  }
}

// 删除歌手
const handleDeleteSinger = async (id) => {
  try {
    await ElMessageBox.confirm('确定要删除这个歌手吗？', '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    const response = await deleteSinger(id)
    if (response.code === 200 || response.code === "0" || response.code === 0) {
      ElMessage.success('删除成功')
      fetchSingers()
    } else {
      ElMessage.error(response.msg || '删除失败')
    }
  } catch (error) {
    if (error !== 'cancel') {
      ElMessage.error('删除失败')
    }
  }
}

// 组件挂载时获取数据
onMounted(() => {
  fetchSingers()
})

// 处理图片加载错误
const handleImageError = (event) => {
  event.target.src = '/src/assets/images/default.png'
}

// 加载歌手的歌曲
const loadSingerSongs = async () => {
  songsLoading.value = true
  try {
    const response = await getSongList(songsQueryParams.value)
    console.log('歌手歌曲API响应:', response)
    
    if (response.code === 200 || response.code === "0" || response.code === 0) {
      const data = response.data
      singerSongs.value = data.records || data || []
      songsTotal.value = data.total || 0
      console.log('歌手歌曲数据:', singerSongs.value)
    } else {
      console.log('获取歌手歌曲失败:', response)
      singerSongs.value = []
      songsTotal.value = 0
    }
  } catch (error) {
    console.error('获取歌手歌曲失败:', error)
    ElMessage.error('获取歌手歌曲失败')
    singerSongs.value = []
    songsTotal.value = 0
  } finally {
    songsLoading.value = false
  }
}

// 播放歌曲
const playSong = async (song) => {
  try {
    console.log('开始获取歌曲详情，歌曲ID:', song.id)
    const response = await getSongDetail(song.id)
    console.log('歌曲详情API响应:', response)
    
    if (response.code === 200 || response.code === "0" || response.code === 0) {
      const data = response.data
      console.log('原始歌曲数据:', data)
      
      // 正确处理歌曲文件URL
      if (data.url) {
        // 如果URL不是以http开头，则拼接baseURL
        if (!data.url.startsWith('http')) {
          data.url = baseURL + data.url
        }
      } else {
        console.error('歌曲URL为空:', data)
        ElMessage.error('歌曲文件不存在')
        return
      }
      
      // 正确处理图片URL
      if (data.pic) {
        if (!data.pic.startsWith('http')) {
          data.pic = baseURL + data.pic
        }
      }
      
      console.log('处理后的歌曲数据:', data)
      console.log('歌曲URL:', data.url)
      console.log('baseURL:', baseURL)
      
      // 添加到播放列表
      songsList.value.unshift(data)
      
      // 更新歌手映射
      if (data.singerId) {
        singersMap.value[data.singerId] = data.singerName || currentSingerName.value
      }
      
      ElMessage.success('已添加到播放列表')
      console.log('当前播放列表:', songsList.value)
    } else {
      console.log('获取歌曲详情失败:', response)
      ElMessage.error('获取歌曲详情失败')
    }
  } catch (error) {
    console.error('获取歌曲详情失败:', error)
    ElMessage.error('获取歌曲详情失败')
  }
}

// 分页处理
const handleSongsPageChange = (pageNo, size) => {
  songsQueryParams.value.pageNo = pageNo
  songsQueryParams.value.size = size
  loadSingerSongs()
}
</script>

<template>
  <div class="singer-container">
    <div class="singer-header">
      <h2>歌手管理</h2>
      <div class="header-actions">
        <el-button @click="fetchSingers" :loading="loading">刷新</el-button>
        <el-button type="primary" @click="showAddDialog">添加歌手</el-button>
      </div>
    </div>

    <!-- 按地区分类展示歌手 -->
    <div class="region-singers" v-loading="loading">
      <!-- 空数据提示 -->
      <div v-if="!loading && Object.keys(singersByRegion).length === 0" class="empty-state">
        <el-empty description="暂无歌手数据" />
      </div>
      
      <!-- 歌手数据展示 -->
      <div v-else-if="!loading" v-for="(singers, region) in singersByRegion" :key="region" class="region-group">
        <h3 class="region-title">{{ getRegionDisplayName(region) }}</h3>
        <div class="singers-grid">
          <div 
            v-for="singer in singers" 
            :key="singer.id" 
            class="singer-card"
            @click="goToSongs(singer.name)"
            title="点击查看歌曲"
          >
            <div class="singer-avatar">
              <img 
                :src="singer.pic || '/src/assets/images/default.png'" 
                :alt="singer.name"
                @error="handleImageError"
              />
            </div>
            <div class="singer-info">
              <h4 class="singer-name">{{ singer.name }}</h4>
              <p class="singer-gender">{{ getGenderText(singer.sex) }}</p>
              <p class="singer-location">{{ singer.location }}</p>
            </div>
            <div class="singer-actions">
              <el-button size="small" @click.stop="showEditDialog(singer)">编辑</el-button>
              <el-button size="small" type="danger" @click.stop="handleDeleteSinger(singer.id)">删除</el-button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 添加/编辑歌手对话框 -->
    <el-dialog :title="dialogTitle" v-model="dialogVisible" width="500px">
      <el-form :model="singerForm" :rules="rules" ref="singerFormRef" label-width="80px">
        <el-form-item label="姓名" prop="name">
          <el-input v-model="singerForm.name" placeholder="请输入歌手姓名"></el-input>
        </el-form-item>
        <el-form-item label="性别" prop="sex">
          <el-select v-model="singerForm.sex" placeholder="请选择性别">
            <el-option label="女" :value="0"></el-option>
            <el-option label="男" :value="1"></el-option>
            <el-option label="组合" :value="2"></el-option>
            <el-option label="不明" :value="3"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="地区" prop="location">
          <el-input v-model="singerForm.location" placeholder="请输入地区"></el-input>
        </el-form-item>
        <el-form-item label="生日" prop="birth">
          <el-date-picker v-model="singerForm.birth" type="date" placeholder="选择日期"></el-date-picker>
        </el-form-item>
        <el-form-item label="头像" prop="pic">
          <el-input v-model="singerForm.pic" placeholder="请输入头像URL"></el-input>
          </el-form-item>
        <el-form-item label="简介" prop="introduction">
          <el-input type="textarea" v-model="singerForm.introduction" placeholder="请输入简介"></el-input>
          </el-form-item>
        </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="submitForm">确定</el-button>
        </span>
      </template>
    </el-dialog>

    <!-- 歌手歌曲抽屉 -->
    <el-drawer 
      v-model="drawerVisible" 
      :title="`${currentSingerName} 的歌曲`"
      direction="rtl"
      size="60%"
    >
      <div class="songs-container" v-loading="songsLoading">
        <!-- 空数据提示 -->
        <div v-if="!songsLoading && singerSongs.length === 0" class="empty-state">
          <el-empty description="该歌手暂无歌曲" />
      </div>
        
        <!-- 歌曲列表 -->
        <div v-else-if="!songsLoading" class="songs-list">
          <el-table :data="singerSongs" style="width: 100%">
            <el-table-column prop="id" label="编号" width="80" />
            <el-table-column label="歌名" min-width="200">
        <template #default="{ row }">
                <el-link type="primary" @click="playSong(row)">{{ row.name }}</el-link>
        </template>
      </el-table-column>
            <el-table-column prop="createTime" label="日期" :formatter="formatDate" width="120" />
    </el-table>
          
          <!-- 分页 -->
          <div class="pagination-container" v-if="songsTotal > songsQueryParams.size">
            <el-pagination 
              background 
              layout="prev, pager, next" 
              @change="handleSongsPageChange" 
              :total="songsTotal"
              :page-size="songsQueryParams.size" 
            />
          </div>
        </div>
      </div>
    </el-drawer>

    <!-- 音乐播放器组件 -->
    <MusicPlayer 
      :songs="songsList" 
      :singers="singersMap" 
      :autoPlay="true"
      @update:songs="(newSongs) => console.log('播放器歌曲更新:', newSongs)"
    />
    </div>
</template>

<style scoped>
.singer-container {
  padding: 20px;
}

.singer-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
}

.singer-header h2 {
  margin: 0;
  color: #333;
}

.header-actions {
  display: flex;
  gap: 10px;
}

.region-singers {
  display: flex;
  flex-direction: column;
  gap: 30px;
}

.region-group {
  background: #fff;
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.region-title {
  margin: 0 0 20px 0;
  color: #409EFF;
  font-size: 18px;
  border-bottom: 2px solid #409EFF;
  padding-bottom: 10px;
}

.singers-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 20px;
}

.singer-card {
  background: #fff;
  border-radius: 8px;
  padding: 15px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  cursor: pointer;
  position: relative;
  display: flex;
  align-items: center;
}

.singer-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
}

.singer-avatar {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  overflow: hidden;
  margin-right: 15px;
  flex-shrink: 0;
}

.singer-avatar img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.singer-info {
  flex: 1;
  min-width: 0;
}

.singer-name {
  margin: 0 0 5px 0;
  font-size: 16px;
  font-weight: 600;
  color: #333;
}

.singer-name:hover {
  color: #409EFF;
}

.singer-gender,
.singer-location {
  margin: 2px 0;
  font-size: 12px;
  color: #666;
}

.singer-actions {
  display: flex;
  gap: 5px;
  margin-top: 10px;
}

.dialog-footer {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}

.songs-container {
  padding: 20px;
  height: 100%;
  display: flex;
  flex-direction: column;
}

.songs-list {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.pagination-container {
  margin-top: 20px;
  display: flex;
  justify-content: center;
}

.empty-state {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 200px;
}
</style>