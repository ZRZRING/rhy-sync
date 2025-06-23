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

    <el-table ref="addSongTableRef" v-loading="loading" :data="availableSongs" border height="350px" @selection-change="handleSongSelectionChange">
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
      <el-button type="primary" @click="handleConfirmAddSongs" :disabled="songSelection.length === 0">
        确认添加 (已选 {{ songSelection.length }} 首)
      </el-button>
    </template>
  </el-dialog>
</template>

<script setup>
import { ref, reactive, nextTick } from 'vue';
import { ElMessage } from 'element-plus';
import { getSongPage } from '@/api/song.js';
import { addSongToSonglist } from '@/api/songlist.js';

// --- 响应式状态 ---
const visible = ref(false);
const loading = ref(false);
const addSongTableRef = ref(null);

const songlistId = ref(null);
const initialSongIds = ref(new Set()); // 存储歌单中已有的歌曲ID
const songSelection = ref([]);
const availableSongs = ref([]);
const availableSongsTotal = ref(0);
const songQueryParams = reactive({
  pageNo: 1,
  size: 5,
  search: '',
});

const emit = defineEmits(['success']);

// --- 方法 ---

/**
 * 打开弹窗
 * @param {number} currentSonglistId - 当前歌单的ID
 * @param {Array<number>} currentSongIds - 当前歌单中已有的歌曲ID列表
 */
const open = (currentSonglistId, currentSongIds = []) => {
  visible.value = true;
  songlistId.value = currentSonglistId;
  initialSongIds.value = new Set(currentSongIds);
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
      await nextTick();
      if (addSongTableRef.value) {
        availableSongs.value.forEach(song => {
          if (initialSongIds.value.has(song.id)) {
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

/** 处理表格勾选变化 */
const handleSongSelectionChange = (selection) => {
  songSelection.value = selection;
};

/** 确认添加所选歌曲 */
const handleConfirmAddSongs = async () => {
  const songsToAdd = songSelection.value.filter(song => !initialSongIds.value.has(song.id));

  if (songsToAdd.length === 0) {
    ElMessage.info("没有新的歌曲需要添加");
    return;
  }

  const addPromises = songsToAdd.map(song =>
    addSongToSonglist(songlistId.value, { songId: song.id })
  );

  try {
    await Promise.all(addPromises);
    ElMessage.success(`成功添加 ${songsToAdd.length} 首歌曲`);
    visible.value = false;
    emit('success'); // 通知父组件刷新
  } catch (error) {
    ElMessage.error("添加歌曲时发生错误");
  }
};

/** 关闭弹窗时的清理 */
const handleClose = () => {
  songQueryParams.pageNo = 1;
  songQueryParams.search = '';
  availableSongs.value = [];
  songSelection.value = [];
  initialSongIds.value.clear();
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