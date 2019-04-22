<template>
  <d2-container class="page">
    <el-card @click.native="gotoSchedule" class="box-card" shadow="hover">
      <div class="text item">
        <i class="fa fa-wpforms" style="color: blue;margin:22px;" aria-hidden="true"></i>
        <p>代办事项</p>
      </div>
    </el-card>
  </d2-container>
</template>

<script>

export default {
  data () {
    return {
    }
  },
  methods: {
    gotoSchedule: function () {
      this.$router.push('/office/schedule')
    }
  }
}
</script>

<style lang="scss" scoped>
.text {
  font-size: 20px;
}

.item {
  padding: 0;
  display: flex;
  display: -webkit-flex;
  flex-direction: row;
  justify-content:center;
}

.box-card {
  width: 280px;
}
.page {
  .page__logo {
    width: 120px;
  }
  .page__btn-group {
    color: $color-text-placehoder;
    font-size: 12px;
    margin-top: 0px;
    margin-bottom: 20px;
    span {
      color: $color-text-sub;
      &:hover {
        color: $color-text-main;
      }
    }
  }
}
</style>
