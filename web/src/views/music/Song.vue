<script setup>
import { ref, onMounted, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { baseURL } from '@/api/request'
import { formatDate } from '@/utils/format'
import { getSongList, getSongDetail, updateSong, deleteSong, addSong } from '@/api/song'
import { getSingerDetail } from '@/api/singer'
import { ElMessage, ElMessageBox } from 'element-plus'

const route = useRoute()
const router = useRouter()

const songs = ref([])
const queryParams = ref({
  pageNo: 1,
  size: 7,
  search: '',
  orderBy: 'id',
  orderType: 'asc',
  sort: 'id,asc'
})
const total = ref(0)

// 编辑对话框相关
const editDialogVisible = ref(false)
const editForm = ref({
  id: null,
  name: '',
  singerId: null,
  introduction: '',
  url: '',
  pic: '',
  lyric: '',
  createTime: '',
  updateTime: ''
})

// 添加歌曲对话框相关
const addDialogVisible = ref(false)
const addForm = ref({
  name: '',
  singerId: null,
  introduction: '',
  url: '',
  pic: '',
  lyric: '',
  createTime: '',
  updateTime: ''
})

// 监听路由参数变化
watch(() => route.query, (newQuery) => {
  if (newQuery.search) {
    // 从歌手管理页面跳转过来，自动搜索该歌手的歌曲
    queryParams.value.search = newQuery.search
    queryParams.value.pageNo = 1
    console.log('检测到搜索参数，自动搜索:', newQuery.search)
    getAllSongs()
  }
}, { immediate: true })

const songList = async () => {
  try {
    const response = await getSongList(queryParams.value)
    console.log('歌曲API响应:', response)
    
    // 适配后端返回格式：code可能是"0"或0
    if (response.code === 200 || response.code === "0" || response.code === 0) {
      const data = response.data
      let songRecords = data.records || data || []
      
      // 前端排序：按ID正序排列
      songRecords.sort((a, b) => a.id - b.id)
      
      songs.value = songRecords
      total.value = data.total || 0
      console.log('歌曲数据:', songs.value)
    } else {
      console.log('API返回错误:', response)
      songs.value = []
      total.value = 0
    }
  } catch (error) {
    console.error('获取歌曲列表失败:', error)
    ElMessage.error('获取歌曲列表失败')
    songs.value = []
    total.value = 0
  }
}

// 分页
const change = (pageNo, size) => {
  console.log('分页变化:', pageNo, size);
  queryParams.value.pageNo = pageNo
  queryParams.value.size = size
  
  // 使用前端分页来解决排序问题
  getAllSongs() // 使用前端分页
  // songList() // 使用后端分页
}

// 搜索
const submitForm = () => {
  queryParams.value.pageNo = 1
  getAllSongs()
}

// 歌曲列表
const songsList = ref([]);

// 歌手映射表 {id: name} - 动态获取
const singersMap = ref({});

// 获取歌手信息并更新映射
const updateSingerMap = async (singerId, singerName) => {
  if (singerId && !singersMap.value[singerId]) {
    // 暂时跳过API调用，直接使用歌手ID或传入的名称
    singersMap.value[singerId] = singerName || `歌手${singerId}`;
    
    // 如果需要获取详细歌手信息，可以后续再实现
    // try {
    //   const response = await getSingerDetail(singerId);
    //   console.log('歌手详情API响应:', response);
    //   
    //   if (response && (response.code === 200 || response.code === "0" || response.code === 0)) {
    //     singersMap.value[singerId] = response.data?.name || singerName || '未知歌手';
    //   } else {
    //     console.log('歌手详情API返回错误:', response);
    //     singersMap.value[singerId] = singerName || '未知歌手';
    //   }
    // } catch (error) {
    //   console.error('获取歌手信息失败:', error);
    //   console.error('错误详情:', {
    //     message: error.message,
    //     code: error.code,
    //     response: error.response,
    //     data: error.response?.data
    //   });
    //   singersMap.value[singerId] = singerName || '未知歌手';
    // }
  }
};

const playingSong = async row => {
  try {
    console.log('开始获取歌曲详情，歌曲ID:', row.id)
    const response = await getSongDetail(row.id)
    console.log('歌曲详情API响应:', response)
    
    // 适配后端返回格式
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
        // 直接设置歌手映射，不调用API
        singersMap.value[data.singerId] = data.singerName || `歌手${data.singerId}`;
      }
      
      ElMessage.success('已添加到播放列表')
      console.log('当前播放列表:', songsList.value)
      
      // 调试信息：检查音频文件是否可访问
      setTimeout(async () => {
        try {
          const audioResponse = await fetch(data.url, { method: 'HEAD' })
          console.log('音频文件访问状态:', audioResponse.status, audioResponse.statusText)
          if (!audioResponse.ok) {
            console.error('音频文件无法访问:', data.url)
            ElMessage.warning('音频文件可能无法访问，请检查文件路径')
          }
        } catch (error) {
          console.error('音频文件访问失败:', error)
        }
      }, 1000)
    } else {
      console.log('获取歌曲详情失败:', response)
      ElMessage.error('获取歌曲详情失败')
    }
  } catch (error) {
    console.error('获取歌曲详情失败:', error)
    // 检查是否是token过期错误
    if (error.code === 1008) {
      ElMessage.error('登录已过期，请重新登录')
      router.push({ name: 'login' })
    } else {
      ElMessage.error('获取歌曲详情失败')
    }
  }
}

