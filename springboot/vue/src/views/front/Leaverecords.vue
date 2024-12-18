<template>
  <div>
<!--    <div style="margin: 10px 0">-->
<!--      <el-input style="width: 200px; margin-left: 10px" placeholder="请输入请假描述" clearable v-model="name" ></el-input>-->
<!--      <el-button class="ml-5" type="primary" @click="load"><i class="el-icon-search" />搜索</el-button>-->
<!--      <el-button type="warning" @click="reset"><i class="el-icon-refresh" />刷新</el-button>-->
<!--    </div>-->
    <div style="margin: 10px 0">
      <el-button type="primary" @click="handleAdd" class="ml-10"><i class="el-icon-circle-plus-outline" />新增</el-button>
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
      <el-table-column prop="name" label="请假申请人" ></el-table-column>
      <el-table-column prop="content" label="请假理由" ></el-table-column>
      <el-table-column prop="createTime" label="创建时间" ></el-table-column>
      <el-table-column prop="startDate" label="请假起始日期" ></el-table-column>
      <el-table-column prop="endDate" label="请假结束日期" ></el-table-column>
      <el-table-column label="图片">
        <template slot-scope="scope">
          <el-image style="width: 100px; height: 100px" :src="scope.row.img" :preview-src-list="[scope.row.img]"></el-image>
        </template>
      </el-table-column>
      <el-table-column prop="state" label="进度"></el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button type="success" @click="handleEdit(scope.row)" :disabled="scope.row.state !== '待审核'"><i class="el-icon-edit-outline" />编辑</el-button>
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
    <el-dialog title="用户信息" :visible.sync="dialogFormVisible" width="30%">
      <el-form label-width="120px" size="small" :rules="rules" :model="form" ref="LeaverForm">
        <el-form-item label="请假理由" prop="content">
          <el-input v-model="form.content" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="请假起始日期" prop="startDate">
          <el-date-picker v-model="form.startDate" type="datetime" format="yyyy-MM-dd HH" value-format="yyyy-MM-dd HH" placeholder="选择日期时间"></el-date-picker>
        </el-form-item>
        <el-form-item label="请假结束日期" prop="endDate">
          <el-date-picker v-model="form.endDate" type="datetime" format="yyyy-MM-dd HH" value-format="yyyy-MM-dd HH" placeholder="选择日期时间"></el-date-picker>
        </el-form-item>
        <el-form-item label="请假图片">
          <el-upload action="http://localhost:9090/file/upload" ref="img" :on-success="handleImgUploadSuccess">
            <el-button size="small" type="primary">点击上传</el-button>
          </el-upload>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>
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
      dialogFormVisible: false,
      multipleSelection: [],
      headerBg: "headerBg",
      roles: [],
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      rules: {
        content: [
          { required: true, message: '请输入请假理由', trigger: 'blur' }
        ],
        startDate: [
        {  required: true, message: '请选择日期', trigger: 'change'}
      ],
        endDate: [
          {  required: true, message: '请选择日期', trigger: 'change'}
        ]
      }
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
    },
    home() {
      this.$router.push("/")
    },
    save() {
      this.$refs['LeaverForm'].validate((valid) => {
        if (valid) {  // 表单校验合法
          if (this.form.startDate >= this.form.endDate) {
            this.$message.error("起始日期必须小于结束日期")
            return false
          }
          this.request.post("/leaverecords", this.form).then(res => {
                if (res.code === '200') {
                  this.$message.success("保存成功")
                  this.dialogFormVisible = false
                  this.load()
                } else {
                  this.$message.error("保存失败")
                }
              })
        }
      });
    },
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
      if(this.$refs.img) {
        this.$refs.img.clearFiles();
      }
      if(this.$refs.file) {
        this.$refs.file.clearFiles();
      }
    },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
      if(this.$refs.img) {
        this.$refs.img.clearFiles();
      }
      if(this.$refs.file) {
        this.$refs.file.clearFiles();
      }
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
      this.name = ""
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
    handleImgUploadSuccess(res) {
      this.form.img = res
    },
  }
}

</script>

<style>
.headerBg {
  background: #eee!important;
}
</style>