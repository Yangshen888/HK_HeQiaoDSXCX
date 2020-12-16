//判断字符是否为空的方法
function isEmpty(obj){
    if(typeof obj == "undefined" || obj == null || obj == ""){
        return true;
    }else{
        return false;
    }
}
//判断字符是否为null或undefined
function isNull(obj){
    if(typeof obj == "undefined" || obj == null || obj == ""){
        return "";
    }else{
        return obj;
    }
}
// 时间格式的转换
function Time(value) {
  if(value==undefined||value==null||value=="")
    return "";
  var dateee = new Date(value).toJSON();
  var date = new Date(+new Date(dateee)+8*3600*1000).toISOString().replace(/T/g,' ').replace(/\.[\d]{3}Z/,'')
  return date
}
export default{
	isEmpty,
	isNull,
	Time,
}