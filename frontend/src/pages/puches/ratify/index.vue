<template>
  <d2-container>
    <el-dialog title="采购申请" style="margin-top: 0;" :visible.sync="orderDialogVisible">
      <el-form  size="mini" :model="productForm" ref="productForm" :rules="productRules">
        <el-form-item label="选择公司" prop="product_name" :label-width="formLabelWidth">
          <el-autocomplete
            class="inline-input"
            prop="number"
            v-model="productForm.name"
            :fetch-suggestions="querySearch"
            placeholder="请输入内容"
            @select="handleProductNameSelect"
          ></el-autocomplete>
        </el-form-item>
        <el-form-item label="总价" :label-width="formLabelWidth">
          {{ currentProduct.totalPrice }}
        </el-form-item>
        <el-form-item label="退货率" :label-width="formLabelWidth">
          {{ currentProduct.back_rate}}
        </el-form-item>
        <el-form-item label="合格率" :label-width="formLabelWidth">
          {{ currentProduct.standard}}
        </el-form-item>
        <el-form-item label="其他" :label-width="formLabelWidth">
          {{ currentProduct.commit}}
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancaleAddproduct">取 消</el-button>
        <el-button type="primary" @click="AddPorductEvent">确 定</el-button>
      </div>
    </el-dialog>
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
              type="info"
              v-if="scope.row.state == 0"
              @click="handleRatify(scope.$index, scope.row)">批准</el-button>
            <el-button
              size="mini"
              type="primary"
              v-if="scope.row.state == 2"
              @click="handleGenerateOrder(scope.$index, scope.row)">生成订单</el-button>
            <el-button
              size="mini"
              type="danger"
              v-if="scope.row.state == 0"
              @click="handleDelete(scope.$index, scope.row)">拒绝</el-button>
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

import { getOrders, updateOrder, getSuppliers, getSupplierProductDetail } from '@api/salesManager/order/'
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
      orderDialogVisible: false,
      formLabelWidth: '80px',
      userTable: [],
      isEdit: false,
      isAddCustom: false,
      loading: false,
      currentProduct: {},
      product: {},
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
    handleGenerateOrder (index, row) {
      this.orderDialogVisible = true
      this.product = row
    },
    cancaleAddproduct () {
      this.orderDialogVisible = false
      this.productForm = {}
    },
    addProductButton () {
      this.productForm = {}
      this.isAddCustom = true
      this.orderDialogVisible = true
    },
    handleProductNameSelect (item) {
      this.productForm.product_id = item.id
    },
    querySearch (queryString, cb) {
      // console.log(cb)
      getSuppliers({
        product_id: this.product.id
      }).then(res => {
        console.log(res)
        cb(res.suppliers.map(item => {
          item.value = item.name
          return item
        }))
        getSupplierProductDetail({
          product_id: this.product.id,
          supplier_id: res.suppliers[0].id
        }).then(spres => {
          this.currentProduct = spres.supplier_products[0]
          this.currentProduct.totalPrice = this.currentProduct.price * this.product.number
        })
      })
    },
    AddPorductEvent () {
      updateOrder({
        id: this.product.id,
        state: 3,
        supplier_id: this.currentProduct.id,
        reviewer_id: this.$store.state.d2admin.user.info.id,
        total_price: this.currentProduct.totalPrice
      }).then(res => {
        this.orderDialogVisible = false
        this.fetchProduct()
        this.productForm = {}
      })
    },
    fetchProduct () {
      getOrders({
        state: '0,2',
        // user_id: this.$store.state.d2admin.user.info.id,
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
    handleRatify (index, row) {
      updateOrder({
        state: 2,
        reviewer_id: this.$store.state.d2admin.user.info.id,
        id: row.id
      }).then(res => {
        this.cancaleAddproduct()
        this.fetchProduct()
        // console.log(res)
      })
    },
    handleDelete (index, row) {
      updateOrder({
        state: 1,
        reviewer_id: this.$store.state.d2admin.user.info.id,
        id: row.id
      }).then(res => {
        this.cancaleAddproduct()
        this.fetchProduct()
        // console.log(res)
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
