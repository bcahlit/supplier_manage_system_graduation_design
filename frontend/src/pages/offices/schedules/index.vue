<template>
  <d2-container>
    <!-- Form -->
    <el-dialog title="新建日程" :visible.sync="dialogFormVisible">
      <el-form :model="form" ref="form" :rules="rules">
        <el-form-item label="日程内容" prop="detail" :label-width="formLabelWidth">
          <el-input v-model="form.detail" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="日程评级" prop="degre" :label-width="formLabelWidth">
          <el-select v-model="form.degre" placeholder="请选择评级">
            <el-option label="重要" value="2"></el-option>
            <el-option label="中等" value="1"></el-option>
            <el-option label="次要" value="0"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="日程内容" prop="date" :label-width="formLabelWidth">
          <el-date-picker v-model="form.date" type="datetime" placeholder="选择日期"></el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancaleSchedule">取 消</el-button>
        <el-button type="primary" @click="addSchedule">确 定</el-button>
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
        :picker-options="pickerOptions"
      ></el-date-picker>
      <el-button type="primary" style="margin-left: 20px;" @click="dialogFormVisible = true">新建日程</el-button>
    </template>
    <d2-crud
      ref="d2Crud"
      :columns="columns"
      :data="data"
      :options="options"
      :rowHandle="rowHandle"
      @row-remove="handleRowRemove"/>
  </d2-container>
</template>

<script>
import { getSchedules, addSchedule, deleteSchedule } from '@/api/notes'
export default {
  data () {
    return {
      showedDataValue: null,
      dialogFormVisible: false,
      columns: [
        {
          title: '日期',
          key: 'date',
          width: '180'
        },
        {
          title: '事项',
          key: 'detail'
        }
      ],
      data: [
        {
          date: '2016-05-02',
          degre: 2,
          detail: '上海市普陀区金沙江路 1518 弄'
        },
        {
          date: '2016-05-04',
          degre: 0,
          detail: '上海市普陀区金沙江路 1517 弄'
        },
        {
          date: '2016-05-01',
          degre: 1,
          detail: '上海市普陀区金沙江路 1519 弄'
        },
        {
          date: '2016-05-03',
          degre: 2,
          detail: '上海市普陀区金沙江路 1516 弄'
        }
      ],
      options: {
        rowClassName ({ row, rowIndex }) {
          switch (row.degre) {
            case 2:
              return 'warning-row'
            case 1:
              return 'success-row'
            default: return ''
          }
        }
      },
      form: {
        detail: '',
        degre: '',
        date: null
      },
      rules: {
        detail: [
          { required: true, message: '请输入日程名称', trigger: 'blur' }
        ],
        degre: [
          { required: true, message: '请选择重要性', trigger: 'change' }
        ],
        date: [
          { type: 'date', required: true, message: '请选择日期', trigger: 'change' }
        ]
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
      rowHandle: {
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
  methods: {
    onpick (pick) {
      console.log(Date.parse(pick[0]))
      console.log(Date.parse(pick[1]))
    },
    cancaleSchedule () {
      this.$refs['form'].resetFields()
      this.dialogFormVisible = false
    },
    addSchedule () {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          // todo netwerk
          console.log(this.form.date)
          console.log(Date.parse(this.form.date))
          this.cancaleSchedule()
        } else {
          console.log('error submit!!')
          this.dialogFormVisible = true
        }
      })
    },
    handleRowRemove ({ index, row }, done) {
      setTimeout(() => {
        console.log(index)
        console.log(row)
        this.$message({
          message: '删除成功',
          type: 'success'
        })
        done()
      }, 300)
    }
  }
}
</script>

<style>
.el-table .warning-row {
  background: rgb(250, 137, 44);
}

.el-table .success-row {
  background: #ecfc91;
}
</style>
