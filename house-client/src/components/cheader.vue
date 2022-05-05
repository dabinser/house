<template>
    <div>
      <el-container >

        <el-header >

          <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect" >
            <el-menu-item index="/" ><i  class="el-input__icon el-icon-location-outline"></i>{{city}}</el-menu-item>
            <el-menu-item index="/rent">首页</el-menu-item>
            <el-menu-item index="/publish">发布房源</el-menu-item>

            <el-menu-item index="/logout" style="float: right">退出</el-menu-item>
            <el-submenu index="person" style="float: right">
              <template slot="title">个人中心</template>
              <el-menu-item index="/cent/house">我的关注</el-menu-item>
              <el-menu-item index="7-2">最近联系</el-menu-item>
            </el-submenu>
            <el-menu-item index="/logon" style="float: right" >登录注册</el-menu-item>
<!--            <el-menu-item index="10" style="float: right">注册</el-menu-item>-->
          </el-menu>

        </el-header>

      </el-container>

    </div>
</template>

<script>

    export default {
        name: "oldheader",
        data() {
            return {
                city:'',
                activeIndex: '1',
                activeIndex2: '1',
                input:''
            };
        },
        mounted () {
          this.activeIndex =  this.$route.path;
          console.log(this.activeIndex);
        },
        methods: {
            handleSelect(key, keyPath) {
                this.activeIndex = key;
                console.log(key,keyPath);
                this.$router.push({path: key})

            },

        }
    }
</script>

<style scoped>

</style>
