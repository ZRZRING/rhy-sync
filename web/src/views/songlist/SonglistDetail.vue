<template>
  <el-dialog v-model="visible" :title="`歌单详情 - ${songlistTitle}`" width="70%" @close="handleClose">
    <el-button type="primary" :icon="Plus" @click="openModifyDialog" class="add-song-btn">添加/管理歌曲</el-button>
    <el-table v-loading="loading" :data="songs" border height="400px">
      <el-table-column type="index" label="序号" width="80" align="center" />
      <el-table-column prop="name" label="歌曲" show-overflow-tooltip />
      <el-table-column prop="introduction" label="专辑" show-overflow-tooltip />
      <el-table-column prop="createTime" label="创建时间" width="200" align="center" />
      <el-table-column label="操作" width="120" align="center" fixed="right">
        <template #default="scope">
          <el-button size="small" type="danger" @click="handleRemoveSong(scope.row)">
            <el-icon><Delete /></el-icon> 移除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </el-dialog>

  <SonglistDetailModify ref="modifyDialogRef" @success="refreshSongs" />
</template>

<script setup>
import { ref, reactive } from 'vue';
import { ElMessage, ElMessageBox } from 'element-plus';
import { Plus, Delete } from '@element-plus/icons-vue';
import { getSonglistDetail, removeSongFromSonglist } from '@/api/songlist.js';
import SonglistDetailModify from './SonglistForm.vue';

// --- 响应式状态 ---
const visible = ref(false);
const loading = ref(false);
const songlistId = ref(null);
const songlistTitle = ref('');
const songs = ref([]);
const modifyDialogRef = ref(null);

// --- 方法 ---

/**
 * 打开并初始化弹窗
 * @param {object} row - 父组件传来的歌单行数据
 */
const open = async (row) => {
  visible.value = true;
  songlistId.value = row.id;
  songlistTitle.value = row.title;
  await refreshSongs();
};

/** 刷新歌曲列表 */
const refreshSongs = async () => {
  loading.value = true;
  try {
    const res = await getSonglistDetail(songlistId.value);
    if (res.code === '0') {
      songs.value = res.data.records;
    } else {
      ElMessage.error(res.msg || '获取歌曲列表失败');
    }
  } catch (error) {
    ElMessage.error('获取歌曲列表失败');
  } finally {
    loading.value = false;
  }
};

/** 从歌单移除歌曲 */
const handleRemoveSong = (song) => {
  ElMessageBox.confirm(`确定要从当前歌单移除歌曲「${song.name}」吗？`, '警告', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(async () => {
    await removeSongFromSonglist(songlistId.value, song.id);
    ElMessage.success('移除成功');
    // 局部刷新，比重新请求API体验更好
    const index = songs.value.findIndex(s => s.id === song.id);
    if (index !== -1) {
      songs.value.splice(index, 1);
    }
  }).catch(() => {});
};

/** 打开修改歌曲的弹窗 */
const openModifyDialog = () => {
  const currentSongIds = songs.value.map(s => s.id);
  modifyDialogRef.value.open(songlistId.value, currentSongIds);
};

/** 关闭弹窗时的清理 */
const handleClose = () => {
  songs.value = [];
  songlistId.value = null;
  songlistTitle.value = '';
};

// 暴露 open 方法给父组件
defineExpose({
  open,
});
</script>

<style scoped>
.add-song-btn {
  margin-bottom: 15px;
}
</style>