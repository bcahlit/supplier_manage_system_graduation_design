<template>
  <el-form
    :inline="true"
    :model="form"
    :rules="rules"
    size="mini"
    style="margin-bottom: -18px;">


    <el-form-item label="手机号" prop="phone">
      <el-input
        v-model="form.phone"
        placeholder="用户手机号"
        style="width: 180px;"/>
    </el-form-item>

    <!-- <el-form-item label="卡密" prop="key">
      <el-input
        v-model="form.key"
        placeholder="卡密"
        style="width: 120px;"/>
    </el-form-item>

    <el-form-item label="备注" prop="note">
      <el-input
        v-model="form.note"
        placeholder="备注"
        style="width: 120px;"/>
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
        @click="handleFormReset">
        <d2-icon name="refresh"/>
        重置
      </el-button>
    </el-form-item>

  </el-form>
</template>

<script>
export default {
  data () {
    return {
      form: {
        // type: '1',
        phone: ''
        // key: '',
        // note: ''
      },
      rules: {
        // type: [ { required: true, message: '请选择一个状态', trigger: 'change' } ],
        phone: [ { required: true, message: '请输入手机号', trigger: 'change' } ]
      }
    }
  },
  methods: {
    handleFormSubmit () {
      this.$refs.form.validate((valid) => {
        if (valid) {
          this.$emit('submit', this.form)
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
    }
  }
}
</script>
