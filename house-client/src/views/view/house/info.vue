<template>
  <div>
    <cheader></cheader>
    <div style="height: 180px;width: 100%; " class="head">
      <div style="width: 60%;margin:  0 auto;">

      </div>
    </div>
    <div style="width: 60%;margin: 0 auto;">
      <el-container>
        <el-main>

          <el-row>
            <h1>{{ pojo.title }}</h1>
          </el-row>
          <li class="like" v-model="id" style=" float: right;list-style-type: none">
              <span class="iconfont" style="width: 50px">
                  <i v-if="!isCollection" class="el-icon-star-off" :key="0" @click="onCollection" style="width: 50px"></i>
                  <i v-else class="el-icon-star-on" :key="1" @click="onCollection"></i>
              </span>
          </li>
          <el-row>
            <span style="color:#606266;line-height: 30px;">房源维护时间：{{ pojo.date|formatDate }} </span><br>
            <span style="color:#606266">房源编号：{{ pojo.rcode }} </span>
          </el-row>
          <el-row style="margin-top: 20px;" :gutter="50">
            <el-col :span="14">
              <div style="width:100%;height:400px;" class="soul">
                <div class="dvtleft">
                  <img :src="url+imgList[banner]" sizes="100px" width="300px" height="300px">
                </div>
                <!-- 下方小图列表 -->

                <div class="dvtleftbt" style="display: flex">
                  <span class="el-icon-arrow-left icleft" @click="rollLeft"
                        style="position: relative;top: 25px;"></span>
                  <div class="dvtleftbt_allpic" style="left: 5px" ref="roll">
                    <!--                    <img v-for="(im,ix) in productinfo.images" :key="ix" @click="currbanner(ix)" :src="im" />-->
                    <!--                    <el-col :span="10" style="line-height: 28px" v-for="item in imgList" :key="item.id" @click="currbanner(item.id)">-->
                    <!--                      <el-image :src="url+item" style="width: 100%;height: 100%"></el-image>-->
                    <!--                    </el-col>-->
                    <el-image :src="url+item" v-for="(item,key) in imgList" :key="key" @click="currbanner(key)"
                              fit="fill" :preview-src-list="URL" z-index="200px"
                              style="width: 40px ;height: 60px;line-height: 28px;padding: 5px"></el-image>
                    <div class="clear"></div>
                  </div>
                  <span class="el-icon-arrow-right icright" @click="rollRight"
                        style="position: relative;top: 25px"></span>
                </div>
              </div>
            </el-col>
            <el-col :span="10">
              <div style="width:100%;height:400px;">
                <el-row>
                  <el-col>
                    <span style="font-weight: bold;font-size: 30px;color: #484848">{{ pojo.pay }} ￥</span>
                  </el-col>
                </el-row>
                <el-row style="margin-top: 20px">
                  <el-col>
                    <el-tag size="mini">近地铁</el-tag>
                  </el-col>
                </el-row>

                <el-row>
                  <el-col>
                    <span style="color: #606266;line-height: 26px;">房型：<span>{{ pojo.content }}</span></span>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col>
                    <span style="color: #606266;line-height: 26px;">小区名称：<span>{{ pojo.community }}</span></span>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col>
                    <span style="color: #606266;line-height: 26px;">所在区域：<span>{{ pojo.area }}</span></span>
                  </el-col>
                </el-row>

                <el-row>
                  <el-col :span="6">
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="24">
                    <el-button type="success" style="margin: 10px;" size="medium" @click="sendMessage()">在线咨询
                    </el-button>
                  </el-col>
                </el-row>
              </div>
            </el-col>
          </el-row>
          <el-row>
            <h2>房屋信息</h2>
            <el-row>
              <el-col :span="4">
                <span>基本信息</span>
              </el-col>
              <el-col :span="6">
                <el-row style="line-height: 30px;">房屋户型：{{ pojo.house_type }}</el-row>
                <el-row style="line-height: 30px;">建筑面积：{{ pojo.area }}</el-row>
                <el-row style="line-height: 30px;">套内面积：{{ pojo.area }}</el-row>
                <el-row style="line-height: 30px;">房屋朝向：{{ pojo.orientation }}</el-row>
                <el-row style="line-height: 30px;">装修情况：{{ pojo.fitment }}</el-row>
                <el-row style="line-height: 30px;">配套电梯：{{ pojo.elevator }}</el-row>

              </el-col>
              <el-col :span="6">
                <el-row style="line-height: 30px;">所在楼层：{{ pojo.floor }}</el-row>
                <el-row style="line-height: 30px;">户型结构：暂无数据</el-row>
                <el-row style="line-height: 30px;">建筑类型：板楼</el-row>
                <el-row style="line-height: 30px;">建筑结构：砖混结构</el-row>
                <el-row style="line-height: 30px;">梯户比例：{{ pojo.door }}</el-row>
              </el-col>
            </el-row>
            <el-row style="margin-top: 20px">
              <el-col :span="4">
                <span>看房</span>
              </el-col>
              <el-col :span="6">
                <el-button type="primary" size="middle" @click="requestHouseFlag = true">预约看房</el-button>

              </el-col>

            </el-row>
          </el-row>
          <el-row>
            <h2>房源描述</h2>
            <el-row style="margin-bottom: 20px;">
              <el-col :span="12" style="line-height: 28px">
                {{ pojo.house_desc }}
              </el-col>
            </el-row>
          </el-row>
          <el-row style="margin-bottom: 20px">
            <h2>费用详情</h2>
            <br>
            <el-row>
              <h4>年租价 当租期不足1年时租金可能会上浮，详询管家</h4>
            </el-row>
            <el-row style="line-height: 44px;">
              <el-col :span="4">付款方式</el-col>
              <el-col :span="4">租金 (元/月)</el-col>
              <el-col :span="4">押金 (元)</el-col>
              <el-col :span="4">服务费 (元)</el-col>
              <el-col :span="4">中介费 (元)</el-col>
            </el-row>
            <el-row>
              <el-col :span="4">季付</el-col>
              <el-col :span="4">3300</el-col>
              <el-col :span="4">3300</el-col>
              <el-col :span="4">3300</el-col>
              <el-col :span="4">3300</el-col>
            </el-row>
          </el-row>
          <el-row>
            <el-row style="line-height: 44px;margin-top: 20px;">
              <el-col :span="8" v-for="item in agents" :key="item.id">
                <el-card shadow="never">
                  <el-row>
                    <el-col :span="10">
                      <!--                      <el-image :src="item.photograph"></el-image>-->

                    </el-col>
                    <el-col :span="12">
                      <span>{{ item.bname }}</span><br>
                      <span>评分:{{ item.grade }} | 20次评价</span>
                      <span>{{ item.contact }}</span>
                      <span><el-button type="success" size="mini"
                                       @click="sendMessage(item.id) ,centerDialogVisible=true">在线咨询</el-button></span>
                    </el-col>
                  </el-row>
                </el-card>
              </el-col>

            </el-row>
          </el-row>
        </el-main>

      </el-container>
      <el-dialog
          title="在线咨询"

          :visible.sync="centerDialogVisible"
          width="30%"
          center>
        <div style="background: #f2f2f2;height: 400px;overflow: auto;padding: 10px">
          <el-row>
            <h3>{{ data }}</h3>
          </el-row>
          <div v-html="content"></div>
        </div>
        <div style="margin-top: 20px">
          <el-input
              type="textarea"
              autosize
              placeholder="请输入内容"
              v-model="messagePojo.msg">
          </el-input>
        </div>
        <span slot="footer" class="dialog-footer">
    <el-button @click="centerDialogVisible = false">关闭</el-button>
    <el-button type="success" @click="send">发送</el-button>
  </span>
      </el-dialog>
      <el-dialog
          title="预约看房"
          :visible.sync="requestHouseFlag"
          width="30%"
          center>
        <div style="background: #fff;height: 400px;overflow: auto;padding: 10px">
          <el-form label-width="80px" :model="request" :rules="loginRules" ref="loginForm">
            <el-form-item label="姓名" prop="bname">
              <el-input v-model="request.bname"></el-input>
            </el-form-item>
            <el-form-item label="手机号" prop="mobile">
              <el-input v-model="request.mobile"></el-input>
            </el-form-item>
            <el-form-item label="预约时间" prop="request_date">
              <el-date-picker v-model="request.request_date" value-format="yyyy-MM-dd"></el-date-picker>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click.native.prevent="submitRequest">提交</el-button>
              <el-button @click="requestHouseFlag = false">关闭</el-button>
            </el-form-item>

          </el-form>
        </div>
      </el-dialog>
      <!--      <el-image :src="img" style="width: 100px; height: 100px"-->
      <!--      ></el-image>-->
    </div>
  </div>