// 编辑歌曲
const handleEdit = (row) => {
  console.log('编辑歌曲:', row)
  editForm.value = {
    id: row.id,
    name: row.name || '',
    singerId: row.singerId || null,
    introduction: row.introduction || '',
    url: row.url || '',
    pic: row.pic || '',
    lyric: row.lyric || '',
    createTime: row.createTime || '',
    updateTime: row.updateTime || ''
  }
  
  editDialogVisible.value = true
}

// 保存编辑
const saveEdit = async () => {
  try {
    console.log('开始保存编辑，表单数据:', editForm.value)
    
    // 只发送必要的字段，避免时间字段问题
    const submitData = {
      id: parseInt(editForm.value.id),
      name: String(editForm.value.name || '').trim(),
      singerId: parseInt(editForm.value.singerId)
    }
    
    // 可选字段，只有在有值时才添加
    if (editForm.value.introduction && editForm.value.introduction.trim()) {
      submitData.introduction = editForm.value.introduction.trim()
    }
    if (editForm.value.url && editForm.value.url.trim()) {
      submitData.url = editForm.value.url.trim()
    }
    if (editForm.value.pic && editForm.value.pic.trim()) {
      submitData.pic = editForm.value.pic.trim()
    }
    if (editForm.value.lyric && editForm.value.lyric.trim()) {
      submitData.lyric = editForm.value.lyric.trim()
    }
    
    // 验证数据
    if (!submitData.id || isNaN(submitData.id)) {
      ElMessage.error('歌曲ID无效')
      return
    }
    if (!submitData.name) {
      ElMessage.error('歌曲名称不能为空')
      return
    }
    if (!submitData.singerId || isNaN(submitData.singerId)) {
      ElMessage.error('歌手ID无效')
      return
    }
    
    console.log('提交的数据:', submitData)
    
    const response = await updateSong(submitData)
    console.log('编辑API响应:', response)
    
    if (response.code === 200 || response.code === "0" || response.code === 0) {
      ElMessage.success('编辑成功')
      editDialogVisible.value = false
      getAllSongs() // 刷新列表
    } else {
      console.error('编辑失败，API返回:', response)
      ElMessage.error(response.msg || '编辑失败')
    }
  } catch (error) {
    console.error('编辑歌曲失败:', error)
    console.error('错误详情:', {
      message: error.message,
      code: error.code,
      response: error.response,
      data: error.response?.data,
      status: error.response?.status,
      statusText: error.response?.statusText,
      headers: error.response?.headers
    })
    
    // 更详细的错误信息
    if (error.response) {
      console.error('服务器响应状态:', error.response.status)
      console.error('服务器响应数据:', error.response.data)
      console.error('服务器响应头:', error.response.headers)
    } else if (error.request) {
      console.error('请求已发送但没有收到响应:', error.request)
    } else {
      console.error('请求设置时出错:', error.message)
    }
    
    ElMessage.error('编辑歌曲失败: ' + (error.message || '未知错误'))
  }
}

// 取消编辑
const cancelEdit = () => {
  editDialogVisible.value = false
  editForm.value = {}
}

// 打开添加歌曲对话框
const openAddDialog = () => {
  console.log('打开添加歌曲对话框')
  
  addForm.value = {
    name: '',
    singerId: null,
    introduction: '',
    url: '',
    pic: '',
    lyric: '',
    createTime: '',
    updateTime: ''
  }
  addDialogVisible.value = true
}

