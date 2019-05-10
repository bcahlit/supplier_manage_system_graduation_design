<template>
  <d2-container>
    <el-table
      :data="userTable"
      v-loading="loading"
      size="mini"
      stripe
      style="width: 100%;">

      <el-table-column label="产品名" width="120" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.product.name}}
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
              type="primary"
              @click="handleDelete(scope.$index, scope.row)">到货</el-button>
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

import { getProducts } from '@api/saleSupport/product'
import { getOrders, addOrder, updateOrder, deleteOrder } from '@api/salesManager/order/'
export default {
  components: {
    'DemoPageFooter': () => import('@/components/PageFooter')
  },
  created () {
    this.fetchProduct()
  },
  activated () {
    this.fetchProduct()
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
      form: {
        phone: '',
        selectValue: ''
      },
      productRules: {
        name: [ { required: true, message: '请选择产品', trigger: 'change' } ],
        number: [ { required: true, message: '请输入手机号', trigger: 'change' } ]
      },
      rules: {
        selectValue: [ { required: true, message: '请输入手机号', trigger: 'change' } ]
      }
    }
  },
  methods: {
    cancaleAddproduct () {
      this.orderDialogVisible = false
      this.productForm = {}
    },
    addProductButton () {
      this.productForm = {}
      this.isAddCustom = true
      this.orderDialogVisible = true
    },
    AddPorductEvent () {
      if (this.isAddCustom) {
        this.isAddCustom = false
        delete this.productForm.name
        addOrder({
          state: 0,
          time: Date.parse(new Date()),
          user_id: this.$store.state.d2admin.user.info.id,
          ...this.productForm
        }).then(res => {
          this.cancaleAddproduct()
        })
      }
      if (this.isEdit) {
        this.isEdit = false
        delete this.productForm.name
        updateOrder({
          user_id: this.$store.state.d2admin.user.info.id,
          ...this.productForm
        }).then(res => {
          this.cancaleAddproduct()
        })
      }
    },
    fetchProduct () {
      getOrders({
        state: '3',
        user_id: this.$store.state.d2admin.user.info.id,
        ...this.page
      }).then(res => {
        this.userTable = res.order_forms.map(item => {
          item.date = new Date(item.time)
          return item
        })
        this.page.pageCurrent = res.meta.currentPage
        this.page.pageTotal = res.meta.total
      })
    },
    handleEdit (index, row) {
      this.isEdit = true
      this.productForm = row
      this.productForm.name = row.product.name
      this.orderDialogVisible = true
    },
    handleDelete (index, row) {
      delete this.productForm.name
      updateOrder({
        state: 4,
        ...this.productForm
      }).then(res => {
        this.cancaleAddproduct()
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
        this.fetchProduct()
      })
    }
  }
}
</script>