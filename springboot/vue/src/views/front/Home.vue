<template>
  <div>
    <div style="margin: 10px 0">
      <el-carousel height="450px" :interval="10000">
        <el-carousel-item v-for="item in imgs" :key="item">
          <img :src="item" alt="" style="width: 100%">
        </el-carousel-item>
      </el-carousel>
    </div>

    <div style="margin: 10px 0">
      <el-row :gutter="10">
        <el-col :span="6" v-for="item in files" :key="item.id" style="margin-bottom: 10px">

          <div style="border: 1px solid #ccc; padding-bottom: 10px">
            <img :src="item.url" alt="" style="width: 100%">
            <div style="color: #666; padding: 10px">{{ item.name }}</div>
            <div style="padding: 10px"><el-button type="primary">购买</el-button></div>
          </div>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
export default {
  name: "FrontHome",
  data() {
    return {
      imgs: [
          'https://img1.baidu.com/it/u=1277845759,1514377704&fm=253&fmt=auto&app=138&f=JPEG!cc_1580x830.webp',
          'https://img2.baidu.com/it/u=3770107681,3342712136&fm=253&fmt=auto&app=138&f=JPEG!cc_1580x830.webp'
      ],
      files: []
    }
  },
  created() {

  },
  methods: {

  }
}
</script>

<style>

</style>
