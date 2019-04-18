<template>
  <div>
    <d2-crud
      ref="d2Crud"
      :columns="columns"
      :data="data"
      add-title="添加便笺"
      :add-template="addTemplate"
      :form-options="formOptions"
      @dialog-open="handleDialogOpen"
      @row-add="handleRowAdd"
      @dialog-cancel="handleDialogCancel"
      style="padding: 5px">
      <el-button slot="header" @click="addRow">新增</el-button>
    </d2-crud>
  </div>
</template>

<script>
import { getNotes, addNotes } from '@/api/notes'
export default {
  data () {
    return {
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
      }
    }
  },
  mounted () {
    getNotes({}).then(res => {
      console.log(res)
      this.data = res
    }).catch(err => {
      console.log(err)
    })
    console.log(this.$refs.d2Crud.d2CrudData) // 获取表格数据
  },
  methods: {
    handleDialogOpen ({ mode }) {
      this.$message({
        message: '打开新增，模式为：' + mode,
        type: 'success'
      })
    },
    // 普通的新增
    addRow () {
      this.$refs.d2Crud.showDialog({
        mode: 'add'
      })
    },
    handleRowAdd (row, done) {
      this.formOptions.saveLoading = true
      addNotes(row).then(res => {
        console.log(res)
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
      // setTimeout(() => {
      //   console.log(row)
      //   // done可以传入一个对象来修改提交的某个字段
      //   done({
      //     address: '我是通过done事件传入的数据！'
      //   })
      //   this.formOptions.saveLoading = false
      // }, 300)
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
