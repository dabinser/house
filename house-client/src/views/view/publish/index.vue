<template>
    <div>
      <cheader></cheader>
      <div style="width: 50%;margin:  0 auto;padding-top: 30px">
            <el-row style="padding-top: 20px" :gutter="40">
              <el-col :span="24">
                <el-form label-width="180px" >
                  <el-form-item label="图片">
                    <el-upload
                      :action="url+houseId"
                      list-type="picture-card"
                      :on-preview="handlePictureCardPreview"
                      :on-remove="handleRemove"
                      :on-success="handleUploadSuccess"
                      :limit="limitImageCount"
                      :on-exceed="handleExceed"
                      :auto-upload="false"
                      :multiple="true"
                       ref="upload"
                      :file-list="fileList"
                    >
                      <i class="el-icon-plus"></i>
                    </el-upload>
                    <el-dialog :visible.sync="dialogVisible">
                      <img width="100%" :src="dialogImageUrl" alt="">
                    </el-dialog>
                  </el-form-item>
                  <el-form-item label="房源所在省份">
                    <v-distpicker province="广东省" city="广州市" area="海珠区" @selected="onSelected"></v-distpicker>

                  </el-form-item>
                  <el-form-item label="详细地址">
                    <el-input v-model="pojo.area"></el-input>
                  </el-form-item>
                  <el-form-item label="租房方式">
                    <el-input v-model="pojo.mode"></el-input>
                  </el-form-item>
                  <el-form-item label="租金">
                    <el-input v-model="pojo.pay"></el-input>
                  </el-form-item>
                  <el-form-item label="房屋朝向">
                    <el-input v-model="pojo.orientation"></el-input>
                  </el-form-item>
                  <el-form-item label="房屋类型">
                    <el-input v-model="pojo.content"></el-input>
                  </el-form-item>
                  <el-form-item label="委托人">
                    <el-input v-model="pojo.contacts"></el-input>
                  </el-form-item>
                  <el-form-item label="联系电话" :rules="phoneRules.phone">
                    <el-input v-model="pojo.phone" ></el-input>
                  </el-form-item>

                  <el-form-item label="房屋面积">
                    <el-input v-model="pojo.square"></el-input>
                  </el-form-item>
                  <el-form-item label="房屋所在楼层">
                    <el-input v-model="pojo.storey"></el-input>
                  </el-form-item>

                  <el-form-item label="配套设施">
                    <el-checkbox label="电梯"  v-model="pojo.elevator" true-label="1" false-label="0"></el-checkbox>
                    <el-checkbox label="车位"  v-model="pojo.carport" true-label="1" false-label="0"></el-checkbox>
                    <el-checkbox label="用水"  v-model="pojo.water" true-label="1" false-label="0"></el-checkbox>
                    <el-checkbox label="用电"  v-model="pojo.electricity" true-label="1" false-label="0"></el-checkbox>
                    <el-checkbox label="燃气"  v-model="pojo.gas" true-label="1" false-label="0"></el-checkbox>
                    <el-checkbox label="取暖"  v-model="pojo.heater" true-label="1" false-label="0"></el-checkbox>
                    <el-checkbox label="用电"  v-model="pojo.electricity" true-label="1" false-label="0"></el-checkbox>
                  </el-form-item>
                  <el-form-item label="租期">
                    <el-input v-model="pojo.tenancy"></el-input>
                  </el-form-item>
                  <el-form-item label="房源标题">
                    <el-input v-model="pojo.title"></el-input>
                  </el-form-item>

                </el-form>
              </el-col>
            </el-row>
            <el-row style="text-align: center;margin-bottom: 50px">
              <el-button type="success" @click="handleSave" class="cbtn-bg">提交委托</el-button>
            </el-row>

      </div>
      <cfooter></cfooter>
    </div>
</template>