// 保存添加
const saveAdd = async () => {
  try {
    console.log('开始添加歌曲，表单数据:', addForm.value)
    
    // 只发送必要的字段，让后端自动处理时间
    const submitData = {
      name: String(addForm.value.name || '').trim(),
      singerId: parseInt(addForm.value.singerId)
    }
    
    // 可选字段，只有在有值时才添加
    if (addForm.value.introduction && addForm.value.introduction.trim()) {
      submitData.introduction = addForm.value.introduction.trim()
    }
    if (addForm.value.url && addForm.value.url.trim()) {
      submitData.url = addForm.value.url.trim()
    }
    if (addForm.value.pic && addForm.value.pic.trim()) {
      submitData.pic = addForm.value.pic.trim()
    }
    if (addForm.value.lyric && addForm.value.lyric.trim()) {
      submitData.lyric = addForm.value.lyric.trim()
    }
    
    // 验证数据
    if (!submitData.name) {
      ElMessage.error('歌曲名称不能为空')
      return
    }
    if (!submitData.singerId || isNaN(submitData.singerId)) {
      ElMessage.error('歌手ID无效')
      return
    }
    
    console.log('提交的数据:', submitData)
    
    const response = await addSong(submitData)
    console.log('添加API响应:', response)
    
    if (response.code === 200 || response.code === "0" || response.code === 0) {
      ElMessage.success('添加成功')
      addDialogVisible.value = false
      getAllSongs() // 刷新列表
    } else {
      console.error('添加失败，API返回:', response)
      ElMessage.error(response.msg || '添加失败')
    }
  } catch (error) {
    console.error('添加歌曲失败:', error)
    console.error('错误详情:', {
      message: error.message,
      code: error.code,
      response: error.response,
      data: error.response?.data
    })
    ElMessage.error('添加歌曲失败: ' + (error.message || '未知错误'))
  }
}

// 取消添加
const cancelAdd = () => {
  addDialogVisible.value = false
  addForm.value = {}
}

