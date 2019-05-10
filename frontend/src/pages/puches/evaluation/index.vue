<template>
  <d2-container>
    <el-dialog title="评论" style="margin-top: 0;" :visible.sync="orderDialogVisible">
      <el-form  size="mini" :model="productForm" ref="productForm" :rules="productRules">
        <el-form-item label="评论内容" prop="detail" :label-width="formLabelWidth">
          <el-input v-model="productForm.detail" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="满意度(满分100)" prop="satisfaction" :label-width="formLabelWidth">
          <el-input v-model="productForm.satisfaction" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="售后状态" prop="before_sale" :label-width="formLabelWidth">
          <el-input v-model="productForm.before_sale" autocomplete="off"></el-input>
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
          <el-button
            size="mini"
            type="primary"
            v-if="scope.row.state == 4"
            @click="handleCommit(scope.$index, scope.row)">评价</el-button>
          <el-button
            size="mini"
            v-if="scope.row.state == 5"
            type="primary"
            @click="handleEdit(scope.$index, scope.row)">重新评价</el-button>
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
      productForm: {},
      innerVisible: false,
      order_details: {},
      currentOrderId: null,
      orderDialogVisible: false,
      formLabelWidth: '120px',
      userTable: [],
      showDetail: false,
      isEdit: false,
      isCommit: false,
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
        detail: [ { required: true, message: '请输入评论', trigger: 'change' } ],
        satisfaction: [ { required: true, message: '请输入满意度', trigger: 'change' } ]
      },
      rules: {
        selectValue: [ { required: true, message: '请输入手机号', trigger: 'change' } ]
      }
    }
  },
  methods: {
    handleCommit (index, row) {
      this.productForm = {}
      this.orderDialogVisible = true
      this.isCommit = true
      console.log(row)
      // addComment({
      //   supplier_product_id: 
      // })
    },
    cancaleAddproduct () {
      this.orderDialogVisible = false
      this.productForm = {}
    },
    AddPorductEvent () {
      if (this.isCommit){
        this.isCommit = false
        // addComment
        // updateOrder
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
        state: '4,5,6',
        // user_id: this.$store.state.d2admin.user.info.id, 验收员评价 应该与申请人没啥关系
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
      // 获取产品的时候顺便获取评论
      this.isEdit = true
      this.productForm = row
      this.orderDialogVisible = true
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