<script>
    import cheader from "@/components/cheader";
    import cfooter from "@/components/cfooter";
    import resourceApi from "@/api/resource";
    import house from "../../../api/house";

    export default {
        name: "index",
        components :{
            cheader,
            cfooter
        },
        data() {
            return {
              url: 'api/document/batch/',
              houseId: '',
              name: '',
              region: '',
              date1: '',
              date2: '',
              delivery: false,
              type: [],
              resource: '',
              desc: '',
              code: '',
              pojo: {}, // 编辑表单绑定的实体对象
              cityList: [], // 城市列表
              dialogImageUrl: '',
              dialogVisible: false,
              uploadPicture: [],
              fileList: [],
              limitImageCount: 6,
              id: '',// 当前用户编辑的ID
              phoneRules: {
                phone: [
                  {required: true, message: '请输入手机号', trigger: 'blur'},
                  {min: 11, max: 11, message: '请输入长度为11位的手机号', trigger: 'blur'}
                ],
              }
            }

        },
        methods: {
            onSubmit() {
                console.log('submit!');
            },
            handleSave() {
                house.addHouse(this.pojo).then(res=>{

                  this.$message({
                    message: res.data.msg,
                    type:(res.data.data ? 'success' :'error')
                  })
                  if (res.data.code=='0'){
                    this.houseId=res.data.data
                    console.log(this.houseId)
                    this.$refs.upload.submit()
                    console.log('+++++++')
                    this.fetchData() // 刷新列表
                    this.fileList = [];
                  }

                })
                // resourceApi.update(this.id, this.pojo).then(response => {
                //     this.$message({
                //         message: response.data.msg,
                //         type: (response.data.data ? 'success' : 'error')
                //     })
                //     if (response.data.data) { // 如果成功
                //         this.$refs.upload.submit()
                //         console.log('+++++++')
                //         this.fetchData() // 刷新列表
                //         this.fileList = [];
                //     }
                // })
                this.dialogFormVisible = false // 关闭窗口
            },
            handleRemove(file, fileList) {
                console.log(file, fileList);
            },
            handlePictureCardPreview(file) {

                this.dialogImageUrl = file.url;
                this.dialogVisible = true;
            },
            handleUploadSuccess(response, file, fileList) {
                var total = 0;
                console.log(this.pojo)
                console.log(fileList);
                console.log('++++++++')
                console.log(file);
                if (this.pojo.image != null ) {
                    total =  fileList.length+this.pojo.image.length;

                }else{
                    total = fileList.length;
                }

                if (total>6) {
                    this.$alert('房源描述最多6张图片', '提示', {
                        confirmButtonText: '确定',
                        callback: action => {
                            this.$message({
                                type: 'info',
                                message: `action: ${action}`
                            });
                        }
                    });
                }else{
                    console.log("---------------")
                    console.log(fileList)
                    this.uploadPicture = [];
                    for (var i = 0; i < fileList.length; i++) {
                        console.log(fileList.length)
                        this.uploadPicture.push("api/document/batch/1"+fileList[i].response.src);
                    }
                }
            },
            handleExceed(file, fileList) {

                this.$alert('房源描述最多6张图片', '提示', {
                    confirmButtonText: '确定',
                    callback: action => {
                        this.$message({
                            type: 'info',
                            message: `action: ${action}`
                        });
                    }
                });
            },

            deleteImage(src, index) {
                var picture = this.pojo.image;
                console.log(src + "   " + index)
                this.$confirm('确定要删除此图片吗?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    picture.splice(index,1);
                })
                this.pojo.image = picture;
            },
            handleChange(value) {
                console.log(value);
            },
            onSelected(data) {
                this.pojo.province = data.province.value
                this.pojo.city = data.city.value
                this.pojo.county = data.area.value
            },
        }
    }
</script>

<style scoped>
  .el-form-item__label{
    color: #000000;
  }
  .crow{
    line-height: 30px;
  }
  .cbtn-bg{
    width: 200px;
    height: 50px;
    font-size: 18px;
    background: #00ae66;
    border: none;
    border-radius: 0px
  }
</style>
