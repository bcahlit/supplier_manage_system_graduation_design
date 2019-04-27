<template>
  <d2-container>
    <el-dialog style="margin-top: 0;" :visible.sync="productDialogFormVisible">
      <el-form  size="mini" :model="productForm" ref="productForm" :rules="productRules">
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
      </div>
    </el-dialog>
    <el-form
      :inline="true"
      :model="form"
      :rules="rules"
      size="mini"
      ref="ruleForm"
      style="margin-bottom: -18px;">

      <el-form-item label="类型">
        <el-select v-model="form.selectType" placeholder="产品名称">
          <el-option label="产品名称" value='name'></el-option>
          <el-option label="产品编号" value='number'></el-option>
          <el-option label="产品尺寸" value='size'></el-option>
          <el-option label="产品品牌" value='band'></el-option>
          <el-option label="产品分类" value='classify'></el-option>
          <el-option label="产品简介" value='introduction'></el-option>
        </el-select>
      </el-form-item>
      <el-form-item prop="phone">
        <el-input
          v-model="form.selectValue"
          placeholder=""
          style="width: 130px;"/>
      </el-form-item>

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

      <el-form-item>
        <el-button
          @click="productDialogFormVisible = true">
          <d2-icon name="plus"/>
          添加
        </el-button>
      </el-form-item>

    </el-form>
    <el-table
      :data="userTable"
      v-loading="loading"
      size="mini"
      stripe
      style="width: 100%;">

      <el-table-column label="产品名" width="160" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.name}}
        </template>
      </el-table-column>

      <el-table-column label="尺寸" width="160" align="center">
        <template slot-scope="scope">
            {{scope.row.size}}
        </template>
      </el-table-column>

      <el-table-column label="编号" width="80">
        <template slot-scope="scope">
          {{scope.row.number}}
        </template>
      </el-table-column>

      <el-table-column label="价格" width="150" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.price}}
        </template>
      </el-table-column>

      <el-table-column label="数量" width="80" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.total}}
        </template>
      </el-table-column>

      <el-table-column label="类型" width="50" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.type}}
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
              type="primary"
              @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
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

import { getProducts, updateProduct, addProduct, deleteProduct } from '@api/saleSupport/product'
export default {
  components: {
    'DemoPageFooter': () => import('./componnets/PageFooter')
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
      productRules: {
        total: [ { required: true, message: '请输入总数', trigger: 'change' } ],
        number: [ { required: true, message: '请输入产品号', trigger: 'change' } ],
        size: [ { required: true, message: '请输入大小', trigger: 'change' } ],
        name: [ { required: true, message: '请输入产品名', trigger: 'change' } ]
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
      form: {
        selectType: 'name',
        selectValue: ''
      },
      rules: {
        selectValue: [ { required: true, message: '请输入手机号', trigger: 'change' } ]
      }
    }
  },
  methods: {
    handleShow (index, row) {
      console.log(index, row)
      this.showDetail = true
      this.productForm = this.userTable[index]
      this.productDialogFormVisible = true
    },
    handleEdit (index, row) {
      console.log(index, row)
      this.isEdit = true
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
    cancaleAddproduct () {
      this.$refs['productForm'].resetFields()
      this.productDialogFormVisible = false
    },
    handleSelectFormReset () {
      this.$refs['ruleForm'].resetFields()
    },
    AddPorductEvent () {
      if (this.showDetail) {
        this.cancaleAddproduct()
        this.showDetail = false
      }
      if (this.isEdit) {
        updateProduct({
          ...this.productForm
        }).then(res => {
          console.log(res)
          this.cancaleAddproduct()
          this.form.phone = res.phone
          this.handleFormSubmit()
          this.isEdit = false
        })
      }
      if (this.isAddCustom) {
        addProduct({
          ...this.productForm
        }).then(res => {
          console.log(res)
          this.cancaleAddproduct()
          this.form.phone = res.phone
          this.handleFormSubmit()
          this.isAddCustom = false
        })
      }
      // console.log(this.productForm)
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
          getProducts({
            [this.form.selectType]: this.form.selectValue,
            ...this.page
          }).then(res => {
            this.userTable = res.products
            this.page.pageCurrent = res.currentPage
            // this.page.pageSize = res.pageSize
            this.page.pageTotal = res.total
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
