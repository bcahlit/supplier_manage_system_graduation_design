<template>
  <d2-container>
    <el-row>
      <el-col :span="12">
        <div style="text-align:center">
          供应占比
        </div>
      </el-col>
      <el-col :span="12">
        <div style="text-align:center">
          采购数量
        </div>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="12">
        <div class="grid-content bg-purple">
          <ve-pie :data="orderNumberChartData"></ve-pie>
        </div>
      </el-col>
      <el-col :span="12">
        <div class="grid-content bg-purple-light">
          <ve-histogram :data="OrderTimeChartData"></ve-histogram>
        </div>
      </el-col>
    </el-row>
    <!-- <el-row>
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
    </el-row> -->
  </d2-container>
</template>

<script>

import { getOrderNumberBySypplier, getOrderNumberByTime } from '@api/dataShow'

export default {
  created () {
    this.fetchProduct()
  },
  activated () {
    this.fetchProduct()
  },
  data () {
    return {
      orderNumberChartData: {
        columns: ['supplier', 'number'],
        rows: []
      },
      OrderTimeChartData: {
        columns: ['data', 'number', ''],
        rows: []
      }
    }
  },
  methods: {
    fetchProduct () {
      getOrderNumberBySypplier().then(res => {
        this.orderNumberChartData.rows = res
      })
      getOrderNumberByTime().then(res => {
        console.log(res)
        this.OrderTimeChartData.rows = res.map(item => {
          let data = new Date(item.time)
          item.data = data.getFullYear() + '/' + (data.getMonth() + 1)
          return item
        })
      })
    }
  }
}
</script>
