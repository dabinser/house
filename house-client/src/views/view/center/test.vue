<template>
  <div>
    <el-tabs v-model="activeName" @tab-click="handleClick" stretch="stretch">
<!--      <el-tab-pane label="二手房" name="oldhouse">-->
<!--        <h2 v-if="focusList.length === 0">暂无关注</h2>-->
<!--        <el-row v-for="item in focusList" :key = "item.id">-->
<!--          <el-row>-->
<!--            <h2 @click="info(item.id)">{{item.area}}-->
<!--            </h2>-->
<!--          </el-row>-->
<!--        </el-row>-->
<!--      </el-tab-pane>-->
      <el-tab-pane label="租房" name="renthouse" style="margin: 0 auto">
        <h2 v-if="focusList.length === 0">暂无关注</h2>
        <el-row v-for="item in focusList" :key = "item.id">
          <el-row style="margin: 5px">
            <el-button icon="el-icon-house"@click="info(item.id)">
            {{item.area}} | {{item.community}}
            </el-button>
          </el-row>
        </el-row>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import house from "../../../api/house";
import {getUser} from "../../../utils/auth";

export default {
  name: "test",
  data() {
    return {
      focusList:[],
      htype:'newhouse',
      activeName: 'newhouse'
    }
  },
  created(){
    this.getList()
  },
  methods:{
    handleClick(tab, event) {
      this.htype =tab.name
    },
    info(id) {
      this.$router.push({path:'info/'+id})
    },
    getList(){
      let id=getUser().id
      house.getCollection(id).then(res=>{
        if (res.data.code==0){
          this.focusList=res.data.data;
          console.log(this.focusList)
        }
      })
    }


  }

}
</script>

<style scoped>

</style>
