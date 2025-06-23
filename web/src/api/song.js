import {get,post} from './request'
export function getSongList(params) {
  return get('/song/page',params)
}

export function getSongDetail(id) {
  return get('/song/detail',{id})
}

// 添加歌曲
export function addSong(data) {
  return post('/song/add', data)
}

// 编辑歌曲
export function updateSong(data) {
  return post('/song/update', data)
}

// 删除歌曲
export function deleteSong(id) {
  return post('/song/delete', {id})
}

/**
 * 点赞/取消点赞歌曲
 * @param {number} id 歌曲ID
 * @param {boolean} isLike true为点赞，false为取消点赞
 * @returns {Promise}
 */
export function likeSong(id, isLike = true) {
  return post('/song-like/like', {id, isLike})
}

/**
 * 获取今日热榜
 * @param {object} params 参数对象，如{pageNo, pageSize, singerId}
 * @returns {Promise}
 */
export function getTodayHotSongs(params = { pageNo: 1, pageSize: 10 }) {
  return get('/song-like/today-hot', params)
}

/**
 * 获取总热榜
 * @param {object} params 参数对象，如{pageNo, pageSize, singerId}
 * @returns {Promise}
 */
export function getTotalHotSongs(params = { pageNo: 1, pageSize: 10 }) {
  return get('/song-like/total-hot', params)
}

/**
 * 清空指定歌曲的点赞数
 * @param {number} songId 歌曲ID
 * @returns {Promise}
 */
export function resetSongLikes(songId) {
  return post(`/song-like/reset-likes/${songId}`)
}