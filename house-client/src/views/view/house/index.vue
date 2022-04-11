<template>
  <div>
    <cheader></cheader>
    <div class="cheader">
      <div style="width: 60%;margin: 0 auto;line-height: 100px">

      </div>
      <div style="padding-top: 30px">
        <el-row class="csearch" type="flex" justify="center">
          <el-col :span="8">
            <el-input
              placeholder="请输入内容"
              v-model="searchContent"
              class="input"
              style="border-radius: 0px"
            ></el-input>
          </el-col>
          <el-button type="success" class="cbtn-bg" @click="searchHouse">开始找房</el-button>
        </el-row>
      </div>
    </div>

    <div style="width: 60%;margin: 0 auto;padding: 20px">
      <el-row class="crow">
        <label>售价</label>
        <el-checkbox label="200万以下" true-label="1" false-label="0"></el-checkbox>
        <el-checkbox label="200-250" true-label="1" false-label="0"></el-checkbox>
        <el-checkbox label="250-300" true-label="1" false-label="0"></el-checkbox>
        <el-checkbox label="300-400" true-label="1" false-label="0"></el-checkbox>
        <el-checkbox label="400-500" true-label="1" false-label="0"></el-checkbox>
      </el-row>
      <el-row class="crow">
        <label>房型</label>
        <el-checkbox label="一室" true-label="1" false-label="0"></el-checkbox>
        <el-checkbox label="二室" true-label="1" false-label="0"></el-checkbox>
        <el-checkbox label="三室" true-label="1" false-label="0"></el-checkbox>
        <el-checkbox label="四室" true-label="1" false-label="0"></el-checkbox>
        <el-checkbox label="五室及以上" true-label="1" false-label="0"></el-checkbox>
      </el-row>
      <el-row class="crow">
        <label>面积</label>
        <el-checkbox label="50㎡以下" true-label="1" false-label="0"></el-checkbox>
        <el-checkbox label="50㎡-70㎡" true-label="1" false-label="0"></el-checkbox>
        <el-checkbox label="70㎡-90㎡" true-label="1" false-label="0"></el-checkbox>
        <el-checkbox label="90㎡-110㎡" true-label="1" false-label="0"></el-checkbox>
        <el-checkbox label="110㎡-130㎡" true-label="1" false-label="0"></el-checkbox>
        <el-checkbox label="130㎡-150㎡" true-label="1" false-label="0"></el-checkbox>
        <el-checkbox label="150㎡以上" true-label="1" false-label="0"></el-checkbox>
      </el-row>
    </div>
    <div style="width: 60%;margin: 0 auto;padding: 20px">
      <el-menu
        :default-active="activeIndex"
        class="el-menu-demo"
        mode="horizontal"
        @select="handleSelect"
      >
        <el-menu-item index="1">默认排序</el-menu-item>
        <el-menu-item index="3">最新发布</el-menu-item>
        <el-menu-item index="4">房屋总价</el-menu-item>
        <el-menu-item index="5">房屋单价</el-menu-item>
        <el-menu-item index="6">房屋面积</el-menu-item>
      </el-menu>

      <el-row style="width:100%">
        <el-col style="width:85%;float:left">
          <el-row
            :gutter="20"
            style="height: 200px;padding-top:20px;cursor:pointer;border-bottom: 1px #DCDFE6 solid"
            v-for="item in list"
            :key="item.id"
          @click.native="info(item.id)">
            <el-col :span="4" style="height: 100%;">
              <el-row style="height: 90%;">
<!--                <el-image :src="1" style="height: 100%;"></el-image>-->
              </el-row>
            </el-col>
            <el-col :span="16">
              <el-row>
                <h2>{{item.title}}</h2>
              </el-row>
              <el-row class="crow">
                <span>{{item.contacts}}</span>
              </el-row>
              <el-row class="crow">
                <span>{{item.area}}|</span>
                <span>{{item.mode}}|</span>
                <span>{{item.orientation}}|</span>
                <span>{{item.storey}}|</span>
              </el-row>
              <el-row class="crow">
                <span>0关注</span>
              </el-row>
            </el-col>
            <el-col :span="4" style="height: 100%;">
              <span style="color:red;font-weight: bold;font-size: 28px">{{item.pay}}万</span>
              <br />
              <span style="line-height: 30px">单价：暂无</span>
            </el-col>
          </el-row>
        </el-col>
      </el-row>
      <el-pagination
        @size-change="fetchData"
        @current-change="fetchData"
        :current-page.sync="currentPage"
        :page-sizes="[5,10,20]"
        :page-size="10"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
    </div>
    <cfooter></cfooter>
  </div>
</template>

<script>
import cheader from "@/components/cheader";
import cfooter from "@/components/cfooter";
import oldhouseApi from "../../../api/oldhouse";
export default {
  name: "index",
  components: {
    cheader: cheader,
    cfooter: cfooter
  },
  data() {
    return {
      testImage:
      "src/assets/newhouse/c7151ad70651832b9352de793b503e0a.jpg.185x185.jpg",
      activeIndex: "1",
      searchContent: "",
      list: [],
      total: 0, // 总记录数
      currentPage: 1, // 当前页
      pageSize: 10, // 每页大小
      searchMap: {} // 查询条件
    };
  },
  created() {
      this.fetchData();
  },
    mounted() {
        console.log(this.$route.params.content)
        if(this.$route.params.content){
          this.searchMap = {
              "house_title":this.$route.params.content
          }
        }else{

        }
    },
  methods: {
    handleSelect(key, keyPath) {
      //alert(keyPath);
    },
    fetchData() {
      let pojo={
        basepage:{
          current:this.currentPage,
          size:this.pageSize,
        },
        condition:this.searchMap
      }
      oldhouseApi
        .search(pojo)
        .then(response => {
          this.list = response.data.data.records;
          console.log(this.list);
          this.total = response.data.data.total;

        });
    },
    info(id) {
        this.$router.push('/info/'+id)
    },
      searchHouse(){
          this.searchMap = {
              "house_title":this.searchContent
          }
          this.fetchData()
      }
  }
};
</script>

<style scoped>
.cheader {
  width: 100%;
  height: 220px;
  background: #f5f5f6;
}
span {
  color: #000;
}
.csearch {
  width: 100%;
}
.cbtn-bg {
  background: #00ae66;
  border: none;
  border-radius: 0px;
}
.crow {
  line-height: 30px;
}

.cbtn{
  border: none;
  border-radius: 0px;
}
</style>
