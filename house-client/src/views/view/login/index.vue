<template>
  <div>
    <div style="height: 40px;padding-left: 100px;border-bottom: 3px #00ae66 solid;">
      <h2 style="color: #00ae66;cursor: pointer;margin: 0 auto;position: relative;top: 10px" @click="indexShow">房屋租赁</h2>
    </div>
    <div class="bg">
      <div style="width: 320px;margin: 0 auto;background: #fff;padding: 40px;position: relative;top: -100px">
        <el-row v-show="loginShow">
          <el-row>
            <h2 style="color: #000 ;margin: 0 auto;position: relative;left: 40%">账号登录</h2>
            <br>
          </el-row>
          <el-form autoComplete="on" :model="loginForm" :rules="loginRules" ref="loginForm">
            <el-form-item label="" prop="username">
              <el-input type="text" v-model="loginForm.username" placeholder="请输入手机号"></el-input>
            </el-form-item>
            <el-form-item label="" prop="password">
              <el-input type="password" v-model="loginForm.password" @keyup.enter.native="handleLogin"
                        placeholder="请输入密码"></el-input>
            </el-form-item>
            <el-form-item label="" prop="code">
              <el-input type="text" v-model="loginForm.code" placeholder="请输入验证码" style="width: 200px"></el-input>
              <el-image :src="url" style="width: 100px;height: 35px;margin: 0 auto;padding: 5px;position: relative;float: right"
                        @click="refresh" ref="captcha" title="看不清点我"></el-image>
            </el-form-item>
            <el-form-item>
              <el-button type="success" :loading="loading" @click.native.prevent="handleLogin" class="cbtn-bg">立即登录
              </el-button>
            </el-form-item>
          </el-form>
          <el-row style="line-height: 30px;color: #376699;font-size: 14px">
            <span style="cursor: pointer" @click="tabForm(2)">立即注册</span>
            <span style="float: right;cursor: pointer" @click="forget">忘记密码</span>
          </el-row>
          <el-row style="text-align: center;color: #999999;font-size: 12px;line-height: 50px">
            <span style="cursor: pointer">我已阅读并接受 《用户服务协议》及 《隐私政策》</span>
          </el-row>
        </el-row>
        <el-row v-show="!loginShow">
          <el-row>
            <h2 style="color: #000">欢迎注册</h2>
          </el-row>
          <el-form autoComplete="on" :model="loginForm" :rules="loginRules" ref="loginForm">
            <el-form-item label="" prop="username">
              <el-input type="text" v-model="loginForm.username" placeholder="请输入手机号"></el-input>
            </el-form-item>
            <el-form-item label="" prop="password">
              <el-input type="password" v-model="loginForm.password" @keyup.enter.native="handleRegis"
                        placeholder="请输入密码"></el-input>
            </el-form-item>
            <el-form-item>
              <el-button type="success" :loading="loading" @click.native.prevent="handleRegis" class="cbtn-bg">立即注册
              </el-button>
            </el-form-item>
          </el-form>
          <el-row style="line-height: 30px;color: #376699;font-size: 14px">
            <span style="cursor: pointer" @click="tabForm(1)">已有账号？登录</span>
            <span style="float: right;cursor: pointer" @click="forget">忘记密码</span>
          </el-row>
          <el-row style="text-align: center;color: #999999;font-size: 12px;line-height: 50px">
            <span style="cursor: pointer">我已阅读并接受 《用户服务协议》及 《隐私政策》</span>
          </el-row>
        </el-row>
      </div>

    </div>
    <cfooter style="position: absolute;bottom: 0px"></cfooter>
  </div>
</template>
<script>
    import cheader from "@/components/cheader";
    import cfooter from "@/components/cfooter";
   import userApi from "@/api/user";
    import axios from "axios";

    export default {
        name: "login",
        components: {
            cheader,
            cfooter
        },
        data() {
            return {
                url:'/api/kaptcha',
                loginForm: {
                    username: '',
                    password: '',
                    usertype: '用户',
                    code:''
                },
                loginRules: {
                    username: [
                        {required: true, message: '请输入手机号', trigger: 'blur'},
                        {min: 11, max: 11, message: '请输入长度为11位的手机号', trigger: 'blur'}
                    ],
                    password: [
                        {required: true, message: '请输入密码', trigger: 'blur'},
                        {min: 6, max: 12, message: '长度在 6 到 12 位的密码', trigger: 'blur'}
                    ],
                    code:[
                        {required: true,message: '请输入验证码', trigger:'blur'},
                        {min: 4, max: 4,message: '验证码长度为4位',trigger: 'blur'}
                    ]
                },
                loading: false,
                loginShow: true
            };
        },
        methods: {
            handleLogin() {
                this.$refs.loginForm.validate(valid => {
                    if (valid) {
                        this.loading = true;
                        this.$store.dispatch('Login', this.loginForm).then(() => {
                            this.loading = true;
                            location.reload()
                        }).catch(() => {
                            this.loading = false
                        })
                    } else {
                        console.log('error submit!!');
                        return false
                    }
                })
            },
            handleRegis() {
                this.$refs.loginForm.validate(valid => {
                    if (valid) {
                        this.loading = true;
                        userApi.save(this.loginForm).then(response => {
                            this.$message({
                                message: response.message,
                                type: (response.flag ? 'success' : 'error')
                            });
                            if (response.flag) { // 如果成功
                                this.$router.push({path: '/login'}) // 刷新列表
                            }
                        })
                    } else {
                        console.log('error submit!!');
                        return false
                    }
                })
            },
          refresh: function (event) {
            let num=Math.ceil(Math.random() * 10);
            this.$refs.captcha.src = this.url+'?'+num
          },
            resetForm(formName) {
                this.$refs[formName].resetFields();
            },
            tabForm(id) {
                if (id === 1) {
                    this.loginShow = true
                }
                if (id === 2) {
                    this.loginShow = false
                }
            },
            forget() {
                alert("忘记密码");
            },
            indexShow() {
                this.$router.push({path: '/rent'});
            }
        }
    }
</script>

<style scoped>
  .bg {
    background-image: url("../../../assets/img/bg-login.jpg");
    background-repeat: no-repeat;
    background-size: 100% 100%;
    height: 700px;
    color: #E9EEF3;
    padding-top: 150px;
  }

  .el-form-item__label {
    color: #000000;
  }

  .el-form-item__label {
    color: #E9EEF3;
  }

  .cbtn-bg {
    width: 100%;
    height: 40px;
    font-size: 14px;
    background: #00ae66;
    border: none;
    border-radius: 0px
  }
</style>
