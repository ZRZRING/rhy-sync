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
              <el-icon><View /></el-icon> 查看歌曲
            </el-button>
            <el-button size="small" type="warning" @click="handleEdit(scope.row)">
              <el-icon><Edit /></el-icon> 编辑
            </el-button>
            <el-button size="small" type="danger" @click="handleDelete(scope.row)">
              <el-icon><Delete /></el-icon> 删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>

      <el-pagination
        v-if="total > 0"
        v-model:current-page="queryParams.page"
        v-model:page-size="queryParams.size"
        :page-sizes="[5, 10, 20, 50]"
        :total="total"
        layout="total, sizes, prev, pager, next, jumper"
        background
        class="pagination"
        @size-change="fetchSonglists"
        @current-change="fetchSonglists"
      />
    </el-card>

    <SonglistFormDialog ref="songlistFormDialogRef" @success="fetchSonglists" />

    <SonglistDetailDialog ref="songlistDetailDialogRef" />
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue';
import { ElMessage, ElMessageBox } from 'element-plus';
import { Search, Refresh, Plus, View, Edit, Delete } from '@element-plus/icons-vue';
import { getSonglist, deleteSonglist } from '@/api/songlist.js';
import SonglistFormDialog from './SonglistForm.vue'; // 假设拆分出表单组件
import SonglistDetailDialog from './SonglistDetail.vue'; // 假设拆分出详情组件

// --- 响应式状态 ---
const loading = ref(true);
const songlists = ref([]);
const total = ref(0);
const queryParams = reactive({
  page: 1,
  size: 5,
  search: '',
});

const songlistFormDialogRef = ref(null);
const songlistDetailDialogRef = ref(null);

// --- 方法 ---

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

/** 新增歌单 */
const handleAdd = () => {
  songlistFormDialogRef.value.open();
};

/** 编辑歌单 */
const handleEdit = (row) => {
  songlistFormDialogRef.value.open(row);
};

/** 删除歌单 */
const handleDelete = (row) => {
  ElMessageBox.confirm(`确定要删除歌单「${row.title}」吗？`, '警告', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    await deleteSonglist(row.id);
    ElMessage.success('删除成功');
    if (songlists.value.length === 1 && queryParams.page > 1) {
      queryParams.page--;
    }
    fetchSonglists();
  }).catch(() => {});
};

/** 查看歌单详情 */
const handleViewDetails = (row) => {
  songlistDetailDialogRef.value.open(row);
};

// --- 生命周期钩子 ---
onMounted(() => {
  fetchSonglists();
});
</script>

<style scoped>
.songlist-management {
  padding: 20px;
}
.query-card, .table-card {
  margin-bottom: 20px;
}
.pagination {
  margin-top: 20px;
  justify-content: flex-end;
}
</style>