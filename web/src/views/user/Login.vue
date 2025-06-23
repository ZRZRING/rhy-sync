<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";
import { login, register } from "@/api/user";
import { useUserStore } from "@/stores/user";
import {User,Lock} from '@element-plus/icons-vue'
import { ElMessage } from 'element-plus'

const router=useRouter()

// 绑定表单登录数据
const form = ref({
  name: 'admin',
  password: '123'
})

const showRegister = ref(false)
const registerForm = ref({ name: '', password: '' })

const handleLogin = async () => {
  if (!form.value.name || !form.value.password) {
    ElMessage.error('用户名和密码不能为空')
    return
  }
  const res = await login(form.value)
  if (res.code === 200 || res.code === '0' || res.code === 0) {
    ElMessage.success('登录成功')
    const userStore = useUserStore()
    userStore.setToken(res.data)
    router.push('/')
  } else {
    ElMessage.error(res.msg || '登录失败')
  }
}

const handleRegister = async () => {
  if (!registerForm.value.name || !registerForm.value.password) {
    ElMessage.error('用户名和密码不能为空')
    return
  }
  const res = await register(registerForm.value)
  if (res.code === 200 || res.code === '0' || res.code === 0) {
    ElMessage.success('注册成功，请登录')
    showRegister.value = false
  } else {
    ElMessage.error(res.msg || '注册失败')
  }
}

</script>
<template>
<div class="login-bg">
    <div class="login-container">
      <h2 class="login-title">音乐管理后台</h2>
      <el-form :model="form" class="login-form">
        <el-form-item label="用户名">
          <el-input :prefix-icon="User" v-model="form.name" 
            placeholder="请输入用户名" />
        </el-form-item>
        <el-form-item label="密码">
          <el-input :prefix-icon="Lock" v-model="form.password" type="password"
          placeholder="请输入密码" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleLogin" class="login-btn">登录</el-button>
          <el-button @click="showRegister = true">注册</el-button>
        </el-form-item>
      </el-form>
    </div>
    <el-dialog v-model="showRegister" title="注册" class="register-dialog" :close-on-click-modal="false" width="380px">
      <div class="register-dialog-content">
        <el-form :model="registerForm" class="register-form">
          <el-form-item label="用户名">
            <el-input v-model="registerForm.name" prefix-icon="User" placeholder="请输入用户名" clearable />
          </el-form-item>
          <el-form-item label="密码">
            <el-input v-model="registerForm.password" prefix-icon="Lock" type="password" placeholder="请输入密码" show-password clearable />
          </el-form-item>
        </el-form>
      </div>
      <template #footer>
        <div class="register-dialog-footer">
          <el-button @click="showRegister = false">取消</el-button>
          <el-button type="primary" @click="handleRegister">注册</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>
<style scoped>
.login-bg {
  min-height: 100vh;
  width: 100vw;
  background: url('https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=1200&q=80') center/cover no-repeat;
  display: flex;
  align-items: center;
  justify-content: center;
}
.login-container {
  background: rgba(255, 255, 255, 0.92);
  box-shadow: 0 4px 32px rgba(0,0,0,0.12);
  border-radius: 18px;
  padding: 40px 32px 32px 32px;
  min-width: 320px;
  max-width: 90vw;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.login-title {
  margin-bottom: 28px;
  color: #222;
  font-size: 2rem;
  font-weight: 700;
  letter-spacing: 2px;
  text-align: center;
}
.login-form {
  width: 100%;
  max-width: 320px;
  margin: 0 auto;
  background: transparent;
  box-shadow: none;
  padding: 0;
}
.login-btn {
  min-width: 90px;
}
@media (max-width: 600px) {
  .login-container {
    padding: 24px 8px 16px 8px;
    min-width: 0;
  }
  .login-form {
    max-width: 100vw;
  }
}
.register-dialog >>> .el-dialog__header {
  text-align: center;
  font-size: 1.3rem;
  font-weight: 600;
  letter-spacing: 1px;
  border-bottom: 1px solid #f0f0f0;
  margin-bottom: 10px;
}
.register-dialog >>> .el-dialog {
  border-radius: 18px;
  box-shadow: 0 6px 32px rgba(0,0,0,0.18);
  background: rgba(255,255,255,0.98);
}
.register-dialog-content {
  padding: 10px 10px 0 10px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.register-form {
  width: 100%;
  max-width: 300px;
}
.register-form .el-form-item {
  margin-bottom: 18px;
}
.register-dialog-footer {
  display: flex;
  justify-content: flex-end;
  gap: 12px;
  padding: 8px 0 0 0;
}
.register-form .el-input {
  border-radius: 8px;
}
.register-form .el-input__wrapper {
  background: #f7f8fa;
}
@media (max-width: 600px) {
  .register-dialog >>> .el-dialog {
    width: 95vw !important;
    min-width: 0;
  }
  .register-form {
    max-width: 100vw;
  }
}
</style>