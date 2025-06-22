<script>
import { useRouter } from "vue-router";
const router = useRouter();
import { useUserStore } from "@/stores/user";
// 下拉菜单事件
const handleCommand = (command) => {
  const userStore = useUserStore();
  // 退出系统事件
  if (command === "exit") {
    // 清除token
    userStore.setToken(null);
    // 跳转登录页面
    router.push("/login");
  }
};
</script>

<template>
  <h3>音乐后台系统</h3>
  <el-dropdown @command="handleCommand">
    <span class="el-dropdown-link">
      <img class="avatar" src="@/assets/images/default.png" alt="" srcset="" />
      <el-icon class="el-icon--right">
        <arrow-down />
      </el-icon>
    </span>
    <template #dropdown>
      <el-dropdown-menu>
        <el-dropdown-item command="userinfo">个人中心</el-dropdown-item>
        <el-dropdown-item command="changeAvatar">修改图像</el-dropdown-item>
        <el-dropdown-item divided command="exit">退出系统</el-dropdown-item>
      </el-dropdown-menu>
    </template>
  </el-dropdown>
</template>

<style scoped>
.avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
}

.logo {
  width: 100%;
  height: 80px;
  background: url("@/assets/images/kgc-music.png") no-repeat center/70px 70px;
}
</style>
