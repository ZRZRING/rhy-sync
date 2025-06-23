<template>
  <div class="user-manage">
    <div class="user-manage-header">
      <el-input v-model="search" placeholder="搜索用户名/电话/邮箱" style="width: 200px; margin-right: 12px;" clearable @keyup.enter="onSearch" />
      <el-button type="primary" @click="onSearch" style="margin-right: 12px;">查询</el-button>
      <el-button type="primary" @click="showAdd = true">添加用户</el-button>
    </div>
    <el-table :data="users" style="width: 100%; margin-top: 18px;" border stripe>
      <el-table-column label="序号" width="60" align="center">
        <template #default="scope">
          {{ (pageNo - 1) * size + scope.$index + 1 }}
        </template>
      </el-table-column>
      <el-table-column prop="username" label="用户名" align="center" />
      <el-table-column prop="sex" label="性别" align="center">
        <template #default="scope">
          <span>{{ scope.row.sex === 1 ? '男' : scope.row.sex === 0 ? '女' : '未知' }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="phone_num" label="电话" align="center" />
      <el-table-column prop="email" label="邮箱" align="center" />
      <el-table-column prop="birth" label="生日" align="center">
        <template #default="scope">
          <span>{{ scope.row.birth ? (scope.row.birth.slice ? scope.row.birth.slice(0,10) : scope.row.birth) : '' }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="location" label="地区" align="center" />
      <el-table-column prop="introduction" label="简介" align="center" />
      <el-table-column prop="avator" label="头像" align="center">
        <template #default="scope">
          <el-image v-if="scope.row.avator" :src="scope.row.avator" style="width:32px;height:32px;border-radius:50%;object-fit:cover;" />
        </template>
      </el-table-column>
      <el-table-column prop="create_time" label="创建时间" align="center">
        <template #default="scope">
          <span>{{ scope.row.create_time ? (scope.row.create_time.slice ? scope.row.create_time.slice(0,19).replace('T',' ') : scope.row.create_time) : '' }}</span>
        </template>
      </el-table-column>
      <el-table-column prop="update_time" label="更新时间" align="center">
        <template #default="scope">
          <span>{{ scope.row.update_time ? (scope.row.update_time.slice ? scope.row.update_time.slice(0,19).replace('T',' ') : scope.row.update_time) : '' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="180" align="center">
        <template #default="scope">
          <el-button size="small" @click="editUser(scope.row)">编辑</el-button>
          <el-button size="small" type="danger" @click="removeUser(scope.row.id)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="user-manage-pagination">
      <el-pagination
        background
        layout="prev, pager, next, jumper"
        :total="total"
        :page-size="size"
        :current-page="pageNo"
        @current-change="handlePageChange"
      />
    </div>
    <!-- 添加用户弹窗 -->
    <el-dialog v-model="showAdd" title="添加用户" width="400px">
      <el-form :model="addForm" label-width="80px">
        <el-form-item label="用户名">
          <el-input v-model="addForm.username" placeholder="请输入用户名" />
        </el-form-item>
        <el-form-item label="密码">
          <el-input v-model="addForm.password" type="password" placeholder="请输入密码" />
        </el-form-item>
        <el-form-item label="性别">
          <el-select v-model="addForm.sex" placeholder="请选择性别">
            <el-option label="男" :value="1" />
            <el-option label="女" :value="0" />
            <el-option label="未知" :value="2" />
          </el-select>
        </el-form-item>
        <el-form-item label="电话">
          <el-input v-model="addForm.phone_num" placeholder="请输入电话" />
        </el-form-item>
        <el-form-item label="邮箱">
          <el-input v-model="addForm.email" placeholder="请输入邮箱" />
        </el-form-item>
        <el-form-item label="生日">
          <el-date-picker v-model="addForm.birth" type="date" placeholder="选择日期" style="width:100%" />
        </el-form-item>
        <el-form-item label="地区">
          <el-input v-model="addForm.location" placeholder="请输入地区" />
        </el-form-item>
        <el-form-item label="简介">
          <el-input v-model="addForm.introduction" placeholder="请输入简介" />
        </el-form-item>
        <el-form-item label="头像">
          <el-input v-model="addForm.avator" placeholder="请输入头像URL" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showAdd = false">取消</el-button>
        <el-button type="primary" @click="handleAdd">添加</el-button>
      </template>
    </el-dialog>
    <!-- 编辑用户弹窗 -->
    <el-dialog v-model="showEdit" title="编辑用户" width="400px">
      <el-form :model="editForm" label-width="80px">
        <el-form-item label="用户名">
          <el-input v-model="editForm.username" placeholder="请输入用户名" />
        </el-form-item>
        <el-form-item label="密码">
          <el-input v-model="editForm.password" type="password" placeholder="请输入密码" />
        </el-form-item>
        <el-form-item label="性别">
          <el-select v-model="editForm.sex" placeholder="请选择性别">
            <el-option label="男" :value="1" />
            <el-option label="女" :value="0" />
            <el-option label="未知" :value="2" />
          </el-select>
        </el-form-item>
        <el-form-item label="电话">
          <el-input v-model="editForm.phone_num" placeholder="请输入电话" />
        </el-form-item>
        <el-form-item label="邮箱">
          <el-input v-model="editForm.email" placeholder="请输入邮箱" />
        </el-form-item>
        <el-form-item label="生日">
          <el-date-picker v-model="editForm.birth" type="date" placeholder="选择日期" style="width:100%" />
        </el-form-item>
        <el-form-item label="地区">
          <el-input v-model="editForm.location" placeholder="请输入地区" />
        </el-form-item>
        <el-form-item label="简介">
          <el-input v-model="editForm.introduction" placeholder="请输入简介" />
        </el-form-item>
        <el-form-item label="头像">
          <el-input v-model="editForm.avator" placeholder="请输入头像URL" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showEdit = false">取消</el-button>
        <el-button type="primary" @click="handleEdit">保存</el-button>
      </template>
    </el-dialog>
  </div>
</template>
<script setup>
import { ref, onMounted } from 'vue'
import { getUserPage, addUser, updateUser, deleteUser } from '@/api/user'
import { ElMessage, ElMessageBox } from 'element-plus'

const users = ref([])
const total = ref(0)
const pageNo = ref(1)
const size = ref(10)
const search = ref('')

const showAdd = ref(false)
const showEdit = ref(false)
const addForm = ref({ username: '', password: '', sex: 2, phone_num: '', email: '', birth: '', location: '', introduction: '', avator: '' })
const editForm = ref({ id: null, username: '', password: '', sex: 2, phone_num: '', email: '', birth: '', location: '', introduction: '', avator: '' })

function onSearch() {
  pageNo.value = 1
  fetchUsers()
}

function fetchUsers() {
  getUserPage({ pageNo: pageNo.value, size: size.value, search: search.value })
    .then(res => {
      users.value = res.data.records
      total.value = res.data.total
      if (search.value && (!res.data.records || res.data.records.length === 0)) {
        ElMessage.warning('未找到相关用户')
      }
    })
    .catch(err => {
      ElMessage.error('查询失败，请检查网络或接口')
    })
}

function handlePageChange(val) {
  pageNo.value = val
  fetchUsers()
}
function handleAdd() {
  if (!addForm.value.username || !addForm.value.password) {
    ElMessage.error('用户名和密码不能为空')
    return
  }
  if (addForm.value.phone_num && addForm.value.phone_num.length !== 11) {
    ElMessage.error('电话必须为11位')
    return
  }
  addUser(addForm.value).then(() => {
    ElMessage.success('添加成功')
    showAdd.value = false
    addForm.value = { username: '', password: '', sex: 2, phone_num: '', email: '', birth: '', location: '', introduction: '', avator: '' }
    fetchUsers()
  })
}
function editUser(row) {
  editForm.value = { ...row }
  showEdit.value = true
}
function handleEdit() {
  if (!editForm.value.username || !editForm.value.password) {
    ElMessage.error('用户名和密码不能为空')
    return
  }
  updateUser(editForm.value).then(() => {
    ElMessage.success('修改成功')
    showEdit.value = false
    fetchUsers()
  })
}
function removeUser(id) {
  ElMessageBox.confirm('确定要删除该用户吗？', '提示', { type: 'warning' })
    .then(() => {
      deleteUser(id).then(() => {
        ElMessage.success('删除成功')
        fetchUsers()
      })
    })
}
onMounted(fetchUsers)
</script>
<style scoped>
.user-manage {
  padding: 24px;
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 16px rgba(0,0,0,0.06);
  max-width: 1200px;
  margin: 32px auto;
}
.user-manage-header {
  display: flex;
  align-items: center;
  margin-bottom: 8px;
}
.user-manage-pagination {
  margin: 18px 0 0 0;
  text-align: right;
}
</style> 