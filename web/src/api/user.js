import { post, get } from './request'

// 登录
export function login(data) {
  return post('/admin/login', data)
}

// 注册
export function register(data) {
  return post('/admin/register', data)
}

// 用户分页查询
export function getUserPage(params) {
  return get('/user/page', params)
}

// 添加用户
export function addUser(data) {
  return post('/user/add', data)
}

// 更新用户
export function updateUser(data) {
  return post('/user/update', data)
}

// 删除用户
export function deleteUser(id) {
  return post('/user/delete', { id })
}