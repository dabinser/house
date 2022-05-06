<template>
  <div>
    <cheader></cheader>
    <div style="overflow: auto;">
      <div style="width: 60%;margin: 0 auto">
        <el-container style="border: 1px #f2f2f2 solid">
          <el-main>
            <el-row>
              <el-col >
                <el-row style="height: 80px ;width: 100%">
                  欢迎你：{{user.name}}
                </el-row>
                <el-row>
                  <span @click="tab('house')" style="cursor: pointer">关注的房源</span>
                </el-row>
              </el-col>
              <el-col span="20" >
                <router-view></router-view>
              </el-col>
            </el-row>
          </el-main>
        </el-container>

      </div>

    </div>
    <cfooter style="position: absolute;bottom: 0px"></cfooter>
  </div>
</template>

<script>
  import cheader from "@/components/cheader";
  import cfooter from "@/components/cfooter";
  import {getUser} from "../../../utils/auth";

  export default {
    name: "index",
    components: {
      cheader: cheader,
      cfooter: cfooter
    },
    data(){
      return{
        user:''
      }
    },
      methods: {
        tab(value){
            this.$router.push({path:'/center/'+value})
        }
      },
      created() {
        this.user=getUser();
      }
  }
</script>

<style scoped>
span{
  line-height: 40px;
}
</style>
