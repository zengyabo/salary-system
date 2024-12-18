<template xmlns="">
  <div>
        <div style="margin: 10px 0">
          <el-input style="width: 200px; margin-left: 10px" placeholder="请输入用户名" clearable suffix-icon="el-icon-user" v-model="name" ></el-input>
          <el-button class="ml-5" type="primary" @click="load"><i class="el-icon-search" />搜索</el-button>
          <el-button type="warning" @click="reset"><i class="el-icon-refresh" />刷新</el-button>

        </div>
    <div style="margin: 10px 0">
      <!--      <el-button type="primary" @click="handleAdd" class="ml-10"><i class="el-icon-circle-plus-outline" />新增</el-button>-->
      <el-popconfirm
          class="ml-5"
          confirm-button-text='确认'
          cancel-button-text='取消'
          icon="el-icon-info"
          icon-color="red"
          title="确定批量删除这些信息吗？"
          @confirm="delBatch">
        <el-button type="danger" slot="reference" ><i class="el-icon-remove-outline" />删除</el-button>
      </el-popconfirm>
    </div>
    <el-table :data="tableData" border stripe :header-cell-class-name="headerBg"
              @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"></el-table-column>
<!--      <el-table-column prop="id" label="Id" ></el-table-column>-->
      <el-table-column prop="name" label="请假人姓名" ></el-table-column>
      <el-table-column prop="content" label="请假理由" ></el-table-column>
      <el-table-column prop="createTime" label="创建时间" ></el-table-column>
      <el-table-column prop="startDate" label="请假起始日期" ></el-table-column>
      <el-table-column prop="endDate" label="请假结束日期" ></el-table-column>
      <el-table-column prop="img" label="详情图片" >
        <template slot-scope="scope">
          <el-image style="width: 100px; height: 100px" :src="scope.row.img" :preview-src-list="[scope.row.img]"></el-image>
        </template>
      </el-table-column>
      <el-table-column prop="state" label="进度"></el-table-column>
      <el-table-column label="审核" width="240">
        <template v-slot="scope">
          <el-button type="success" @click="changeState(scope.row, '审核通过...你可以滚回去了')" :disabled="scope.row.state !== '待审核'">审核通过</el-button>
          <el-button type="danger" @click="changeState(scope.row, '审核不通过...就不让你过嘿嘿')" :disabled="scope.row.state !== '待审核'">审核不通过</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div style="padding: 10px 0">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="pageNum"
          :page-sizes="[ 5, 10, 15]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </div>

  </div>
</template>

<script>
export default {
  name: "Leaverecords",
  data() {
    return {
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 5,
      name: "",
      form: {},
      // dialogFormVisible: false,
      multipleSelection: [],
      headerBg: "headerBg",
      roles: [],
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
    }
  },
  created() {
    this.load()
  },
  methods: {
    load: function () {
      this.request.get("/leaverecords/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          name: this.name,
        }
      }).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
      })
      this.request.get("/role").then(res => {
        this.roles = res.data
      })
    },
    home() {
      this.$router.push("/")
    },
    save() {
      this.request.post("/leaverecords", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("审核成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
    },
    handleEdit(row) {
      this.form = row
      this.dialogFormVisible = true
    },
    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val;
    },
    delBatch() {
      let ids = this.multipleSelection.map(v => v.id)  //[{}, {}, {}] => [1,2,3]
      this.request.post("/leaverecords/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("删除信息成功")
          this.load()
        } else {
          this.$message.error("删除信息失败")
        }
      })
    },
    reset() {
      this.username = ""
      this.load()
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },
    changeState(row, state) {
      this.form = JSON.parse(JSON.stringify(row))
      this.form.state = state;
      this.save();
    },
    // handleImgUploadSuccess() {
    //   this.$message.success("图片上传成功")
    //   this.load()
    // },
  }
}
</script>

<style>
.headerBg {
  background: #eee!important;
}
</style>