// 删除歌曲
const deleteSongHandler = async row => { 
  try {
    await ElMessageBox.confirm('确定要删除这首歌吗？', '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    
    const response = await deleteSong(row.id)
    if (response.code === 200 || response.code === "0" || response.code === 0) {
      ElMessage.success('删除成功')
      getAllSongs() // 刷新列表
    } else {
      ElMessage.error(response.msg || '删除失败')
    }
  } catch (error) {
    if (error !== 'cancel') {
      console.error('删除歌曲失败:', error)
      ElMessage.error('删除歌曲失败')
    }
  }
}

// 备选方案：获取所有歌曲数据然后前端分页
const getAllSongs = async () => {
  try {
    const response = await getSongList({ size: 1000 }) // 获取大量数据
    console.log('获取所有歌曲API响应:', response)
    
    if (response.code === 200 || response.code === "0" || response.code === 0) {
      let allSongs = response.data?.records || response.data || []
      
      // 前端排序：按ID正序排列
      allSongs.sort((a, b) => a.id - b.id)
      
      // 前端搜索过滤
      if (queryParams.value.search) {
        allSongs = allSongs.filter(song => 
          song.name?.toLowerCase().includes(queryParams.value.search.toLowerCase()) ||
          song.introduction?.toLowerCase().includes(queryParams.value.search.toLowerCase())
        )
      }
      
      // 前端分页
      const startIndex = (queryParams.value.pageNo - 1) * queryParams.value.size
      const endIndex = startIndex + queryParams.value.size
      songs.value = allSongs.slice(startIndex, endIndex)
      total.value = allSongs.length
      
      console.log('前端分页后的歌曲数据:', songs.value)
    } else {
      console.log('API返回错误:', response)
      songs.value = []
      total.value = 0
    }
  } catch (error) {
    console.error('获取歌曲列表失败:', error)
    // 检查是否是token过期错误
    if (error.code === 1008) {
      ElMessage.error('登录已过期，请重新登录')
      router.push({ name: 'login' })
    } else {
      ElMessage.error('获取歌曲列表失败')
    }
    songs.value = []
    total.value = 0
  }
}

// 组件挂载时初始化
onMounted(() => {
  // 如果没有搜索参数，才调用getAllSongs
  if (!route.query.search) {
    getAllSongs()
  }
  
  // 预加载一些歌手信息
  preloadSingerInfo()
})

// 预加载歌手信息
const preloadSingerInfo = async () => {
  try {
    // 获取所有歌曲，提取歌手ID
    const response = await getSongList({ size: 1000 })
    if (response.code === 200 || response.code === "0" || response.code === 0) {
      const songs = response.data?.records || response.data || []
      const singerIds = [...new Set(songs.map(song => song.singerId).filter(id => id))]
      
      // 只预加载前5个歌手，使用简化的方式
      const limitedSingerIds = singerIds.slice(0, 5)
      console.log('预加载歌手ID:', limitedSingerIds)
      
      // 直接设置歌手映射，不调用API
      limitedSingerIds.forEach(singerId => {
        singersMap.value[singerId] = `歌手${singerId}`;
      })
      
      console.log('预加载完成，歌手映射:', singersMap.value)
    }
  } catch (error) {
    console.error('预加载歌手信息失败:', error)
  }
}

// 测试后端连接
const testBackendConnection = async () => {
  try {
    console.log('测试后端连接...')
    const response = await getSongList({ size: 1 })
    console.log('后端连接测试成功:', response)
    return true
  } catch (error) {
    console.error('后端连接测试失败:', error)
    return false
  }
}
</script>

<template>
  <el-card style="max-width: 100%">
    <template #header>
      <div class="card-header">
        <el-form :inline="true" :model="queryParams" label-width="auto" class="demo-form-inline">
          <el-form-item label="歌名">
            <el-input 
              placeholder="请输入歌曲信息" 
              clearable 
              v-model="queryParams.search"
              @keyup.enter="submitForm"
            />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitForm">搜索</el-button>
          </el-form-item>
        </el-form>
        <!-- 添加歌曲按钮 -->
        <div class="header-actions">
          <el-button type="success" size="large" style="font-size: 18px; font-weight: 500;" @click="openAddDialog">
            添加歌曲
          </el-button>
        </div>
        <!-- 显示当前搜索状态 -->
        <div v-if="route.query.search" class="search-status">
          <el-tag type="info">正在搜索 "{{ route.query.search }}" 的歌曲</el-tag>
        </div>
      </div>
    </template>
    <el-table :data="songs" border style="width: 100%">
      <el-table-column prop="id" label="编号" width="80" />
      <el-table-column label="歌名" min-width="200">
        <template #default="{ row }">
          <el-link type="primary" @click="playingSong(row)">{{ row.name }}</el-link>
        </template>
      </el-table-column>
      <el-table-column prop="updateTime" label="更新时间" :formatter="formatDate" width="160" />
      <el-table-column label="操作" width="150" align="center">
        <template #default="{ row }">
          <el-button type="primary" @click="handleEdit(row)" size="small">编辑</el-button>
          <el-button type="danger" @click="deleteSongHandler(row)" size="small">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="example-pagination-block">
      <el-pagination 
        background 
        layout="prev, pager, next" 
        @current-change="(page) => change(page, queryParams.size)" 
        :total="total"
        :page-size="queryParams.size"
        :current-page="queryParams.pageNo"
      />
    </div>
  </el-card>
  <!-- 音乐播放器组件 -->
  <MusicPlayer :songs="songsList" :singers="singersMap" :autoPlay="true" />
  
  <!-- 编辑歌曲对话框 -->
  <el-dialog 
    v-model="editDialogVisible" 
    title="编辑歌曲" 
    width="500px"
    :before-close="cancelEdit"
  >
    <el-form :model="editForm" label-width="80px">
      <el-form-item label="歌曲名称">
        <el-input v-model="editForm.name" placeholder="请输入歌曲名称" />
      </el-form-item>
      <el-form-item label="歌手ID">
        <el-input v-model="editForm.singerId" placeholder="请输入歌手ID" type="number" />
      </el-form-item>
      <el-form-item label="歌曲介绍">
        <el-input 
          v-model="editForm.introduction" 
          type="textarea" 
          placeholder="请输入歌曲介绍"
          :rows="3"
        />
      </el-form-item>
      <el-form-item label="歌曲文件">
        <el-input v-model="editForm.url" placeholder="请输入歌曲文件路径" />
      </el-form-item>
      <el-form-item label="歌曲图片">
        <el-input v-model="editForm.pic" placeholder="例如: /img/song_pics/xxx.jpg" />
      </el-form-item>
      <el-form-item label="歌曲歌词">
        <el-input v-model="editForm.lyric" placeholder="请输入歌曲歌词" type="textarea" :rows="3" />
      </el-form-item>
      <el-form-item label="更新时间">
        <el-date-picker
          v-model="editForm.updateTime"
          type="datetime"
          placeholder="选择更新时间"
          format="YYYY-MM-DD HH:mm:ss"
          value-format="YYYY-MM-DD HH:mm:ss"
          style="width: 100%"
          disabled
        />
        <div style="font-size: 12px; color: #999; margin-top: 5px;">
          更新时间将在保存时自动设置为当前时间
        </div>
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="cancelEdit">取消</el-button>
        <el-button type="primary" @click="saveEdit">保存</el-button>
      </span>
    </template>
  </el-dialog>
  
  <!-- 添加歌曲对话框 -->
  <el-dialog 
    v-model="addDialogVisible" 
    title="添加歌曲" 
    width="500px"
    :before-close="cancelAdd"
  >
    <el-form :model="addForm" label-width="80px">
      <el-form-item label="歌曲名称" required>
        <el-input v-model="addForm.name" placeholder="请输入歌曲名称" />
      </el-form-item>
      <el-form-item label="歌手ID" required>
        <el-input v-model="addForm.singerId" placeholder="请输入歌手ID" type="number" />
      </el-form-item>
      <el-form-item label="歌曲介绍">
        <el-input 
          v-model="addForm.introduction" 
          type="textarea" 
          placeholder="请输入歌曲介绍"
          :rows="3"
        />
      </el-form-item>
      <el-form-item label="歌曲文件">
        <el-input v-model="addForm.url" placeholder="请输入歌曲文件路径" />
      </el-form-item>
      <el-form-item label="歌曲图片">
        <el-input v-model="addForm.pic" placeholder="例如: /img/song_pics/xxx.jpg" />
      </el-form-item>
      <el-form-item label="歌曲歌词">
        <el-input v-model="addForm.lyric" placeholder="请输入歌曲歌词" type="textarea" :rows="3" />
      </el-form-item>
      <el-form-item label="更新时间">
        <el-date-picker
          v-model="addForm.updateTime"
          type="datetime"
          placeholder="选择更新时间"
          format="YYYY-MM-DD HH:mm:ss"
          value-format="YYYY-MM-DD HH:mm:ss"
        />
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="cancelAdd">取消</el-button>
        <el-button type="primary" @click="saveAdd">添加</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<style scoped>
.el-card {
  min-height: 100%;
  width: 100%;
}

.el-table {
  font-size: 15px;
  --el-table-row-hover-bg-color: #f5f7fa;
}

.el-table th, .el-table td {
  padding: 8px 0 !important;
}

.el-table .el-link {
  font-weight: 500;
}

.el-table .el-button {
  border-radius: 16px;
  font-size: 13px;
  padding: 4px 14px;
  margin: 0 2px;
}

.el-table .el-button--primary {
  background: #409eff;
  border-color: #409eff;
}

.el-table .el-button--danger {
  background: #ff4d4f;
  border-color: #ff4d4f;
}

.el-table .el-table__cell {
  vertical-align: middle;
}

.el-table .el-table__column--center {
  text-align: center;
}

.example-pagination-block {
  display: flex;
  justify-content: center;
  margin: 18px 0 0 0;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 10px;
}

.search-status {
  margin-top: 10px;
}

.demo-form-inline {
  display: flex;
  align-items: center;
  gap: 10px;
}

.header-actions {
  display: flex;
  align-items: center;
  gap: 10px;
}

/* 歌词输入框样式 */
:deep(.el-textarea__inner) {
  background-color: #f8f9fa !important;
  border-color: #e9ecef;
}

:deep(.el-textarea__inner:focus) {
  background-color: #ffffff !important;
  border-color: #409eff;
}

/* 日期选择器样式 */
:deep(.el-date-editor) {
  width: 100% !important;
}

:deep(.el-date-editor .el-input__wrapper) {
  background-color: #f8f9fa;
  border-color: #e9ecef;
}

:deep(.el-date-editor .el-input__wrapper:hover) {
  border-color: #409eff;
}

:deep(.el-date-editor .el-input__wrapper.is-focus) {
  background-color: #ffffff;
  border-color: #409eff;
}
</style>