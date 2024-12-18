
<template>
  <div>
    <!-- header-->
    <div style="height: 40px; line-height: 40px; background-color: dodgerblue; display: flex">
      <div style="font-size: 16px; color: #eee; font-weight: bold; width: 200px; text-align: center">
        企业员工管理系统
      </div>

      <div style="flex: 1">
        <i :class="icon" style="font-size: 20px; color: white; position: relative; top: 2px; cursor: pointer;" @click="handleCollapse"></i>
      </div>

      <div style="width: 400px;  display: flex; padding-right: 30px;">
        <div style="flex: 1; color: white; font-size: 14px; text-align: right; margin-right: 10px">北京时间： {{ time }}</div>
        <el-dropdown placement="bottom" style="text-align: right;">
          <el-avatar :size="30" style="margin-top: 5px" :src="user.avatarUrl"></el-avatar>

          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item><div @click="$router.push('/person')">个人信息</div></el-dropdown-item>
            <el-dropdown-item><div @click="logout">退出登录</div></el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>

      </div>
    </div>

    <!-- bottom -->
    <div style="display: flex; min-height: calc(100vh - 40px)">
      <!-- aside -->
      <div :style="{'width': menuWidth }">
        <el-menu style="min-height: 100%; overflow-x: hidden;"
                 :default-active="$route.path"
                 :collapse="collapse"
                 :collapse-transition="false"
                 router
        >
          <el-menu-item index="/home">
            <i class="el-icon-s-home"></i>
            <span slot="title">主页</span>
          </el-menu-item>
          <el-menu-item index="/front/home" v-if="user.role === 'ROLE_USER'">
            <i class="el-icon-eleme"></i>
            <span slot="title">前端页面</span>
          </el-menu-item>
          <el-menu-item index="/department" v-if="user.role === 'ROLE_ADMIN'">
            <i class="el-icon-menu"></i>
            <span slot="title">部门管理</span>
          </el-menu-item>
          <el-menu-item index="/employee" v-if="user.role === 'ROLE_ADMIN'">
            <i class="el-icon-user"></i>
            <span slot="title">员工管理</span>
          </el-menu-item>
          <el-menu-item index="/salary" v-if="user.role === 'ROLE_ADMIN'">
            <i class="el-icon-star-on"></i>
            <span slot="title">工资管理</span>
          </el-menu-item>
          <el-menu-item index="/leaverecords" v-if="user.role === 'ROLE_ADMIN'">
            <i class="el-icon-user-solid"></i>
            <span slot="title">请假管理</span>
          </el-menu-item>
          <el-menu-item index="/attendrecords" v-if="user.role === 'ROLE_ADMIN'">
            <i class="el-icon-phone"></i>
            <span slot="title">出勤管理</span>
          </el-menu-item>
          <el-menu-item index="/user" v-if="user.role === 'ROLE_ADMIN'">
            <i class="el-icon-s-custom"></i>
            <span slot="title">用户管理</span>
          </el-menu-item>

        </el-menu>
      </div>

      <!-- main -->
      <div style="width: 0; flex: 1; padding: 10px">
        <router-view @refreshUser="getUser" />
      </div>
    </div>

  </div>
</template>

<script>
export default {
  name: "Manager",

  data() {
    return {
      user: {},
      time: getTime(),
      collapse: false,
      menuWidth: '200px',
      icon: 'el-icon-s-fold',
    }
  },
  created() {
    // 从后台获取最新的User数据
    this.getUser()

    setInterval(() => {
      this.time = getTime()
    }, 1000)
  },
  methods: {
    handleCollapse() {
      this.collapse = !this.collapse
      this.menuWidth = this.menuWidth === '64px' ? '200px' : '64px'
      this.icon = this.icon === 'el-icon-s-unfold' ? 'el-icon-s-fold' : 'el-icon-s-unfold'
    },
    getUser() {
      let userId = localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")).id : 0
      if (userId) {
        // 从后台获取User数据
        this.request.get("/user/" + userId).then(res => {
          // 重新赋值后台的最新User数据
          this.user = res.data
        })
      } else {
        this.$router.push('/login')
      }
    },
    logout() {
      localStorage.removeItem('user')
      this.$router.push('/login')
    }
  }
}

function getTime() {
  // 获取时间戳
  const newDate = new Date();
  const year = newDate.getFullYear();
  let month = newDate.getMonth() + 1;
  const date = newDate.getDate();
  let hour = newDate.getHours();
  let minute = newDate.getMinutes();
  let second = newDate.getSeconds();
  if (hour < 10) {
    hour = "0" + hour
  }
  if (minute < 10) {
    minute = "0" + minute
  }
  if (second < 10) {
    second = "0" + second
  }
  return `${year}/${month}/${date} ${hour}:${minute}:${second}`;
}
</script>

<style scoped>
.el-submenu /deep/.el-submenu__title {
  height: 40px;
  line-height: 40px;
}
/deep/.el-menu-item {
  height: 40px;
  line-height: 40px;
}

</style>