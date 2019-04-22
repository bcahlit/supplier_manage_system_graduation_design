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
      :loading="loading"
      :pagination="pagination"
      :rowHandle="rowHandle"
      @row-remove="handleRowRemove"
      @pagination-current-change="paginationCurrentChange"
      style="padding: 5px">
      <el-button slot="header" @click="addRow">新增</el-button>
    </d2-crud>
  </div>
</template>

<script>
import { getNotes, addNotes, deleteNote } from '@/api/notes'
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
      loading: false,
      pagination: {
        currentPage: 1,
        pageSize: 10,
        total: 6
      },
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
            // if (row.showRemoveButton) {
            return true
            // }
            // return false
          },
          disabled (index, row) {
            // if (row.forbidRemove) {
            //   return true
            // }
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
    handleRowRemove ({ index, row }, done) {
      deleteNote({ id: row.id }).then(res => {
        // console.log(res)
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
        this.pagination.pageSize = res.pageSize
        this.pagination.total = res.total
        this.data = res.notes.map(item => {
          item.created_at = item.created_at.replace('T',' ').slice(0,15)
          return item
        })
        this.loading = false
      }).catch(err => {
        this.loading = false
        console.log(err)
      })
    // console.log(this.$refs.d2Crud.d2CrudData) // 获取表格数据
    },
    // 普通的新增
    addRow () {
      this.$refs.d2Crud.showDialog({
        mode: 'add'
      })
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
