<template>
  <d2-container>
        <el-form
      :inline="true"
      :model="form"
      :rules="rules"
      size="mini"
      ref="ruleForm"
      style="margin-bottom: -18px;">
      <el-form-item label="产品编号" prop="number">
        <el-input
          v-model="form.phone"
          style="width: 120px;"/>
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          @click="handleFormSubmit">
          <d2-icon name="search"/>
          添加
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
    points
    <template slot="footer">
      总价： ￥ 确定
    </template>
  </d2-container>
</template>

<script>
export default {
  data () {
    return{
      form: {
        number: ''
      },
      rules: {
        number: [ { required: true, message: '请输入产品号', trigger: 'change' } ]
      }
    }
  },
  methods: {
    handleSelectFormReset () {
      this.$refs['ruleForm'].resetFields()
    },
    handleFormSubmit () {
      // TODO 查找产品 找到的话就ok
    }
  }
}
</script>
