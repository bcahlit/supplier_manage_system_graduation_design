<template>
  <d2-container>
    <el-dialog title="采购申请" style="margin-top: 0;" :visible.sync="orderDialogVisible">
      <el-form  size="mini" :model="productForm" ref="productForm" :rules="productRules">
        <el-form-item label="产品名" prop="product_name" :label-width="formLabelWidth">
          <el-autocomplete
            class="inline-input"
            prop="number"
            v-model="productForm.name"
            :fetch-suggestions="querySearch"
            placeholder="请输入内容"
            @select="handleProductNameSelect"
          ></el-autocomplete>
        </el-form-item>
        <el-form-item label="数量" prop="number" :label-width="formLabelWidth">
          <el-input v-model="productForm.number" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="备注" prop="remark" :label-width="formLabelWidth">
          <el-input v-model="productForm.remark" autocomplete="off"></el-input>
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
              @click="handleEdit(scope.$index, scope.row)">修改</el-button>
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
    handleProductNameSelect (item) {
      this.productForm.product_id = item.id
    },
    querySearch (queryString, cb) {
      getProducts({
        selectType: 'name',
        selectValue: queryString
      }).then(res => {
        cb(res.products.map(item => {
          item.value = item.name
          return item
        }))
      })
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
        this.productForm.state = 0
        updateOrder({
          ...this.productForm
        }).then(res => {
          this.cancaleAddproduct()
        })
      }
    },
    fetchProduct () {
      getOrders({
        state: '0,1',
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
      deleteOrder({ id: row.id }).then(res => {
        // console.log(res)
        this.fetchProduct()
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
        this.fetchProduct()
      })
    }
  }
}
</script>
