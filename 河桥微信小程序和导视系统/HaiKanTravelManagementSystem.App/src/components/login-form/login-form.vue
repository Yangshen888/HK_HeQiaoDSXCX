<template>
  <Form ref="loginForm" :model="form" :rules="rules" @keydown.enter.native="handleSubmit">
    <FormItem prop="userName">
      <Input v-model="form.userName" placeholder="请输入用户名">
        <span slot="prepend">
          <Icon :size="16" type="ios-person"></Icon>
        </span>
      </Input>
    </FormItem>
    <FormItem prop="password">
      <Input type="password" v-model="form.password" placeholder="请输入密码">
        <span slot="prepend">
          <Icon :size="14" type="md-lock"></Icon>
        </span>
      </Input>
    </FormItem>
    <FormItem prop="picLyanzhengma" style="height: 32px;border: 1px solid #999;border-radius: 5px;border:0px;">
        <Input  placeholder="请输入验证码..." style="width: 80%;height: 30px;margin-top: -5px;"  v-model="form.picLyanzhengma"></Input>
      <!-- <input type="text" placeholder="请输入验证码" style="height: 30px;border: 0;width: 80%;border-right: 1px solid #eee;text-indent: 10px;" > -->
      <input type="button" id="code" @click="createCode" style="height: 30px;width: 20%;border: 0;background-color: #93dabf;color: #000; " v-model="checkCode"/>
      <!--      <span class="tishixiaoxi disappear">请输入验证码。</span>-->
    </FormItem>
    <!--    <FormItem label="测试账户">-->
    <!--      <RadioGroup v-model="form.userType" type="button" @on-change="handleUserTypeChange">-->
    <!--        <Radio label="超级管理员"></Radio>-->
    <!--        <Radio label="普通用户"></Radio>-->
    <!--      </RadioGroup>-->
    <!--    </FormItem>-->
    <FormItem>
      <Button
        style="border-radius: 20px; width:80%;margin-left: 10%;background-color: #93dabf;border:0px;color: #000;"
        :disabled="processing"
        @click="handleSubmit"
        type="info"
        long
        :loading="loading"
      >{{btnLoginText}}</Button>
    </FormItem>
    <p class="login-tip">欢迎使用海看导视系统</p>
  </Form>
</template>
<script>
    export default {
        name: "LoginForm",
        props: {
            // userNameRules: {
            //   type: Array,
            //   default: () => {
            //     return [{ required: true, message: "账号不能为空", trigger: "blur" }];
            //   }
            // },
            // passwordRules: {
            //   type: Array,
            //   default: () => {
            //     return [{ required: true, message: "密码不能为空", trigger: "blur" }];
            //   }
            // },
            //   picLyanzhengmaRules: {
            //       type: Array,
            //       default: () => {
            //           return [{ required: true, message: "验证码不能为空", trigger: "blur" },
            //           ];
            //       },
            // validator:(value)=>{
            //     console.log(value);
            //     if(value!=this.checkCode)
            //         return "验证码错误"
            // },
            // },
            processing: {
                type: Boolean,
                default: false
            },
            loading: {
                type: Boolean,
                default: false
            }
        },
        data() {
            var checkyzm=(rule, value, callback) => {
                if (value !== '' && value !== null) {
                    if(value.toUpperCase() != this.checkCode ) {
                        //若输入的验证码与产生的验证码不一致时
                        this.createCode();//刷新验证码
                        this.form.picLyanzhengma = '';
                        callback(new Error('验证码错误'));
                    }
                }
                callback();
            };
            return {
                form: {
                    userName: '',
                    password: '',
                    picLyanzhengma:'',
                    userType: 1
                },
                checkCode:"",
                rules:{
                    userName: [{ required: true, message: "用户名不能为空", trigger: "blur" }],
                    password: [{ required: true, message: "密码不能为空", trigger: "blur" }],
                    picLyanzhengma:[{ required: true, message: "验证码不能为空", trigger: "blur" },
                        {validator: checkyzm, trigger: 'blur'}]
                }
            };
        },
        computed: {

            btnLoginText() {
                return this.processing ? "正在处理,请稍候..." : "登录";
            },

        },
        created(){
            this.createCode();
        },
        methods: {
            // 图片验证码
            createCode(){
                var code = "";
                var codeLength = 4;//验证码的长度
                var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',
                    'S','T','U','V','W','X','Y','Z');//随机数
                for(var i = 0; i < codeLength; i++) {
                    //循环操作
                    var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35）
                    code += random[index];//根据索引取得随机数加到code上
                }
                this.checkCode = code;//把code值赋给验证码
            },
            handleSubmit() {
                //console.log(this.form.userName);
                this.$refs.loginForm.validate(valid => {
                    if (valid) {

                        this.$emit("on-success-valid", {
                            userName: this.form.userName,
                            password: this.form.password
                        });
                    }
                });
            },
            handleUserTypeChange(val){
                switch(val){
                    case "超级管理员":
                        this.form.userName = "administrator";
                        break;
                    case "普通用户":
                        this.form.userName = "admin";
                        break;
                }
                this.form.password = "111111";
            }
        }
    };
</script>
