import {get,post,reqeust} from './request'
import {formatDate2} from '../utils/format'
// 获取歌手列表
export function getSingerList(params) {
  return get('/singer/page',params)
}
// 获取歌手详情
export function getSingerDetail(id) {
  return get('/singer/detail',{id})
}
export function addSinger(data){
  if (data.birth instanceof Date) {
    data.birth = formatDate2(data.birth);
  }
  return post('/singer/add',data)
}
// 编辑歌手
export function updateSinger(data){
  if (data.birth instanceof Date) {
    data.birth = formatDate2(data.birth);
  }
  return post('/singer/update',data)
}
// 删除歌手
export function deleteSinger(id) {
  return post('/singer/delete',{id})
}
// 获取按地区分类的歌手列表
export function getSingerListByRegion() {
  return get('/singer/region')
}