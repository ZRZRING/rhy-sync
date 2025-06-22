import {get,post} from './request'
export function getSongPage(params) {
  return get('/song/page',params)
}

export function getSongDetail(id) {
  return get('/song/detail',{id})
}