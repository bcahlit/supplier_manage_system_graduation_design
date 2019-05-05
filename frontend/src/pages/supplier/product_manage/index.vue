<template>
  <d2-container>
    <el-dialog style="margin-top: 0;" :visible.sync="productDialogFormVisible">
      <el-form  size="mini" :model="productForm" ref="productForm" :rules="productRules">
        <!-- TODO 嵌套dialog  选择产品 -->
        <el-form-item label="产品id" prop="product_id" :label-width="formLabelWidth">
          <el-input v-model="productForm.product.id" autocomplete="off"></el-input>
        </el-form-item>
        <!-- <el-form-item label="类型" prop="type" :label-width="formLabelWidth">
          <el-input v-model="productForm.type" autocomplete="off"></el-input>
        </el-form-item> -->
        <el-form-item label="价格" prop="price" :label-width="formLabelWidth">
          <el-input v-model="productForm.price" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="返修率" prop="back_rate" :label-width="formLabelWidth">
          <el-input v-model="productForm.back_rate" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="质量标准" prop="standard" :label-width="formLabelWidth">
          <el-input v-model="productForm.standard" autocomplete="off"></el-input>
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

      <!-- <el-form-item label="公司名">
        <el-input
          v-model="form.name"
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
      </el-form-item> -->

      <el-form-item v-if="this.supplier">
        <el-button
          @click="addProductButton">
          <d2-icon name="plus"/>
          添加产品
        </el-button>
      </el-form-item>
      <el-form-item>
       {{this.supplier? "公司名："+this.supplier.name : ""}}
      </el-form-item>
      <el-form-item>
        {{this.supplier? "联系人："+this.supplier.concat : ""}}
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
          {{scope.row.product.name}}
        </template>
      </el-table-column>

      <el-table-column label="价格" width="160" align="center">
        <template slot-scope="scope">
            {{scope.row.price}}
        </template>
      </el-table-column>

      <el-table-column label="返修率" width="100">
        <template slot-scope="scope">
          {{scope.row.back_rate}}
        </template>
      </el-table-column>

      <el-table-column label="良品率" width="120" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.standard}}
        </template>
      </el-table-column>

      <!-- TODO 加备注 <el-table-column label="备注" width="180" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.remark}}
        </template>
      </el-table-column> -->

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

import { getProducts, updateProduct, addProduct, deleteProduct } from '@api/supplier/products/'
export default {
  components: {
    'DemoPageFooter': () => import('@/components/PageFooter')
  },
  created() {
    this.supplier=this.$store.state.supplier
    this.fetchProduct()
  },
  activated() {
    this.supplier=this.$store.state.supplier
    this.fetchProduct()
  },
  data () {
    return {
      productDialogFormVisible: false,
      formLabelWidth: '120px',
      productForm: {},
      productRules: {
        // classify: [ { required: true, message: '请输入类别', trigger: 'change' } ],
        // number: [ { required: true, message: '请输入产品号', trigger: 'change' } ],
        productForm: [ { required: true, message: '请输入产品id', trigger: 'change' } ]
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
        name: 'name'
      },
      rules: {
        name: [ { required: true, message: '请输入手机号', trigger: 'change' } ]
      }
    }
  },
  methods: {
    fetchProduct () {
      let supplier_id = this.supplier? this.supplier.id : ""
      getProducts({
        supplier_id: supplier_id,
        ...this.page
      }).then(res => {
        // console.log(res)
        this.userTable = res.supplier_products
        this.page.pageCurrent = res.meta.currentPage
        // this.page.pageSize = res.pageSize
        this.page.pageTotal = res.meta.total
        // TODO show data
      })
    },
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
    addProductButton () {
      this.productDialogFormVisible = true
      this.isAddCustom = true
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
          ...this.productForm,
          supplier_id: this.supplier.id
        }).then(res => {
          // console.log(res)
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
            ...this.form,
            ...this.page
          }).then(res => {
            this.userTable = res.supplier_products
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
