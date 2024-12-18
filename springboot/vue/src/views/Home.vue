<template>
    <div style="margin: 20px 0">
      <div style="font-size: 20px">
        您好，<strong style="color: orange">{{ user.nickname }}</strong> 欢迎您使用
        <strong style="color: #1E90FF">企业员工管理系统</strong>
      </div>
    </div>
</template>

<script>
export default {
  name: "Home",
  data() {
    return {
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  }
}
</script>





