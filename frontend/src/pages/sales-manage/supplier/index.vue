<template>
  <d2-container>
    <el-dialog style="margin-top: 0;" :visible.sync="supplierDialogFormVisible">
      <el-form  size="mini" :model="supplierForm" ref="supplierForm" :rules="supplierRules">
        <el-form-item label="手机号" prop="phone" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="姓名" prop="name" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="地址" prop="address" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.address" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="微信" prop="wechart" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.wechart" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="来源" prop="origin" :label-width="formLabelWidth">
          <el-select v-model="supplierForm.origin" placeholder="请选择评级">
            <el-option label="日常" value=0></el-option>
            <el-option label="活动" value=1></el-option>
            <el-option label="介绍" value=2></el-option>
            <el-option label="网络" value=3></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="年龄" prop="age" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.age" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="性别" prop="sex" :label-width="formLabelWidth">
          <el-select v-model="supplierForm.sex" placeholder="请选择评级">
            <el-option label="女" value=0></el-option>
            <el-option label="男" value=1></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="等级" prop="level" :label-width="formLabelWidth">
          <el-select v-model="supplierForm.level" placeholder="请选择评级">
            <el-option label="普通会员" value=0></el-option>
            <el-option label="白银会员" value=1></el-option>
            <el-option label="黄金会员" value=2></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="qq号" prop="qq" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.qq" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" prop="email" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.email" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="婚姻" prop="marriage" :label-width="formLabelWidth">
          <el-select v-model="supplierForm.marriage" placeholder="请选择评级">
            <el-option label="是" value=0></el-option>
            <el-option label="否" value=1></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="生日" prop="birthday" :label-width="formLabelWidth">
          <el-date-picker v-model="supplierForm.birthday" type="date" placeholder="选择日期"></el-date-picker>
        </el-form-item>
        <el-form-item label="职业" prop="work" :label-width="formLabelWidth">
          <el-input v-model="supplierForm.work" autocomplete="off"></el-input>
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
      :rules="rules"
      size="mini"
      ref="ruleForm"
      style="margin-bottom: -18px;">
      <el-form-item  label="手机号" prop="phone">
        <el-input
          v-model="form.phone"
          placeholder="用户手机号"
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
          @click="supplierDialogFormVisible = true">
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

      <!-- <el-table-column
        type="selection"
        width="55">
      </el-table-column> -->

      <el-table-column label="手机号" width="160" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.phone}}
        </template>
      </el-table-column>

      <el-table-column label="姓名" width="160" align="center">
        <template slot-scope="scope">
            {{scope.row.name}}
        </template>
      </el-table-column>

      <!-- <el-table-column label="状态" width="50" align="center">
        <template slot-scope="scope">
          <boolean-control
            :value="scope.row.type"
            @change="(val) => {
              handleSwitchChange(val, scope.$index)
            }">
            <d2-icon
              name="check-circle"
              style="font-size: 20px; line-height: 32px; color: #67C23A;"
              slot="active"/>
            <d2-icon
              name="times-circle"
              style="font-size: 20px; line-height: 32px; color: #F56C6C;"
              slot="inactive"/>
          </boolean-control>
        </template>
      </el-table-column>

      <el-table-column label="状态" width="50" align="center">
        <template slot-scope="scope">
          <boolean-control-mini
            :value="scope.row.type"
            @change="(val) => {
              handleSwitchChange(val, scope.$index)
            }">
            <d2-icon
              name="check-circle"
              style="font-size: 20px; line-height: 32px; color: #67C23A;"
              slot="active"/>
            <d2-icon
              name="times-circle"
              style="font-size: 20px; line-height: 32px; color: #F56C6C;"
              slot="inactive"/>
          </boolean-control-mini>
        </template>
      </el-table-column> -->

      <el-table-column label="地区" width="80">
        <template slot-scope="scope">
          {{scope.row.address}}
        </template>
      </el-table-column>

      <el-table-column label="微信" width="150" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.wechart}}
        </template>
      </el-table-column>

      <el-table-column label="来源" width="80" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.origin}}
        </template>
      </el-table-column>

      <!-- <el-table-column label="生日" width="100" align="center">
        <template slot-scope="scope">
          <el-tag
            size="mini"
            :type="scope.row.used ? 'info' : ''">
            {{scope.row.used ? '已使用' : '未使用'}}
          </el-tag>
        </template>
      </el-table-column> -->

      <el-table-column label="年龄" width="50" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.age}}
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

// import { BusinessTable1List } from '@api/demo.business.table.1'
import { getSuppliers, updateSupplier, addSupplier, deleteSupplier } from '@api/salesManager/supplier'
export default {
  components: {
    'DemoPageHeader': () => import('./componnets/PageHeader'),
    'DemoPageFooter': () => import('./componnets/PageFooter')
  },
  data () {
    return {
      supplierDialogFormVisible: false,
      formLabelWidth: '120px',
      supplierForm: {
        phone: '',
        name: '',
        address: '',
        wechart: '',
        origin: null,
        age: '',
        sex: '',
        level: null,
        qq: '',
        email: '',
        marriage: null,
        birthday: '',
        work: ''
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
        phone: ''
      },
      rules: {
        phone: [ { required: true, message: '请输入手机号', trigger: 'change' } ]
      }
    }
  },
  methods: {
    handleShow (index, row) {
      console.log(index, row)
      this.showDetail = true
      this.supplierForm = this.userTable[index]
      this.supplierDialogFormVisible = true
    },
    handleEdit (index, row) {
      console.log(index, row)
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
          console.log(res)
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
            this.page.pageCurrent = res.currentPage
            this.page.pageSize = res.pageSize
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
    handleSupplierNew () {
      this.$notify.error({
        title: '错误',
        message: '表单校验失败'
      })
    }
  }
}
</script>
