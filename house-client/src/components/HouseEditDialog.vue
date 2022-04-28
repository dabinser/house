<template>
  <div class="dialog2">
    <el-dialog
        :title="dialog2.title"
        :visible.sync="dialog2.show"
        :close-on-click-modal='false'
        :close-on-press-escape='false'
        :modal-append-to-body="false"
        :before-close='closeDialog'
        width="30%">
      <div class="form">
        <el-form ref="form" :model="formData" :rules="form_rules" label-width="120px" style="margin:10px;width:auto;">
          <el-form-item label="地址：" prop="area">
            <el-input v-model="formData.address" type="address"></el-input>
          </el-form-item>
          <el-form-item label="价格：" prop="price">
            <el-input v-model="formData.pay"></el-input>
          </el-form-item>

          <el-form-item label="状态：" prop="status">
            <el-select v-model="formData.is_rent">
              <el-option v-for="(formStatus,index) in format_status_list" :key="index" :label="formStatus"
                         :value="formStatus"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="详情：" prop="content">
            <el-input v-model="formData.content" type="textarea" :rows="4"></el-input>
          </el-form-item>
          <el-form-item label="租客：" prop="renter">
            <el-tag :key="item.id" v-for="(item,index) in renter"closable :disable-transitions="false" @close="handleClose(tag)" >
              {{item.name}}
            </el-tag>
            <el-input
                class="input-new-tag"
                v-if="inputVisible"
                v-model="inputValue"
                ref="saveTagInput"
                size="small"
                @keyup.enter.native="handleInputConfirm"
                @blur="handleInputConfirm"
            >
            </el-input>
            <el-button v-else class="button-new-tag" size="small" @click="showInput">+新增租客</el-button>
          </el-form-item>
          <el-form-item class="text_right">
            <el-button @click="dialog2.show = false">取消</el-button>
            <el-button type="primary" @click='onSubmit("form")'>提交</el-button>
          </el-form-item>
        </el-form>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import houseApi from '../api/house.js'
import paidApi from "../api/paid";

export default {
  name: 'useredit-dialog',
  props: {
    dialog2: Object,
    formData: Object
  },
  data() {
    return {
      index: '',
      format_status_list: [
        "已出租", "未出租"
      ],
      format_renterName_list: [],
      format_renterId_list: [],
      form_rules: {
        address: [
          {required: true, message: '请输入地址', trigger: 'blur'}
        ],
        price: [
          {required: true, message: '请输入价格', trigger: 'blur'}
        ],
        status: [
          {required: true, message: '请选择状态', trigger: 'blur'}
        ],
        detail: [
          {required: true, message: '请输入详情', trigger: 'blur'}
        ],
      },
      renter:[],
      inputVisible: false,
      inputValue: ''
    }
  },
  watch: {
    'dialog2.show': {
      handler(val) {
        if (val && this.formData.show) {
          console.log(this.formData.id)
          this.getInfo()
        }
      }
    }
  },
  methods: {
    getInfo() {
      console.log(this.formData.id)
      paidApi.findById(this.formData.id).then(res => {
        if (res.data.code == '0') {
          this.renter=res.data.data
          var userName = new Array();
          userName[0] = "无"
          var userId = new Array();
          userId[0] = 0
          for (var i = 0; i < res.data.data.length; i++) {
            userName[i + 1] = res.data.data[i].name;
            userId[i + 1] = res.data.data[i].id;
          }
          this.format_renterName_list = userName;
          this.format_renterId_list = userId
        } else {
          this.$message({
            message: '获取租客列表失败',
            type: 'warning'
          });
        }
      });
    },
    handleClose(tag) {
      this.dynamicTags.splice(this.dynamicTags.indexOf(tag), 1);
    },
    closeDialog(done) {
      if (this.$refs['form'] !== undefined) {
        this.$refs['form'].resetFields();
      }
      done();
    },
    onSubmit(form) {
      this.$refs[form].validate(valid => {
        if (valid) {

          let pojo

          if (isNaN(this.formData.userlist_Name)) {
            if (this.formData.userlist_Name == "无") {
              pojo = {
                id: this.formData.id,
                area: this.formData.address,
                pay: this.formData.price,
                is_rent: this.formData.status,
                content: this.formData.detail,
                userlist_Id: null,
                userlist_Name: null
              };
            } else {
              for (var i = 0; i < this.format_renterId_list.length; i++) {
                if (this.format_renterId_list[i] == this.formData.userlist_Id) {
                  this.index = i
                  break
                }
              }
              pojo = {
                id: this.formData.id,
                area: this.formData.address,
                pay: this.formData.price,
                is_rent: this.formData.status,
                content: this.formData.detail,
                userlist_Id: this.format_renterId_list[this.index],
                userlist_Name: this.format_renterName_list[this.index]
              };
            }
          } else {
            if (this.formData.userlist_Name == 0) {
              pojo = {
                id: this.formData.id,
                area: this.formData.address,
                pay: this.formData.price,
                is_rent: this.formData.status,
                content: this.formData.detail,
                userlist_Id: null,
                userlist_Name: null
              };
            } else {
              pojo = {
                id: this.formData.id,
                area: this.formData.address,
                pay: this.formData.price,
                is_rent: this.formData.status,
                content: this.formData.detail,
                userlist_Id: this.format_renterId_list[this.formData.userlist_Name],
                userlist_Name: this.format_renterName_list[this.formData.userlist_Name]
              };
            }
          }


          houseApi.updateHouse(pojo).then(res => {
            //修改成功之后的处理
            if (res.data.code = '0') {
              this.$message({
                message: "修改成功",
                type: "success"
              });
              this.dialog2.show = false;
              this.$emit('update');
            } else {
              this.$message({
                message: "修改失败",
                type: "warning"
              });
            }
          });
        }
      });
    },
    showInput() {
      this.inputVisible = true;
      this.$nextTick(_ => {
        this.$refs.saveTagInput.$refs.input.focus();
      });
    },

    handleInputConfirm() {
      let inputValue = this.inputValue;
      if (inputValue) {
        this.dynamicTags.push(inputValue);
      }
      this.inputVisible = false;
      this.inputValue = '';
    }

  }
};
</script>


<style scoed>
.el-tag + .el-tag {
  margin-left: 10px;
}
.button-new-tag {
  margin-left: 10px;
  height: 32px;
  line-height: 30px;
  padding-top: 0;
  padding-bottom: 0;
}
.input-new-tag {
  width: 90px;
  margin-left: 10px;
  vertical-align: bottom;
}
</style>

