<template>
  <el-dialog v-model="visible" title="选择歌曲添加到歌单" width="60%" @close="handleClose">
    <el-form :inline="true" :model="songQueryParams" @submit.prevent="handleSongSearch">
      <el-form-item>
        <el-input v-model="songQueryParams.search" placeholder="输入歌曲或歌手名搜索" clearable />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="handleSongSearch">搜索</el-button>
      </el-form-item>
    </el-form>

    <el-table
      ref="addSongTableRef"
      v-loading="loading"
      :data="availableSongs"
      border
      height="350px"
      row-key="id"
      @select="handleSongSelect"
      @select-all="handleSelectAll"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column prop="name" label="歌曲 / 歌手" show-overflow-tooltip />
      <el-table-column prop="introduction" label="专辑" show-overflow-tooltip />
    </el-table>

    <el-pagination
      v-if="availableSongsTotal > 0"
      v-model:current-page="songQueryParams.pageNo"
      v-model:page-size="songQueryParams.size"
      :page-sizes="[5, 10, 20]"
      :total="availableSongsTotal"
      layout="total, sizes, prev, pager, next, jumper"
      background
      class="pagination"
      @size-change="fetchAvailableSongs"
      @current-change="fetchAvailableSongs"
    />

    <template #footer>
      <el-button @click="visible = false">取 消</el-button>
      <el-button type="primary" @click="handleConfirmChanges" :disabled="isSelectionUnchanged">
        确认修改 (已选 {{ finalSelectedIds.size }} 首)
      </el-button>
    </template>
  </el-dialog>
</template>

<script setup>
import { ref, reactive, nextTick, computed } from 'vue';
import { ElMessage } from 'element-plus';
import { getSongPage } from '@/api/song.js';
import { addSongToSonglist, removeSongFromSonglist } from '@/api/songlist.js';

// --- 响应式状态 ---
const visible = ref(false);
const loading = ref(false);
const addSongTableRef = ref(null);

const songlistId = ref(null);
const initialSongIds = ref(new Set()); // 存储歌单打开时已有的歌曲ID
const finalSelectedIds = ref(new Set()); // 新增：用于存储所有页面最终勾选的歌曲ID

const availableSongs = ref([]);
const availableSongsTotal = ref(0);
const songQueryParams = reactive({
  pageNo: 1,
  size: 5,
  search: '',
});

const emit = defineEmits(['success']);

// --- 计算属性 ---

/**
 * 新增：判断歌曲选择是否发生变化
 * @returns {boolean} 如果最终选择与初始选择完全相同，则返回 true
 */
const isSelectionUnchanged = computed(() => {
  if (initialSongIds.value.size !== finalSelectedIds.value.size) {
    return false;
  }
  for (const id of initialSongIds.value) {
    if (!finalSelectedIds.value.has(id)) {
      return false;
    }
  }
  return true;
});


// --- 方法 ---

/**
 * 打开弹窗
 * @param {number} currentSonglistId - 当前歌单的ID
 * @param {Array<number>} currentSongIds - 当前歌单中已有的歌曲ID列表
 */
const open = (currentSonglistId, currentSongIds = []) => {
  visible.value = true;
  songlistId.value = currentSonglistId;
  // 初始化初始和最终的ID集合
  initialSongIds.value = new Set(currentSongIds);
  finalSelectedIds.value = new Set(currentSongIds);
  fetchAvailableSongs();
};

/** 获取所有可添加的歌曲列表 */
const fetchAvailableSongs = async () => {
  loading.value = true;
  try {
    const res = await getSongPage(songQueryParams);
    if (res.code === '0') {
      availableSongs.value = res.data.records;
      availableSongsTotal.value = res.data.total;
      // 关键：数据加载后，根据 finalSelectedIds 恢复表格的勾选状态
      await nextTick();
      if (addSongTableRef.value) {
        availableSongs.value.forEach(song => {
          if (finalSelectedIds.value.has(song.id)) {
            addSongTableRef.value.toggleRowSelection(song, true);
          }
        });
      }
    } else {
      ElMessage.error(res.msg || "获取歌曲列表失败");
    }
  } finally {
    loading.value = false;
  }
};

/** 搜索歌曲 */
const handleSongSearch = () => {
  songQueryParams.pageNo = 1;
  fetchAvailableSongs();
};

/**
 * 新增：处理单行勾选/取消勾选
 * @param {Array} selection - 当前页的选中行
 * @param {object} row - 当前操作的行
 */
const handleSongSelect = (selection, row) => {
  if (finalSelectedIds.value.has(row.id)) {
    finalSelectedIds.value.delete(row.id);
  } else {
    finalSelectedIds.value.add(row.id);
  }
};

/**
 * 新增：处理全选/取消全选
 * @param {Array} selection - 当前页的选中行
 */
const handleSelectAll = (selection) => {
  const currentPageIds = availableSongs.value.map(song => song.id);
  const isSelectAll = selection.length > 0;

  if (isSelectAll) {
    // 全选当前页
    currentPageIds.forEach(id => finalSelectedIds.value.add(id));
  } else {
    // 取消全选当前页
    currentPageIds.forEach(id => finalSelectedIds.value.delete(id));
  }
};


/**
 * 修改：确认修改歌单中的歌曲
 * 核心逻辑：计算初始ID集合和最终ID集合的差集，以确定需要添加和移除的歌曲
 */
const handleConfirmChanges = async () => {
  // 筛选出需要添加的歌曲ID (在最终选择中，但不在初始列表中)
  const songsToAddIds = [...finalSelectedIds.value].filter(id => !initialSongIds.value.has(id));

  // 筛选出需要移除的歌曲ID (在初始列表中，但不在最终选择中)
  const songsToRemoveIds = [...initialSongIds.value].filter(id => !finalSelectedIds.value.has(id));

  // 如果没有任何变化，则提示用户并关闭
  if (isSelectionUnchanged.value) {
    ElMessage.info("歌单中的歌曲未作任何修改");
    visible.value = false;
    return;
  }

  const addPromises = songsToAddIds.map(songId => addSongToSonglist(songlistId.value, { songId }));
  const removePromises = songsToRemoveIds.map(songId => removeSongFromSonglist(songlistId.value, songId));

  const allPromises = [...addPromises, ...removePromises];

  try {
    // 并发执行所有API请求
    await Promise.all(allPromises);
    
    let successMessage = '歌单已成功更新。';
    if (songsToAddIds.length > 0 && songsToRemoveIds.length > 0) {
      successMessage = `成功添加 ${songsToAddIds.length} 首, 移除 ${songsToRemoveIds.length} 首歌曲。`;
    } else if (songsToAddIds.length > 0) {
      successMessage = `成功添加 ${songsToAddIds.length} 首歌曲。`;
    } else if (songsToRemoveIds.length > 0) {
      successMessage = `成功移除 ${songsToRemoveIds.length} 首歌曲。`;
    }
    
    ElMessage.success(successMessage);
    visible.value = false;
    emit('success'); // 通知父组件刷新
  } catch (error) {
    console.error("更新歌单时发生错误:", error);
    ElMessage.error("更新歌单时发生错误，部分操作可能未成功。");
  }
};


/** 关闭弹窗时的清理 */
const handleClose = () => {
  songQueryParams.pageNo = 1;
  songQueryParams.search = '';
  availableSongs.value = [];
  // 清理状态
  initialSongIds.value.clear();
  finalSelectedIds.value.clear();
};

// 暴露 open 方法
defineExpose({
  open,
});
</script>

<style scoped>
.pagination {
  margin-top: 20px;
  justify-content: flex-end;
}
</style>