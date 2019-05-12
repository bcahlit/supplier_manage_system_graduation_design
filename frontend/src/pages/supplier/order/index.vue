<template>
  <d2-container>
    <el-dialog title="评价" style="margin-top: 0;" :visible.sync="orderDialogVisible">
      <el-form  size="mini" :model="commentForm" ref="commentForm" :rules="productRules">
        <el-form-item label="评论内容" prop="detail" :label-width="formLabelWidth">
          <el-input v-model="commentForm.detail" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="满意度(满分100)" prop="satisfaction" :label-width="formLabelWidth">
          <el-input v-model="commentForm.satisfaction" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="售后状态" prop="before_sale" :label-width="formLabelWidth">
          <el-input v-model="commentForm.before_sale" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancaleAddproduct">取 消</el-button>
        <el-button type="primary" @click="AddCommenttEvent">确 定</el-button>
      </div>
    </el-dialog>
    <el-form
      :inline="true"
      :model="form"
      :rules="rules"
      size="mini"
      ref="ruleForm"
      style="margin-bottom: -18px;">

      <el-form-item label="选择公司" prop="product_name" :label-width="formLabelWidth">
        <el-autocomplete
          class="inline-input"
          prop="number"
          v-model="form.name"
          :fetch-suggestions="querySearch"
          placeholder="请输入内容"
          @select="handleProductNameSelect"
        ></el-autocomplete>
      </el-form-item>

      <el-form-item>
        <el-button
          type="primary"
          @click="fetchProduct">
          <d2-icon name="search"/>
          查询
        </el-button>
      </el-form-item>

      <el-form-item>
        <el-button
          @click="handleSelectFormReset">
          <d2-icon name="refresh"/>
          重置
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

      <el-table-column label="公司名" width="120" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.supplier.name}}
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
              @click="handleGenerateOrder(scope.$index, scope.row)">评价</el-button>
            <el-button
              size="mini"
              type="danger"
              v-if="scope.row.state != 7"
              @click="handleDelete(scope.$index, scope.row)">退货</el-button>
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

import { addComment, updateComment } from '@api/supplier/comment/'
import { getSuppliers } from '@api/salesManager/supplier'
import { getOrders, updateOrder } from '@api/salesManager/order/'
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
      commentForm: {},
      form: {},
      supplier: null,
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
      productRules: {
        name: [ { required: true, message: '请选择产品', trigger: 'change' } ],
        number: [ { required: true, message: '请输入手机号', trigger: 'change' } ]
      },
      rules: {
        supplier_name: [ { required: true, message: '请输入公司名', trigger: 'change' } ]
      }
    }
  },
  methods: {
    handleGenerateOrder (index, row) {
      this.orderDialogVisible = true
      this.product = row
      if (row.comment) {
        this.commentForm = row.comment
        this.isEdit = true
      }
      // console.log('product',this.product)
    },
    cancaleAddproduct () {
      this.orderDialogVisible = false
      this.commentForm = {}
    },
    addProductButton () {
      this.commentForm = {}
      this.isAddCustom = true
      this.orderDialogVisible = true
    },
    handleProductNameSelect (item) {
      // console.log(item)
      this.supplier_id = item.id
      this.fetchProduct()
    },
    querySearch (queryString, cb) {
      // console.log(cb)
      getSuppliers({
        selectType: 'name',
        selectValue: queryString
      }).then(res => {
        // console.log(res)
        cb(res.suppliers.map(item => {
          item.value = item.name
          return item
        }))
      })
    },
    AddCommenttEvent () {
      if (this.isEdit) {
        updateComment({
          ...this.commentForm
        })
      } else {
        addComment({
          order_form_id: this.product.id,
          supplier_product_id: this.product.supplier_prodect,
          ...this.commentForm
        })
      }
      if (this.product.state === 4) {
        updateOrder({
          id: this.product.id,
          state: 5
        }).then(res => {
          this.orderDialogVisible = false
          this.fetchProduct()
          this.commentForm = {}
        })
      }
    },
    fetchProduct () {
      let params = {
        state: '3,4,5,6,7',
        // user_id: this.$store.state.d2admin.user.info.id,
        ...this.page
      }
      if (this.supplier_id) {
        params.supplier_id = this.supplier_id
      }
      getOrders({
        ...params
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
      })
    },
    handleDelete (index, row) {
      updateOrder({
        state: 7,
        id: row.id
      }).then(res => {
        this.cancaleAddproduct()
        this.fetchProduct()
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
