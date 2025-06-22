<template>
  <div class="songlist-management">
    <el-card shadow="never" class="query-card">
      <el-form :inline="true" :model="queryParams" @submit.prevent="handleSearch">
        <el-form-item label="歌单标题">
          <el-input v-model="queryParams.search" placeholder="输入关键词搜索" clearable />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" :icon="Search" @click="handleSearch">搜索</el-button>
          <el-button :icon="Refresh" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>
      <el-button type="success" :icon="Plus" @click="handleAdd">新增歌单</el-button>
    </el-card>

    <el-card shadow="never" class="table-card">
      <el-table v-loading="loading" :data="songlists" style="width: 100%">
        <el-table-column type="index" label="序号" width="80" align="center" />
        <el-table-column prop="title" label="歌单标题" show-overflow-tooltip />
        <el-table-column prop="introduction" label="简介" show-overflow-tooltip />
        <el-table-column prop="style" label="风格" width="150" align="center" />
        <el-table-column label="操作" width="280" align="center" fixed="right">
          <template #default="scope">
            <el-button size="small" type="primary" @click="handleViewDetails(scope.row)">
              <el-icon>
                <View />
              </el-icon> 查看歌曲
            </el-button>
            <el-button size="small" type="warning" @click="handleEdit(scope.row)">
              <el-icon>
                <Edit />
              </el-icon> 编辑
            </el-button>
            <el-button size="small" type="danger" @click="handleDelete(scope.row)">
              <el-icon>
                <Delete />
              </el-icon> 删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>

      <el-pagination v-if="total > 0" v-model:current-page="queryParams.page" v-model:page-size="queryParams.size"
        :page-sizes="[5, 10, 20, 50]" :total="total" layout="total, sizes, prev, pager, next, jumper" background
        class="pagination" @size-change="fetchSonglists" @current-change="fetchSonglists" />
    </el-card>

    <el-dialog v-model="songlistDialog.visible" :title="songlistDialog.title" width="500px" @close="resetForm">
      <el-form ref="songlistFormRef" :model="songlistForm" :rules="rules" label-width="80px">
        <el-form-item label="歌单标题" prop="title">
          <el-input v-model="songlistForm.title" placeholder="请输入歌单标题" />
        </el-form-item>
        <el-form-item label="风格" prop="style">
          <el-input v-model="songlistForm.style" placeholder="请输入歌单风格" />
        </el-form-item>
        <el-form-item label="歌单简介" prop="introduction">
          <el-input v-model="songlistForm.introduction" type="textarea" placeholder="请输入简介" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="songlistDialog.visible = false">取 消</el-button>
        <el-button type="primary" @click="handleSubmit">确 定</el-button>
      </template>
    </el-dialog>

    <el-dialog v-model="detailDialog.visible" :title="`歌单详情 - ${detailDialog.songlistTitle}`" width="70%">
      <el-button type="primary" :icon="Plus" @click="handleAddSong" class="add-song-btn">添加歌曲</el-button>
      <el-table v-loading="detailDialog.loading" :data="detailDialog.songs" border height="400px">
        <el-table-column type="index" label="序号" width="80" align="center" />
        <el-table-column prop="name" label="歌曲 / 歌手" show-overflow-tooltip />
        <el-table-column prop="introduction" label="专辑" show-overflow-tooltip />
        <el-table-column prop="createTime" label="创建时间" width="200" align="center" />
        <el-table-column label="操作" width="120" align="center" fixed="right">
          <template #default="scope">
            <el-button size="small" type="danger" @click="handleRemoveSong(scope.row)">
              <el-icon>
                <Delete />
              </el-icon> 移除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>
    <el-dialog v-model="addSongDialog.visible" title="选择歌曲添加到歌单" width="60%">
      <el-form :inline="true" :model="songQueryParams" @submit.prevent="handleSongSearch">
        <el-form-item>
          <el-input v-model="songQueryParams.search" placeholder="输入歌曲或歌手名搜索" clearable />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleSongSearch">搜索</el-button>
        </el-form-item>
      </el-form>

      <el-table v-loading="addSongDialog.loading" :data="availableSongs" border height="350px"
        @selection-change="handleSongSelectionChange">
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column prop="name" label="歌曲 / 歌手" show-overflow-tooltip />
        <el-table-column prop="introduction" label="专辑" show-overflow-tooltip />
      </el-table>

      <el-pagination v-if="availableSongsTotal > 0" v-model:current-page="songQueryParams.pageNo"
        v-model:page-size="songQueryParams.size" :page-sizes="[5, 10, 20]" :total="availableSongsTotal"
        layout="total, sizes, prev, pager, next, jumper" background class="pagination"
        @size-change="fetchAvailableSongs" @current-change="fetchAvailableSongs" />

      <template #footer>
        <el-button @click="addSongDialog.visible = false">取 消</el-button>
        <el-button type="primary" @click="handleConfirmAddSongs">
          确 定 添 加 (已选 {{ songSelection.length }} 首)
        </el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue';
