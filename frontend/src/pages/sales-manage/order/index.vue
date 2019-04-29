<template>
  <d2-container>
    <el-dialog style="margin-top: 0;" :visible.sync="productDialogFormVisible">
      <!-- <el-form  size="mini" :model="productForm" ref="productForm" :rules="productRules">
        <el-form-item label="产品名称" prop="name" :label-width="formLabelWidth">
          <el-input v-model="productForm.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="总数" prop="total" :label-width="formLabelWidth">
          <el-input v-model="productForm.total" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="大小" prop="size" :label-width="formLabelWidth">
          <el-input v-model="productForm.size" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="产品号" prop="number" :label-width="formLabelWidth">
          <el-input v-model="productForm.number" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="类型" prop="type" :label-width="formLabelWidth">
          <el-input v-model="productForm.type" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="备注" prop="remark" :label-width="formLabelWidth">
          <el-input v-model="productForm.remark" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="价格" prop="price" :label-width="formLabelWidth">
          <el-input v-model="productForm.price" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="颜色" prop="color" :label-width="formLabelWidth">
          <el-input v-model="productForm.color" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="品牌" prop="band" :label-width="formLabelWidth">
          <el-date-picker v-model="productForm.band" type="date" placeholder="选择日期"></el-date-picker>
        </el-form-item>
        <el-form-item label="分类" prop="classify" :label-width="formLabelWidth">
          <el-input v-model="productForm.classify" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="简介" prop="introduction" :label-width="formLabelWidth">
          <el-input v-model="productForm.introduction" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancaleAddproduct">取 消</el-button>
        <el-button type="primary" @click="AddPorductEvent">确 定</el-button>
      </div> -->
    </el-dialog>
    <el-form
      :inline="true"
      :model="form"
      :rules="rules"
      size="mini"
      ref="ruleForm"
      style="margin-bottom: -18px;">

      <el-form-item label="客户手机号" prop="phone">
        <el-input
          v-model="form.phone"
          style="width: 120px;"/>
      </el-form-item>
      <!-- <el-form-item label="最低价格" prop="total_price">
        <el-input
          v-model="form.total_price"
          style="width: 70px;"/>
      </el-form-item> -->
      <!-- TODO 有时间在写时间 -->
      <!-- <el-form-item label="时间" prop="phone">
        <el-date-picker
            type="daterange"
            align="right"
            unlink-panels
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            @change="onpick"
            style="width: 220px;"
            :picker-options="pickerOptions"
          ></el-date-picker>
      </el-form-item> -->
      <el-form-item>
        <el-button
          type="primary"
          @click="handleFormSubmit">
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

      <el-table-column label="客户名" width="160" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.customer.name}}
        </template>
      </el-table-column>

      <el-table-column label="时间" width="160" align="center">
        <template slot-scope="scope">
            {{scope.row.date|date_format('YYYY-M-D')}}
        </template>
      </el-table-column>

      <el-table-column label="积分" width="150" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.score}}
        </template>
      </el-table-column>

      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button-group>
            <el-button
              size="mini"
              type="info"
              @click="handleShow(scope.$index, scope.row)">详情</el-button>
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
import { deleteOrderItem } from '@api/salesManager/order_detail'
import { getOrders, updateProduct, addProduct, deleteProduct } from '@api/salesManager/order/'
export default {
  components: {
    'DemoPageFooter': () => import('@/components/PageFooter')
  },
  data () {
    return {
      productDialogFormVisible: false,
      formLabelWidth: '120px',
      productForm: {
        name: '',
        total: null,
        number: '',
        type: '',
        time: null,
        remark: '',
        price: null,
        color: '',
        size: '',
        band: '',
        classify: null,
        introduction: ''
      },
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
    onpick (pick) {
      console.log(pick[0])
      console.log(pick[1])
      console.log(this.form.showedDataValue)
    },
    handleShow (index, row) {
      console.log(index, row)
      this.showDetail = true
      this.productForm = this.userTable[index]
      this.productDialogFormVisible = true
    },
    handleDelete (index, row) {
      console.log(index, row)
      deleteProduct({ id: row.id }).then(res => {
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
      this.page = val
      // nextTick 只是为了优化示例中 notify 的显示
      this.$nextTick(() => {
        this.handleFormSubmit()
      })
    },
    handleFormSubmit () {
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          // TODO 做一些转换 控制器也要做
          getOrders({
            ...this.form,
            ...this.page
          }).then(res => {
            console.log(res)
            this.userTable = res.order_forms.map(item => {
              item.date = new Date(item.time)
              // console.log(item)
              return item
            })
            // this.page.pageCurrent = res.currentPage
            // // this.page.pageSize = res.pageSize
            // this.page.pageTotal = res.total
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
    handleCustomerNew () {
      this.$notify.error({
        title: '错误',
        message: '表单校验失败'
      })
    }
  }
}
</script>
