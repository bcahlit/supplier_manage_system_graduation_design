<template>
  <d2-container>
    <el-dialog style="margin-top: 0;" :visible.sync="supplierDialogFormVisible">
      <el-form  size="mini" :model="supplierForm" ref="supplierForm" :rules="supplierRules">
        <el-form-item label="手机号" prop="phone" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="供应商名" prop="name" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="地址" prop="address" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.address" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" prop="email" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.email" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="联系人" prop="concat" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.concat" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="邮编" prop="zip" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.zip" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="银行账户" prop="bank_number" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.bank_number" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="威望" prop="reputation" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.reputation" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="传真" prop="fax" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.fax" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="及时性" prop="timely" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.timely" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="售后" prop="aftersales" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.fax" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="备注" prop="remark" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.remark" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="合作兼容性" prop="componiship" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.componiship" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancaleAddSupplier">取 消</el-button>
        <el-button type="primary" @click="AddSupplierEvent">确 定</el-button>
      </div>
    </el-dialog>
    <el-form
      :inline="true"
      :model="form"
      size="mini"
      ref="ruleForm"
      style="margin-bottom: -18px;">

      <el-form-item label="字段">
        <el-select style="width: 120px;" v-model="form.selectType" placeholder="供应商名称">
          <el-option label="供应商名称" value='name'></el-option>
          <el-option label="联系人姓名" value='concat'></el-option>
          <el-option label="供应商地址" value='address'></el-option>
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
          @click="handleAddDossierButton">
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

      <el-table-column label="手机号" width="100" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.phone}}
        </template>
      </el-table-column>

      <el-table-column label="公司名称" width="160" align="center">
        <template slot-scope="scope">
            {{scope.row.name}}
        </template>
      </el-table-column>

      <el-table-column label="地址" width="80">
        <template slot-scope="scope">
          {{scope.row.address}}
        </template>
      </el-table-column>

      <el-table-column label="邮箱" width="160" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.email}}
        </template>
      </el-table-column>

      <el-table-column label="联系人" width="100" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.concat}}
        </template>
      </el-table-column>

      <el-table-column label="邮编" width="60" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.zip}}
        </template>
      </el-table-column>

      <el-table-column label="银行账户" width="150" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.bank_number}}
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
            <el-button
              size="mini"
              type="warning"
              @click="handleGoProductManage(scope.$index, scope.row)">产品管理</el-button>
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

import { getSuppliers, updateSupplier, addSupplier, deleteSupplier } from '@api/salesManager/supplier'
export default {
  components: {
    'DemoPageFooter': () => import('@/components/PageFooter')
  },
  data () {
    return {
      supplierDialogFormVisible: false,
      formLabelWidth: '120px',
      supplierForm: {
        phone: '',
        name: '',
        type: '',
        address: '',
        email: null,
        concat: '',
        zip: '',
        bank_number: null,
        reputation: 100,
        fax: '',
        remark: null,
        timely: 100,
        aftersales: 100,
        componiship: 100
      },
      supplierRules: {
        // type: [ { required: true, message: '请选择一个状态', trigger: 'change' } ],
        phone: [ { required: true, message: '请输入手机号', trigger: 'change' } ]
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
      }
    }
  },
  methods: {
    handleGoProductManage (index, row) {
      this.$store.commit('setSupplier', row)
      this.$router.push({ name: 'product_manage' })
    },
    handleAddDossierButton () {
      this.supplierDialogFormVisible = true
      this.isAddCustom = true
    },
    handleShow (index, row) {
      // console.log(index, row)
      this.showDetail = true
      this.supplierForm = this.userTable[index]
      this.supplierDialogFormVisible = true
    },
    handleEdit (index, row) {
      // console.log(index, row)
      this.isEdit = true
      this.supplierForm = this.userTable[index]
      this.supplierDialogFormVisible = true
    },
    handleDelete (index, row) {
      console.log(index, row)
      deleteSupplier({ id: row.id }).then(res => {
        console.log(res)
        this.handleFormSubmit()
        this.$message({
          message: '删除成功',
          type: 'success'
        })
      })
    },
    cancaleAddSupplier () {
      this.$refs['supplierForm'].resetFields()
      this.supplierDialogFormVisible = false
    },
    handleSelectFormReset () {
      this.$refs['ruleForm'].resetFields()
    },
    AddSupplierEvent () {
      if (this.showDetail) {
        this.cancaleAddSupplier()
        this.showDetail = false
      }
      if (this.isEdit) {
        updateSupplier({
          ...this.supplierForm
        }).then(res => {
          // console.log(res)
          this.cancaleAddSupplier()
          this.form.phone = res.phone
          this.handleFormSubmit()
          this.isEdit = false
        })
      }
      if (this.isAddCustom) {
        addSupplier({
          ...this.supplierForm
        }).then(res => {
          console.log(res)
          this.cancaleAddSupplier()
          this.form.phone = res.phone
          this.handleFormSubmit()
          this.isAddCustom = false
        })
      }
      // console.log(this.supplierForm)
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
          getSuppliers({
            ...this.form,
            ...this.page
          }).then(res => {
            this.userTable = res.suppliers
            this.page.pageCurrent = res.meta.currentPage
            // this.page.pageSize = res.meta.pageSize
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
    }
  }
}
</script>