import { ElMessage, ElMessageBox } from 'element-plus';
import { Search, Refresh, Plus, View, Edit, Delete } from '@element-plus/icons-vue';
import {
  getSonglist,
  getSonglistDetail,
  addSonglist,
  updateSonglist,
  deleteSonglist,
  addSongToSonglist,
  removeSongFromSonglist
} from '@/api/songlist.js'; // 确保API路径正确

import { getSongPage } from '@/api/song.js';

// --- 响应式状态定义 ---

// 主列表加载状态
const loading = ref(true);
// 歌单数据
const songlists = ref([]);
// 总条数
const total = ref(0);
// 查询参数
const queryParams = reactive({
  page: 1,
  size: 5,
  search: '',
});

// 歌单表单（新增/编辑）
const songlistFormRef = ref(null);
const songlistForm = reactive({
  id: null,
  title: '',
  introduction: '',
  style: ''
});
const songlistDialog = reactive({
  visible: false,
  title: '',
});
const rules = reactive({
  title: [{ required: true, message: '请输入歌单标题', trigger: 'blur' }],
  style: [{ required: true, message: '请输入歌单风格', trigger: 'blur' }]
});

// 歌单详情弹窗
const detailDialog = reactive({
  visible: false,
  loading: false,
  songlistId: null,
  songlistTitle: '',
  songs: [],
});

const addSongDialog = reactive({
  visible: false,
  loading: false,
});
const songSelection = ref([]); // 用于存储用户勾选的歌曲
const availableSongs = ref([]); // 对话框中显示的歌曲列表
const availableSongsTotal = ref(0); // 对话框中歌曲的总数
const songQueryParams = reactive({
  pageNo: 1, // 匹配后端的 pageNo
  size: 5,
  search: '',
});

// --- 方法定义 ---

/** 获取歌单列表 */
const fetchSonglists = async () => {
  loading.value = true;
  try {
    const res = await getSonglist(queryParams);
    if (res.code === "0") {
      songlists.value = res.data.records;
      total.value = res.data.total;
    } else {
      ElMessage.error(res.msg || '获取歌单列表失败');
    }
  } catch (error) {
    console.error("获取歌单列表失败:", error);
    ElMessage.error('获取歌单列表失败');
  } finally {
    loading.value = false;
  }
};

/** 搜索 */
const handleSearch = () => {
  queryParams.page = 1;
  fetchSonglists();
};

/** 重置搜索 */
const resetQuery = () => {
  queryParams.page = 1;
  queryParams.search = '';
  fetchSonglists();
};

/** 重置表单 */
const resetForm = () => {
  songlistForm.id = null;
  songlistForm.title = '';
  songlistForm.introduction = '';
  songlistForm.style = '';
  if (songlistFormRef.value) {
    songlistFormRef.value.clearValidate();
  }
};

/** 新增歌单 */
const handleAdd = () => {
  resetForm();
  songlistDialog.title = '新增歌单';
  songlistDialog.visible = true;
};

/** 编辑歌单 */
const handleEdit = (row) => {
  resetForm();
  Object.assign(songlistForm, row); // 将行数据复制到表单
  songlistDialog.title = '编辑歌单';
  songlistDialog.visible = true;
};

/** 提交歌单表单（新增/编辑） */
const handleSubmit = async () => {
  if (!songlistFormRef.value) return;
  await songlistFormRef.value.validate(async (valid) => {
    if (valid) {
      try {
        const payload = {
          title: songlistForm.title,
          introduction: songlistForm.introduction,
          style: songlistForm.style,
        };
        if (songlistForm.id) {
          // 更新
          await updateSonglist(songlistForm.id, payload);
          ElMessage.success('更新成功');
        } else {
          // 新增
          await addSonglist(payload);
          ElMessage.success('新增成功');
        }
        songlistDialog.visible = false;
        fetchSonglists(); // 重新加载列表
      } catch (error) {
        console.error("操作失败:", error);
        ElMessage.error('操作失败');
      }
    }
  });
};