</template>

<script>
import cheader from "@/components/cheader";
import oldHouseApi from "@/api/oldhouse";
// import informationApi from "@/api/information";
import requestApi from "@/api/request";
import {getUser} from "../../../utils/auth";

export default {
  name: "info",
  data() {
    return {
      rolling: 0,
      banner: 0,
      img: '',
      center: {lng: 0, lat: 0},
      zoom: 3,
      url: 'http://localhost:8888/document/download/',
      URL: [],
      imgList: [],
      pojo: {},
      id:'',
      isCollection:true,
      agent: {'ppppp': 789},
      agents: [],
      activeIndex: '/oldHouse/info',
      centerDialogVisible: false,
      messageAgent: {},
      messagePojo: {
        toId: '',
        msg: ''
      },
      websocket: null,
      data: '',
      content: '',
      requestHouseFlag: false,
      request: {
        house_id: ""
      },

      loginRules: {
        bname: [
          {required: true, message: '请输入联系人姓名', trigger: 'blur'}

        ],
        mobile: [
          {required: true, message: '请输入手机号', trigger: 'blur'},
          {min: 11, max: 11, message: '请输入长度为11位的手机号', trigger: 'blur'}
        ],
        request_date: [
          {required: true, message: '请输入看房时间', trigger: 'blur'}

        ],
      }
    };
  },
  computed: {
    // fix(array){
    //
    //   let a=array.map(i=>{
    //     return this.url+i;
    //   })
    //   return this.URL=a;
    // }
  },
  created() {
    this.getInfo(this.$route.params.id)
    //this.fix(this.imgList);
    // console.log(this.URL)
    //  this.getUrl(this.imgList)
    console.log('++++++++' + this.URL)
  },
  mounted() {
    console.log(this.$route.params.id + '++++++++++++++');

    if ('WebSocket' in window) {

      this.websocket = new WebSocket('ws://localhost:8888/websocket/server/' + getUser().name);
      this.initWebSocket()
    } else {
      alert('当前浏览器 Not support websocket')

    }
  },
  beforeDestroy() {
    this.onbeforeunload()
  },
  filters: {
    formatDate(time) {
      var date = new Date(time);
      return formatRiQi(date);
    }
  },
  methods: {
    change() {
      console.log(this.centerDialogVisible);
      this.centerDialogVisible = false;
      console.log(this.centerDialogVisible);
    },

    getInfo(id) {
      oldHouseApi.findById(id).then(res => {
        if (res.data.code == '0') {
          this.pojo = res.data.data;
          this.id=res.data.data.id;
          this.imgList = this.pojo.list;
          let array = this.imgList.map(i => {
            return this.url + i
          })
          this.URL = array
        }
      })
    },
    // 更换大图
    currbanner(im) {
      this.banner = parseInt(im)
    },
    // 左滑
    rollLeft() {
      // 每次偏移量
      this.rolling += 60
      // 大图根据下标显示
      this.banner -= 1
      if (this.rolling > 0) {
        this.rolling = 0
      } else {
        this.$refs.roll.style.left = this.rolling + 'px'
      }
      if (this.banner < 0) {
        this.banner = 0
      }
      if (this.banner <= 0) {
        this.$message.warning('已经是第一张了')
      }
    },
    // 右滑
    rollRight() {
      this.rolling -= 60
      this.banner += 1
      if (this.rolling < -this.allroll) {
        this.rolling = -this.allroll
      } else {
        this.$refs.roll.style.left = this.rolling + 'px'
      }
      if (this.banner > this.imgList.length - 1) {
        this.banner = this.imgList.length - 1
      }
      if (this.banner >= this.imgList.length - 1) {
        this.$message.warning('已经是最后一张了')
      }
    },


    sendMessage() {
      if (true) {
        // informationApi.findById(1).then(response => {
        //     this.messageAgent = response.data
        // })
        this.content = ''
        this.centerDialogVisible = true;
      } else {
        this.$router.push({path: '/login'})
      }

    },
    initWebSocket() {
      //连接错误
      this.websocket.onerror = this.setErrorMessage

      // //连接成功
      this.websocket.onopen = this.setOnopenMessage

      //收到消息的回调
      this.websocket.onmessage = this.setOnmessageMessage

      //连接关闭的回调
      this.websocket.onclose = this.setOncloseMessage

      //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
      window.onbeforeunload = this.onbeforeunload
    },
    setErrorMessage() {
      this.data = "WebSocket连接发生错误" + '   状态码：' + this.websocket.readyState;
    },
    setOnopenMessage() {
      this.data = "WebSocket连接成功" + '   状态码：' + this.websocket.readyState;
    },
    setOnmessageMessage(event) {
      //this.data = '服务端返回：' + event.data;
      var temp = event.data
      console.log(temp)
      this.content += "<el-row>\n" +
          "            <span style=\"padding: 10px\">" + '经纪人' + "：张三</span><br>\n" +
          "            <span style=\"line-height: 30px;display: block;background: #fff;width: 45%;border-radius: 5px;margin: 10px;padding:5px\">" + temp + "</span>\n" +
          "          </el-row>"
    },
    setOncloseMessage() {
      this.data = "WebSocket连接关闭" + '   状态码：' + this.websocket.readyState;
    },
    onbeforeunload() {
      this.closeWebSocket();
    },

    //websocket发送消息
    send() {
      this.messagePojo.toId = this.messageAgent.id
      this.websocket.send(JSON.stringify(this.messagePojo.msg))
      this.content += "<div style='width: 100%;height: auto'><div style=\"text-align: right;line-height: 10px;margin: 10px\">\n" +
          "            <div style=\"padding: 10px;\">" + getUser().name + "</div>\n" +
          "            <div style=\"line-height: 30px;background: #fff;margin-left:55%;width: 45%;border-radius: 5px;padding:5px\">" + this.messagePojo.msg + "</div>\n" +
          "          </div></div>"
      console.log(this.messagePojo.msg)
      this.messagePojo.msg = ''

    },
    closeWebSocket() {
      this.websocket.close()
    },
    submitRequest() {
      console.log(this.request)
      this.request.house_id = this.$route.params.id
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          requestApi.save(this.request).then(response => {
            this.$message({
              message: response.message,
              type: (response.flag ? 'success' : 'error')
            })
            this.requestHouseFlag = false
          })
        } else {
          console.log('error submit!!');
          return false
        }
      })

    },
    onCollection(){
      if(this.isCollection){
        //取消收藏
        let params = {};
        let f_special_document_id = localStorage.getItem("f_special_document_id");
        params.f_special_document={
          f_special_document_id:f_special_document_id,
        };
        delSort(params).then(response => {
          if (response.data.httpStatus === 200) {
            this.$notify({
              title: "成功",
              message: "取消收藏",
              type: "success",
              offset: 100
            });
            this.key = 0; //使用key值区分两种状态的样式
            this.isCollection = false; //待收藏状态
            this.blogData.f_collection_sum -= 1; 收藏数减一
          } else {
            this.$notify.error({
              title: "错误",
              message: response.data.message,
              offset: 100
            });
          }
        });
      }else{
        //新增收藏
        let params = {};
        let f_special_document_id = localStorage.getItem("f_special_document_id");
        let f_special_document_name = localStorage.getItem("f_special_document_name");
        params.f_special_document={
          f_special_document_id:f_special_document_id,
          f_special_document_name:f_special_document_name,
        }
        addSort(params).then(response => {
          if (response.data.httpStatus === 200) {
            this.$notify({
              title: "成功",
              message: "收藏成功",
              type: "success",
              offset: 100
            });
            this.key = 1;
            this.isCollection = true;
            this.blogData.f_collection_sum += 1;
          } else {
            this.$notify.error({
              title: "错误",
              message: response.data.message,
              offset: 100
            });
          }
        })
      }
    },

  },

  components: {
    cheader
  },
};

function formatRiQi(sj) {
  var now = new Date(sj);
  var year = now.getFullYear();
  var month = now.getMonth() + 1;
  var date = now.getDate();
  var hour = now.getHours();
  var minute = now.getMinutes();
  var second = now.getSeconds();
  // return   year+"-"+month+"-"+date; //+"   "+hour+":"+minute+":"+second;
  return year + "年" + month + "月" + date + "日"; //+"   "+hour+":"+minute+":"+second;

}
</script>

<style scoped>
span {
  color: #606266;
}

.el-icon-arrow-left.el-icon-arrow-right:hover {
  transform: scale(1.4);
}

.el-icon-arrow-left.el-icon-arrow-right {
  cursor: pointer;
  transition: all 0.6s;
}

.head {
  background-image: url("../../../assets/img/bg-app.jpg");
}
</style>
