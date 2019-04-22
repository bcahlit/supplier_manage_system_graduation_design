<template>
  <d2-container>
    <el-dialog title="新建日程" :visible.sync="dialogFormVisible">
      <el-form :model="form" >
        <el-form-item label="日程内容" :label-width="formLabelWidth">
          <el-input v-model="form.detail" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="日程评级" :label-width="formLabelWidth">
          <el-select v-model="form.degree" placeholder="请选择评级">
            <el-option label="重要" value="2"></el-option>
            <el-option label="中等" value="1"></el-option>
            <el-option label="次要" value="0"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="日程内容" :label-width="formLabelWidth">
          <el-date-picker
            v-model="form.data"
            type="date"
            placeholder="选择日期">
          </el-date-picker>
        </el-form-item>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible = true">取 消</el-button>
          <el-button type="primary" @click="dialogFormVisible = true">确 定</el-button>
        </div>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="dialogFormVisible = false">确 定</el-button>
      </div>
    </el-dialog>
    <template slot="header">
      选则日程范围:
      <el-date-picker
        v-model="showedDataValue"
        type="daterange"
        align="right"
        unlink-panels
        range-separator="至"
        start-placeholder="开始日期"
        end-placeholder="结束日期"
        @change="onpick"
        :picker-options="pickerOptions">
      </el-date-picker>
      <el-button type="primary" style="margin-left: 20px;" @click="dialogFormVisible = true">新建日程</el-button>
    </template>
    Hello World
  </d2-container>
</template>

<script>
import { getNotes, addNotes, deleteNote } from '@/api/notes'
export default {
  data () {
    return {
      showedDataValue: null,
      dialogFormVisible: false,
      form: {
        detail: '',
        degree: '',
        data: '',
        date2: '',
        delivery: false,
        type: [],
        resource: '',
        desc: ''
      },
      formLabelWidth: '120px',
      pickerOptions: {
        shortcuts: [{
          text: '今天',
          onClick (picker) {
            const start = new Date()
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 7)
            picker.$emit('pick', [start, start])
          }
        }, {
          text: '最近一周',
          onClick (picker) {
            const end = new Date()
            const start = new Date()
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 7)
            picker.$emit('pick', [start, end])
          }
        }, {
          text: '最近一个月',
          onClick (picker) {
            const end = new Date()
            const start = new Date()
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 30)
            picker.$emit('pick', [start, end])
          }
        }, {
          text: '最近三个月',
          onClick (picker) {
            const end = new Date()
            const start = new Date()
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 90)
            picker.$emit('pick', [start, end])
          }
        }]
      },
      columns: [
        {
          title: '日期',
          key: 'created_at',
          width: '200'
        }, {
          title: '标题',
          key: 'title',
          width: '200'
        }, {
          title: '内容',
          key: 'context'
        }
      ],
      data: [],
      loading: false,
      addTemplate: {
        title: {
          title: '标题',
          value: ''
        },
        context: {
          title: '内容',
          value: ''
        }
      },
      formOptions: {
        labelWidth: '80px',
        labelPosition: 'left',
        saveLoading: false
      },
      rowHandle: {
        width: '150',
        remove: {
          icon: 'el-icon-delete',
          size: 'small',
          fixed: 'right',
          confirm: true,
          show (index, row) {
            return true
          },
          disabled (index, row) {
            return false
          }
        }
      }
    }
  },
  mounted () {
  },
  methods: {
    onpick (pick) {
      console.log(pick)
      console.log(this.showedDataValue)
    },
    handleRowRemove ({ index, row }, done) {
      deleteNote({ id: row.id }).then(res => {
        console.log(res)
        this.$message({
          message: '删除成功',
          type: 'success'
        })
        done()
        this.fetchData()
      })
      // console.log(index)
    },
    handleDialogOpen ({ mode }) {
      this.$message({
        message: '打开新增，模式为：' + mode,
        type: 'success'
      })
    },
    paginationCurrentChange (currentPage) {
      // console.log(currentPage)
      this.pagination.currentPage = currentPage
      this.fetchData()
    },
    fetchData () {
      this.loading = true
      getNotes({ 'page': this.pagination.currentPage }).then(res => {
        // console.log(res)
        this.data = res.notes
        this.pagination.pageSize = res.pageSize
        this.pagination.total = res.total
        this.loading = false
      }).catch(err => {
        this.loading = false
        console.log(err)
      })
    // console.log(this.$refs.d2Crud.d2CrudData) // 获取表格数据
    },
    // 普通的新增
    addSchedule () {
      alert('wobeidianjil')
      this.dialogFormVisible = false
      console.log(this.form)
    },
    handleRowAdd (row, done) {
      // console.log(row)
      this.formOptions.saveLoading = true
      addNotes(row).then(res => {
        // console.log(res)
        this.$message({
          message: '保存成功',
          type: 'success'
        })
        done()
        this.formOptions.saveLoading = false
      }).catch(err => {
        console.log(err)
        done(false)
      }).then(res => {
        this.formOptions.saveLoading = false
      })
    },
    handleDialogCancel (done) {
      this.$message({
        message: '取消保存',
        type: 'warning'
      })
      done()
    }
  }
}
</script>
