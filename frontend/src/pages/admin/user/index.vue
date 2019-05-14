<template>
  <d2-container>
    <el-dialog style="margin-top: 0;" :visible.sync="userDialogFormVisible">
      <el-form  size="mini" :model="userForm" ref="userForm" :rules="userRules">
        <el-form-item label="手机号" prop="phone" :label-width="formLabelWidth">
          <el-input v-model="userForm.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="用户名" prop="user_name" :label-width="formLabelWidth">
          <el-input v-model="userForm.user_name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="真实姓名" prop="real_name" :label-width="formLabelWidth">
          <el-input v-model="userForm.real_name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="角色" :label-width="formLabelWidth">
          <el-select style="width: 120px;" v-model="userForm.role">
            <el-option label="管理员" value='admin'></el-option>
            <el-option label="采购员" value='purchase'></el-option>
            <el-option label="验收员" value='ratify'></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="密码" prop="password" :label-width="formLabelWidth">
          <el-input type="password" v-model="userForm.password" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="确认密码" prop="password_confirmation" :label-width="formLabelWidth">
          <el-input type="password" v-model="userForm.password_confirmation" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="qq" prop="qq" :label-width="formLabelWidth">
          <el-input v-model="userForm.qq" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="微信" prop="wechat" :label-width="formLabelWidth">
          <el-input v-model="userForm.wechat" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="职位" prop="title" :label-width="formLabelWidth">
          <el-input v-model="userForm.title" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancaleAddUser">取 消</el-button>
        <el-button type="primary" @click="AddUserEvent">确 定</el-button>
      </div>
    </el-dialog>
    <el-form
      :inline="true"
      :model="form"
      size="mini"
      ref="ruleForm"
      style="margin-bottom: -18px;">

      <el-form-item label="字段">
        <el-select style="width: 120px;" v-model="form.selectType" placeholder="手机号">
          <el-option label="用户名称" value='user_name'></el-option>
          <el-option label="手机号" value='phone'></el-option>
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

      <el-table-column label="用户名" width="160" align="center">
        <template slot-scope="scope">
            {{scope.row.user_name}}
        </template>
      </el-table-column>

      <el-table-column label="微信" width="80">
        <template slot-scope="scope">
          {{scope.row.wechat}}
        </template>
      </el-table-column>

      <el-table-column label="角色" width="160" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.role}}
        </template>
      </el-table-column>

      <el-table-column label="真名" width="100" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.concat}}
        </template>
      </el-table-column>

      <el-table-column label="职位" width="60" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          {{scope.row.title}}
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

import { getUsers, updateUser, addUser, deleteUser } from '@api/user'
export default {
  components: {
    'DemoPageFooter': () => import('@/components/PageFooter')
  },
  mounted () {
    getUsers({
      ...this.form,
      ...this.page
    }).then(res => {
      this.userTable = res.users
      this.page.pageCurrent = res.meta.currentPage
      // this.page.pageSize = res.meta.pageSize
      this.page.pageTotal = res.meta.total
    })
  },
  data () {
    var validatePas =  (rule, value, callback) => {
	    if (!value) {
		    callback(new Error('请输入新密码'));
			} else if (value.toString().length < 6 || value.toString().length > 18) {
				callback(new Error('密码长度为6 - 18个字符'))
		  } else {
				callback();
			}
		}
		var validatePass2 = (rule, value, callback) => {
	    if (value === '') {
	      callback(new Error('请再次输入密码'));
	    } else if (value !== this.userForm.password) {
	      callback(new Error('两次输入密码不一致!'));
	    } else {
	      callback()
	    }
    }
    return {
      userDialogFormVisible: false,
      formLabelWidth: '120px',
      userForm: {},
      userRules: {
        // type: [ { required: true, message: '请选择一个状态', trigger: 'change' } ],
        phone: [ { required: true, message: '请输入手机号', trigger: 'change' } ],
        user_name: [ { required: true, message: '请输入手机号', trigger: 'change' } ]
        // password: [ { required: true, validator: validatePass, trigger: 'blur' } ],
        // password_confirmation: [ { required: true, validator: validatePass2, trigger: 'blur' } ]
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
        selectType: 'user_name',
        selectValue: ''
      }
    }
  },
  methods: {
    handleAddDossierButton () {
      this.userDialogFormVisible = true
      this.isAddCustom = true
    },
    handleShow (index, row) {
      // console.log(index, row)
      this.showDetail = true
      this.userForm = this.userTable[index]
      this.userDialogFormVisible = true
    },
    handleEdit (index, row) {
      // console.log(index, row)
      this.isEdit = true
      this.userForm = this.userTable[index]
      this.userDialogFormVisible = true
    },
    handleDelete (index, row) {
      console.log(index, row)
      deleteUser({ id: row.id }).then(res => {
        console.log(res)
        this.handleFormSubmit()
        this.$message({
          message: '删除成功',
          type: 'success'
        })
      })
    },
    cancaleAddUser () {
      this.$refs['userForm'].resetFields()
      this.userDialogFormVisible = false
    },
    handleSelectFormReset () {
      this.$refs['ruleForm'].resetFields()
    },
    AddUserEvent () {
      if (this.showDetail) {
        this.cancaleAddUser()
        this.showDetail = false
      }
      if (this.isEdit) {
        updateUser({
          ...this.userForm
        }).then(res => {
          // console.log(res)
          this.cancaleAddUser()
          this.form.phone = res.phone
          this.handleFormSubmit()
          this.isEdit = false
        })
      }
      if (this.isAddCustom) {
        addUser({
          user: this.userForm
        }).then(res => {
          console.log(res)
          this.cancaleAddUser()
          this.form.phone = res.phone
          this.handleFormSubmit()
          this.isAddCustom = false
        })
      }
      // console.log(this.userForm)
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
          getUsers({
            ...this.form,
            ...this.page
          }).then(res => {
            this.userTable = res.users
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
