//手机号验证
const globalvalidatePhone = (rule, value, callback) => {
  if (value !== '' && value !== null) {
    var reg = /^1[3456789]\d{9}$/;
    if (!reg.test(value)) {
      callback(new Error('请输入有效的手机号码'));
    }
  } else {
    callback(new Error('手机号码不能为空'));
  }
  callback();
};
//手机号验证非必填
const globalvalidatePhone2 = (rule, value, callback) => {
  if (value !== '' && value !== null) {
    var reg = /^1[3456789]\d{9}$/;
    if (!reg.test(value)) {
      callback(new Error('请输入有效的手机号码'));
    }
  }
  callback();
};
//身份证校验方法
function IdentityCodeValid(code) { //验证身份证合法性
  var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
  var tip = "";
  var pass= true;
  var patt1=new RegExp("(^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$)|(^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{2}$)");
  if(!code || !patt1.test(code)){
    tip = "身份证号格式错误";
    pass = false;
  }
  else if(!city[code.substr(0,2)]){
    tip = "地址编码错误";
    pass = false;
  }
  else{
    //18位身份证需要验证最后一位校验位
    if(code.length == 18){
      code = code.split('');
      //∑(ai×Wi)(mod 11)
      //加权因子
      var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
      //校验位
      var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
      var sum = 0;
      var ai = 0;
      var wi = 0;
      for (var i = 0; i < 17; i++)
      {
        ai = code[i];
        wi = factor[i];
        sum += ai * wi;
      }
      var last = parity[sum % 11];
      if(parity[sum % 11] != code[17]){
        tip = "校验位错误";
        pass =false;
      }
    }
  }
  return pass;
}
//身份证验证必填
const globalvalidateIDCard = (rule, value, callback) => {
  if (value !== '' && value !== null) {
    //var reg = /^\d{6}(18|19|20)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/;
    if (!IdentityCodeValid(value)) {
      callback(new Error('请输入正确的身份证号'));
    }
  } else {
    callback(new Error('身份证号不能为空'));
  }
  callback();
};
//身份证验证非必填
const globalvalidateIDCardNoMust = (rule, value, callback) => {
  if (value !== '' && value !== null) {
    //var reg = /^\d{6}(18|19|20)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/;
    if (!IdentityCodeValid(value)) {
      callback(new Error('请输入正确的身份证号'));
    }
  }
  callback();
};
//邮箱验证
const globalvalidateEmail = (rule, value, callback) => {
  if (value !== '' && value !== null) {
      var reg = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
      if (!reg.test(value)) {
        callback(new Error('请输入有效的邮箱'));
      }
    }
    callback();
};
//密码验证
const globalvalidatePassword=(rule, value, callback) => {
  if (value !== '' && value !== null) {
    //var reg = ;
    //if (!reg.test(value))
    if(value.length<6||value.length>12)
    {
      callback(new Error('请输入6-12位密码'));
    }
  }
  else {
    callback(new Error('密码不能为空'));
  }
  callback();
};
//纯数字验证（可以小数）
const globalvalidateNum = (rule, value, callback) => {
  if (value !== '' && value !== null) {
    var reg = /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
    if (!reg.test(value)) {
      callback(new Error('请输入大于等于0的数字'));
    }
  }
  callback();
};
//纯数字验证
const globalvalidateOnlyNum = (rule, value, callback) => {
  if (value !== '' && value !== null) {
    var reg = /^[0-9]*$/;
    if (!reg.test(value)) {
      callback(new Error('请填写大于0的正整数'));
    }
    else if(value==0)
    {
      callback(new Error('请填写大于0的正整数'));
    }
  }
  callback();
};
//数字验证(0-20)
const globalvalidateOnlyNum2 = (rule, value, callback) => {
  if (value !== '' && value !== null) {
    //console.log(parseInt(value));
    // if (!parseInt(value)) {
    //   callback(new Error('请填写0-20的正整数'));
    // }else
    if(parseInt(value)<0||parseInt(value)>20){
      callback(new Error('请填写0-20的正整数'));
    }
    // else if(value==0)
    // {
    //   callback(new Error('请填写大于0的正整数'));
    // }
  }
  callback();
};
//数字验证(1-9)
const globalvalidateOnlyNum3 = (rule, value, callback) => {
  if (value !== '' && value !== null) {
    //console.log(parseInt(value));
    // if (!parseInt(value)) {
    //   callback(new Error('请填写0-20的正整数'));
    // }else
    if(parseInt(value)<1||parseInt(value)>9){
      callback(new Error('请填写0-20的正整数'));
    }
    // else if(value==0)
    // {
    //   callback(new Error('请填写大于0的正整数'));
    // }
  }
  callback();
};

//数字字母组合验证，长度30
const globalvalidateNumletter = (rule, value, callback) => {
  if (value !== '' && value !== null) {
    var reg = /^[A-Za-z0-9]{1,30}$/;
    if (!reg.test(value)) {
      callback(new Error('请输入长度小于30的数字字母组合'));
    }
  }
  callback();
};
//数字字母组合验证，无长度限制
const globalvalidateNumletter2 = (rule, value, callback) => {
  if (value !== '' && value !== null) {
    var reg = /^[A-Za-z0-9]+$/;
    if (!reg.test(value)) {
      callback(new Error('请输入数字字母组合'));
    }
  }
  callback();
};
//密码验证字母数字，长度大于6小于30
const globalvalidatepwd=(rule,value,callback)=>{
  if(value==null||value.trim()==''){
    callback(new Error('请输入密码'));
  }
  if(value!==''&&value!=null)
  {
    var pwdRegex = new RegExp('(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{6,30}');
    if (!pwdRegex.test(value))
    {
      callback(new Error('密码中必须包含字母.数字.特殊字符!'));
    }
  }
  callback();
};
//只包含汉字
const globalvalidatehanzi=(rule,value,callback)=>{
  if(value!==''&&value!=null)
  {
    var reg = /^[\u4E00-\u9FFF]{2,6}$/;
    if (!reg.test(value)) {
      callback(new Error('请输入长度大于2小于6的纯汉字'));
    }
  }
  callback();
};
//只包含汉字
const globalvalidatehanzi2=(rule,value,callback)=>{
  if(value!==''&&value!=null)
  {
    var reg = /^[\u4E00-\u9FFF]+$/;
    if (!reg.test(value)) {
      callback(new Error('请输入纯汉字'));
    }
  }
  callback();
};
//非空格
const globalvalidateIsNotEmpty=(rule,value,callback)=>{
  if(value==null||value.trim()=="")
  {
    callback(new Error('请输入字符'));
  }
  callback();
};

export{
  globalvalidatePhone,
  globalvalidatePhone2,
  globalvalidateIDCard,
  globalvalidateIDCardNoMust,
  globalvalidateEmail,
  globalvalidatePassword,
  globalvalidateNum,
  globalvalidateNumletter,
  globalvalidateNumletter2,
  globalvalidateOnlyNum,
  globalvalidatepwd,
  globalvalidatehanzi,
  globalvalidatehanzi2,
  globalvalidateOnlyNum2,
  globalvalidateIsNotEmpty
}
