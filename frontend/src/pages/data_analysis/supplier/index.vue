<template>
  <d2-container>
    <el-row>
      <el-col :span="12">
        <div class="grid-content bg-purple">
          <ve-pie :data="chartData"></ve-pie>
        </div>
      </el-col>
      <el-col :span="12">
        <div class="grid-content bg-purple-light">
          <ve-pie :data="chartData"></ve-pie>
        </div>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="12">
        <div class="grid-content bg-purple">
          <ve-pie :data="chartData"></ve-pie>
        </div>
      </el-col>
      <el-col :span="12">
        <div class="grid-content bg-purple-light">
          <ve-pie :data="chartData"></ve-pie>
        </div>
      </el-col>
    </el-row>
    <el-row>
      <ve-histogram :data="chartData"></ve-histogram>
    </el-row>
  </d2-container>
</template>

<script>
  export default {
    data () {
      return {
        orderChartData: {
          columns: ['公司', '订单数'],
          rows: [
            { '公司': '1/1', '订单数': 1393 },
            { '公司': '1/2', '订单数': 3530 },
            { '公司': '1/3', '订单数': 2923 },
            { '公司': '1/4', '订单数': 1723 },
            { '公司': '1/5', '订单数': 3792 },
            { '公司': '1/4', '订单数': 1723 },
            { '公司': '1/5', '订单数': 3792 },
            { '公司': '1/6', '订单数': 4593 }
          ]
        },
        chartData: {
          columns: ['公司', '订单数'],
          rows: [
            { '公司': '1/1', '订单数': 1393 },
            { '公司': '1/2', '订单数': 3530 },
            { '公司': '1/3', '订单数': 2923 },
            { '公司': '1/7', '订单数': 1393 },
            { '公司': '1/8', '订单数': 3530 },
            { '公司': '1/9', '订单数': 2923 },
            { '公司': '1/4', '订单数': 1723 },
            { '公司': '1/5', '订单数': 3792 },
            { '公司': '1/6', '订单数': 4593 }
          ]
        }
      }
    }
  }
</script>
