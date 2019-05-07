<template>
  <d2-container>
    <el-dialog title="采购申请" style="margin-top: 0;" :visible.sync="orderDialogVisible">
      <el-form  size="mini" :model="productForm" ref="productForm" :rules="productRules">
        <el-form-item label="产品名" prop="product_name" :label-width="formLabelWidth">
          <el-autocomplete
            class="inline-input"
            v-model="productForm.name"
            :fetch-suggestions="querySearch"
            placeholder="请输入内容"
            @select="handleProductNameSelect"
          ></el-autocomplete>
        </el-form-item>
        <el-form-item label="数量" prop="price" :label-width="formLabelWidth">
          <el-input v-model="productForm.price" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="备注" prop="back_rate" :label-width="formLabelWidth">
          <el-input v-model="productForm.back_rate" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancaleAddproduct">取 消</el-button>
        <el-button type="primary" @click="AddPorductEvent">确 定</el-button>
      </div>
    </el-dialog>
    <el-form
      :inline="true"
      :model="form"
      :rules="rules"
      size="mini"
      ref="ruleForm"
      style="margin-bottom: -18px;">
<!-- 直接时间排序 不要搜索 -->
      <el-form-item>
        <el-button
          @click="addProductButton">
          <d2-icon name="plus"/>
          发起申请
        </el-button>
      </el-form-item>
    </el-form>
    <el-table
      :data="userTable"
      v-loading="loading"
      size="mini"
      stripe
      style="width: 100%;">

      <el-table-column label="产品名" width="120" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.name}}
        </template>
      </el-table-column>

      <el-table-column label="发起时间" width="120" align="center">
        <template slot-scope="scope">
            {{scope.row.date | date_format('YYYY-M-D')}}
        </template>
      </el-table-column>

      <el-table-column label="数量" width="150" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.number}}
        </template>
      </el-table-column>

      <el-table-column label="备注" width="150" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.remark}}
        </template>
      </el-table-column>

      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button-group>
            <el-button
              size="mini"
              type="info"
              @click="handleShow(scope.$index, scope.row)">修改</el-button>
            <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.$index, scope.row)">删除</el-button>
          </el-button-group>
        </template>
      </el-table-column>
    </el-table>
    <demo-page-footer
      slot="footer"
      :current="page.pageCurrent"
      :size="page.pageSize"
      :total="page.pageTotal"
      @change="handlePaginationChange"/>
  </d2-container>
</template>

<script>

import { getOrders, updateOrder, deleteOrder } from '@api/salesManager/order/'
export default {
  components: {
    'DemoPageFooter': () => import('@/components/PageFooter')
  },
  data () {
    return {
      productForm: {},
      innerVisible: false,
      order_details: {},
      currentOrderId: null,
      orderDialogVisible: false,
      formLabelWidth: '120px',
      userTable: [],
      showDetail: false,
      isEdit: false,
      isAddCustom: false,
      loading: false,
      page: {
        pageCurrent: 1,
        pageSize: 10,
        pageTotal: 0
      },
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
      form: {
        phone: '',
        selectValue: ''
      },
      rules: {
        selectValue: [ { required: true, message: '请输入手机号', trigger: 'change' } ]
      }
    }
  },
  methods: {
    handleShow (index, row) {
      this.order_details = row.order_details
      this.currentOrderId = row.id
      this.orderDialogVisible = true
      // console.log(row)
    },
    handleDetailBack (index, row) {
      console.log(row)
      updateOrderItem({
        id: row.id,
        state: 2
      }).then(res => {
        row.state=2
        updateOrder({
          id: this.currentOrderId,
          state: 2
        })
      })
    },
    onpick (pick) {
      console.log(pick[0])
      console.log(pick[1])
      console.log(this.form.showedDataValue)
    },
    handleOrderShow (index, row) {
      console.log(index, row)
      this.showDetail = true
      this.orderDetailForm = this.userTable[index]
      this.orderDialogVisible = true
    },
    handleDelete (index, row) {
      // console.log(index, row)
      deleteOrder({ id: row.id }).then(res => {
        console.log(res)
        this.handleFormSubmit()
        this.$message({
          message: '删除成功',
          type: 'success'
        })
      })
    },
    handleSelectFormReset () {
      this.$refs['ruleForm'].resetFields()
    },
    handlePaginationChange (val) {
      this.$notify({
        title: '分页变化',
        message: `当前第${val.current}页 共${val.total}条 每页${val.size}条`
      })
      console.log(val)
      this.page.current = val.current
      // nextTick 只是为了优化示例中 notify 的显示
      this.$nextTick(() => {
        this.handleFormSubmit()
      })
    },
    handleFormSubmit () {
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          console.log(this.page)
          // TODO 做一些转换 控制器也要做
          getOrders({
            ...this.form,
            ...this.page
          }).then(res => {
            // console.log(res)
            this.userTable = res.order_forms.map(item => {
              item.date = new Date(item.time)
              return item
            })
            this.page.pageCurrent = res.meta.currentPage
            // this.page.pageSize = res.pageSize
            this.page.pageTotal = res.meta.total
          })
        } else {
          this.$notify.error({
            title: '错误',
            message: '表单校验失败'
          })
          return false
        }
      })
    },
    handleFormReset () {
      this.$refs.form.resetFields()
    },
    handleSupplierNew () {
      this.$notify.error({
        title: '错误',
        message: '表单校验失败'
      })
    }
  }
}
</script>
