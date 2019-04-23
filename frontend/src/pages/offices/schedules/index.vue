<template>
  <d2-container style="margin-bottom: -18px;">
    <!-- Form -->
    <el-dialog title="新建日程" :visible.sync="dialogFormVisible">
      <el-form :model="form" ref="form" :rules="rules">
        <el-form-item label="日程内容" prop="detail" :label-width="formLabelWidth">
          <el-input v-model="form.detail" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="日程评级" prop="degree" :label-width="formLabelWidth">
          <el-select v-model="form.degree" placeholder="请选择评级">
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
        <el-button type="primary" @click="addScheduleButton">确 定</el-button>
      </div>
    </el-dialog>
    <template slot="header" >
      <el-form
      size="mini"
      :inline="true"
      style="margin-bottom: -18px;">
        <el-form-item label="选则日程范围：">
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
        </el-form-item>
        <el-form-item>
          <el-button type="primary" style="margin-left: 20px;" @click="dialogFormVisible = true">新建日程</el-button>
        </el-form-item>
      </el-form>
    </template>
    <d2-crud
      ref="d2Crud"
      :columns="columns"
      :data="data"
      :loading="loading"
      :options="options"
      :rowHandle="rowHandle"
      @row-remove="handleRowRemove"/>
  </d2-container>
</template>

<script>
import { getSchedules, addSchedule, deleteSchedule } from '@/api/offices/schedules'
export default {
  data () {
    return {
      showedDataValue: null,
      dialogFormVisible: false,
      loading: false,
      columns: [
        {
          title: '日期',
          key: 'out_date',
          width: '180'
        },
        {
          title: '事项',
          key: 'detail'
        }
      ],
      data_raw: [],
      data: [],
      options: {
        rowClassName ({ row, rowIndex }) {
          switch (row.degree) {
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
        degree: '',
        date: null
      },
      rules: {
        detail: [
          { required: true, message: '请输入日程名称', trigger: 'blur' }
        ],
        degree: [
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
  mounted () {
    this.fetchData()
  },
  methods: {
    onpick (pick) {
      // console.log(Date.parse(pick[0]))
      // console.log(Date.parse(pick[1]))
      // console.log(this.data_raw)
      this.setSchedule(Date.parse(pick[0])/1000,Date.parse(pick[1])/1000)
    },
    cancaleSchedule () {
      this.$refs['form'].resetFields()
      this.dialogFormVisible = false
    },
    addScheduleButton () {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          addSchedule({
            date: Date.parse(this.form.date)/1000,
            detail: this.form.detail,
            link: '#',
            degree: this.form.degree
          }).then(res => {
            this.dialogFormVisible = true
            console.log(res)
            this.cancaleSchedule()
            this.fetchData()
          }).catch(err => {
            console.log(err)
          })
        } else {
          console.log('error submit!!')
          this.dialogFormVisible = true
        }
      })
    },
    handleRowRemove ({ index, row }, done) {
      deleteSchedule({ id: row.id }).then(res => {
        console.log(res)
        this.$message({
          message: '删除成功',
          type: 'success'
        })
        done()
        // this.fetchData()
      })
    },
    fetchData () {
      this.loading = true
      getSchedules({}).then(res => {
        // console.log(res) 这里还需要其他操作
        // this.data = res
        this.data_raw = res
        let timeStamp = new Date(new Date().setHours(0, 0, 0, 0)) / 1000
        this.setSchedule(timeStamp,timeStamp+86400)
        this.loading = false
      }).catch(err => {
        this.loading = false
        console.log(err)
      })
    // console.log(this.$refs.d2Crud.d2CrudData) // 获取表格数据
    },
    setSchedule(startDate,endDate){
      let [...filter_data] = this.data_raw.filter(item => {
        return item.date>startDate && item.date<endDate
      })
      console.log(filter_data)
      let map_data= filter_data.map(item => {
        let t_date = new Date(item.date*1000)
        item.out_date=t_date.toLocaleString('en-GB', { timeZone: 'Asia/Shanghai' })
        return item
      })
      console.log(map_data)
      this.data = map_data
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
