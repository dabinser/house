<template>
  <div>
    <!--    <scroll-top :scroll-param="scroll"></scroll-top>-->
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
        <el-checkbox-group v-model="price">
          <label class="label-fade-enter">价格</label>
          <el-checkbox label="200">200以下</el-checkbox>
          <el-checkbox label="400">200-400</el-checkbox>
          <el-checkbox label="600">400-600</el-checkbox>
          <el-checkbox label="800">600-800</el-checkbox>
          <el-checkbox label="801">800以上</el-checkbox>
        </el-checkbox-group>
      </el-row>
      <el-row class="crow">
        <el-checkbox-group v-model="bedroom">
          <label class="label-fade-enter">房型</label>
          <el-checkbox label="1">一室</el-checkbox>
          <el-checkbox label="2">二室</el-checkbox>
          <el-checkbox label="3">三室</el-checkbox>
          <el-checkbox label="4">四室</el-checkbox>
          <el-checkbox label="5">五室及以上</el-checkbox>
        </el-checkbox-group>
      </el-row>
      <el-row class="crow">
        <el-checkbox-group v-model="area">
          <label class="label-fade-enter">面积</label>
          <el-checkbox label="50">50㎡以下</el-checkbox>
          <el-checkbox label="70">50㎡-70㎡</el-checkbox>
          <el-checkbox label="90">70㎡-90㎡</el-checkbox>
          <el-checkbox label="110">90㎡-110㎡</el-checkbox>
          <el-checkbox label="111">110㎡以上</el-checkbox>
        </el-checkbox-group>
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
        <el-menu-item index="2">最新发布</el-menu-item>
        <el-menu-item index="3">房屋单价</el-menu-item>
        <el-menu-item index="4">房屋面积</el-menu-item>
      </el-menu>

      <el-row style="width:100%">
        <el-col style="width:85%;float:left">
          <el-row
              :gutter="20"
              style="height: 200px;padding-top:20px;cursor:pointer;border-bottom: 1px #DCDFE6 solid"
              v-for="item in house"
              :key="item.id"
              @click.native="info(item.id)">
            <el-col :span="4" style="height: 100%;">
              <el-row style="height: 90%;">
                <el-image :src="url+item.list[0]" style="height: 100%; width: 150px; border-radius: 10px"
                          aria-placeholder="img.png"></el-image>
              </el-row>
            </el-col>
            <el-col :span="16" style="position: relative;left: 10px">
              <el-row class="crow" id="address">
                <h2 style="font-family: HiraginoSansGB-W6 ;font-size: 20px;">{{ item.area }}</h2>
              </el-row>
              <el-row class="crow">
                <span>方式 {{ item.mode }}  </span>
                <span>{{ item.apartmentType }}</span>
              </el-row>

              <el-row class="crow">
                <span>小区 {{ item.community }}/ </span>
                <span>朝向 {{ item.orientation }} / </span>
                <span>电梯 {{ item.elevator }} / </span>
                <span>楼层 {{ item.storey }} </span>
              </el-row>
            </el-col>
            <el-col :span="4" style="height: 30px; width: 200px;float: right;position: relative;top: -80px">
              <span style="color:red;font-weight: bold;font-size: 24px;display-inside: ruby">{{ item.pay }} 元/月</span>
              <br/>
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
    // ScrollTop,
    cheader: cheader,
    cfooter: cfooter
  },
  data() {
    return {
      Image: [],
      url: 'http://localhost:8888/document/download/',
      activeIndex: "1",
      searchContent: "",
      list: [],
      price: [],
      num: [],
      area: [],
      bedroom: [],
      condition: {},
      total: 0, // 总记录数
      currentPage: 1, // 当前页
      pageSize: 10, // 每页大小
      searchMap: {}, // 查询条件
      pojo: {
        basepage: {
          current: this.currentPage,
          size: this.pageSize,
        },
        condition: this.condition
      },
      scroll: {
        // 回到顶部的方式 0 - 马上回到顶部，css实现（默认） 1 - 匀速回到顶部，js实现
        way: 1,
        // 滚动多少像素显示“回到顶部”图标
        distance: 20,
        // 向上滚动间隔
        time: 600,
        // 运动方式 Bounce
        sportWay: 'Quad',
        // 缓急方式 easeInOut
        slowWay: 'easeIn',
        // 回到顶部后回调方法
        callback: this.onScollTop
      },
      keyword: '',
      soft: ''
    };
  },
  computed: {
    house() {
      const arr = this.list

      if (this.soft == 3) {
        arr.sort((a, b) => {
          return b.pay - a.pay
        })
      }
      if (this.soft == 1) {
        arr.sort((a, b) => {
          return b.date - a.date
        })
      }
      return arr
    }
  },
  created() {
    this.fetchData();
  },
  mounted() {
    // if(this.$route.params.content){
    //   this.searchMap = {
    //       "house_title":this.$route.params.content
    //
    //   }
    //   console.log(this.searchMap)
    // }else{
    //
    // }
  },
  methods: {

    handleSelect(key, keyPath) {
      // alert(keyPath);
      this.soft = keyPath
      console.log(key)
      console.log(this.soft)
      if (keyPath == 2) {
        this.pojo.basepage.sort = 'date'
      }
      if (keyPath == 3) {
        this.pojo.basepage.sort = 'pay'
      } else {
        this.pojo.basepage.sort = ''
      }
      this.list=[]
      this.fetchData()
    },

    // 翻页后滚动条回到页面顶端
    scrollTop(selector) {
      let element = selector && document.querySelector(selector) || window;
      element.scrollTo(0, 0);
    },
    // // 回到顶部后回调
    // onScollTop () {
    //   this.$message.info('到达页面顶部了')
    // },


    fetchData() {
      oldhouseApi
          .search(this.pojo)
          .then(response => {
            this.list = response.data.data.records
            this.total = response.data.data.total;
          });
      this.scrollTop("#list-center");
    },
    info(id) {
      this.$router.push('/rent/' + id)
    },
    searchHouse() {
      for (let i = 0; i < this.price.length; i++) {
        this.num.push(parseInt(this.price[i]))
      }

      let max = Math.max(...this.num)
      let min = Math.min(...this.num)
      this.condition = {
        address: this.searchContent,
        minPrice: min,
        maxPrice: max,
      }
      this.fetchData()
    },
    handleCurrentChange(current) {
      // 当前页

      this.paginations.page_index=current,
          this.handleSearch();
    },
    handleSizeChange(page_size) {
      // 切换size
      this.paginations.page_index = 1;
      this.paginations.page_size = page_size;
      this.handleSearch();
    },
    setPaginations() {
      // 总页数
      this.paginations.total = this.allTableData.total;
      // 设置默认分页数据
      this.tableData = this.allTableData.records.filter((item, index) => {
        if (item.is_rent=='已出租'){
          item.show=true
        }
        else item.show=false
        return index < this.paginations.page_size;
      });
      console.log(this.tableData)
    }


  }
};
</script>

<style scoped>
.cheader {
  width: 100%;
  height: 220px;
  background: #f5f5f6;
  background-image: url("../../../assets/img/bannerV2.jpg");
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
  border-radius: 2px;
}

.label-fade-enter {
  margin: 0px 10px 0px 0px;
  font-size: 14px;
  font-weight: 700;
  color: #101d37;
}

.crow {
  line-height: 40px;
  margin: 5px 15px;
}

#address:hover {
  color: #00ae66;
}

.cbtn {
  border: none;
  border-radius: 0px;
}
</style>