/** 删除歌单 */
const handleDelete = (row) => {
  ElMessageBox.confirm(`确定要删除歌单「${row.title}」吗？`, '警告', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    try {
      await deleteSonglist(row.id);
      ElMessage.success('删除成功');
      // 如果删除的是当前页的最后一条数据，需要返回上一页
      if (songlists.value.length === 1 && queryParams.page > 1) {
        queryParams.page--;
      }
      fetchSonglists();
    } catch (error) {
      console.error("删除失败:", error);
      ElMessage.error('删除失败');
    }
  }).catch(() => {
    // 用户取消
  });
};

/** 查看歌单详情 */
const handleViewDetails = async (row) => {
  detailDialog.visible = true;
  detailDialog.loading = true;
  detailDialog.songlistId = row.id;
  detailDialog.songlistTitle = row.title; // 使用行数据中的title
  detailDialog.songs = [];

  try {
    const res = await getSonglistDetail(row.id);
    if (res.code === '0') {
      // 根据您的第二个返回示例，歌曲列表在 data.records 中
      detailDialog.songs = res.data.records;
    } else {
      ElMessage.error(res.msg || '获取歌单详情失败');
    }
  } catch (error) {
    console.error("获取歌单详情失败:", error);
    ElMessage.error('获取歌单详情失败');
  } finally {
    detailDialog.loading = false;
  }
};

/** 添加歌曲到当前歌单 */
const handleAddSong = () => {
  // 重置状态
  songQueryParams.pageNo = 1;
  songQueryParams.search = '';
  songSelection.value = [];
  // 打开对话框
  addSongDialog.visible = true;
  // 获取第一页的歌曲数据
  fetchAvailableSongs();
};

/** 从当前歌单移除歌曲 */
const handleRemoveSong = (song) => {
  ElMessageBox.confirm(`确定要从当前歌单移除歌曲「${song.name}」吗？`, '警告', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    try {
      await removeSongFromSonglist(detailDialog.songlistId, song.id);
      ElMessage.success('移除成功');
      // 局部刷新，比重新请求API体验更好
      const index = detailDialog.songs.findIndex(s => s.id === song.id);
      if (index !== -1) {
        detailDialog.songs.splice(index, 1);
      }
    } catch (error) {
      console.error("移除歌曲失败:", error);
      ElMessage.error("移除歌曲失败");
    }
  }).catch(() => { });
};

const fetchAvailableSongs = async () => {
  addSongDialog.loading = true;
  try {
    const res = await getSongPage(songQueryParams);
    if (res.code === '0') {
      availableSongs.value = res.data.records;
      availableSongsTotal.value = res.data.total;
    } else {
      ElMessage.error(res.msg || "获取歌曲列表失败");
    }
  } catch (error) {
    console.error("获取歌曲列表失败:", error);
  } finally {
    addSongDialog.loading = false;
  }
};

/**
 * 在“选择歌曲”对话框中进行搜索
 */
const handleSongSearch = () => {
  songQueryParams.pageNo = 1;
  fetchAvailableSongs();
};

/**
 * 处理歌曲表格的勾选变化
 * @param {Array} selection - El-Table返回的选中行数组
 */
const handleSongSelectionChange = (selection) => {
  songSelection.value = selection;
};

/**
 * 确认将选中的歌曲添加到歌单
 */
const handleConfirmAddSongs = async () => {
  if (songSelection.value.length === 0) {
    ElMessage.warning("请至少选择一首歌曲");
    return;
  }

  // Promise.all可以并行处理多个异步请求，提高效率
  const addPromises = songSelection.value.map(song => {
    return addSongToSonglist(detailDialog.songlistId, { songId: song.id });
  });

  try {
    await Promise.all(addPromises);
    ElMessage.success(`成功添加 ${songSelection.value.length} 首歌曲`);
    addSongDialog.visible = false;
    // 刷新歌单详情，显示新添加的歌曲
    handleViewDetails({ id: detailDialog.songlistId, title: detailDialog.songlistTitle });
  } catch (error) {
    console.error("批量添加歌曲失败:", error);
    ElMessage.error("添加歌曲时发生错误");
  }
};


// 组件挂载时自动加载第一页数据
onMounted(() => {
  fetchSonglists();
});
</script>

<style scoped>
.songlist-management {
  padding: 20px;
}

.query-card {
  margin-bottom: 20px;
}

.table-card {
  margin-bottom: 20px;
}

.pagination {
  margin-top: 20px;
  justify-content: flex-end;
  /* 右对齐 */
}

.add-song-btn {
  margin-bottom: 15px;
}
</style>