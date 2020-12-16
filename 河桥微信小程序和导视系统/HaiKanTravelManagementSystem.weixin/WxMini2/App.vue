<script>
	import { GetWechat,getWXOpenAuth } from '@/api/wxopenid/wxinfo.js';
	export default {
		onLaunch: function() {
			console.log('App Launch')
		},
		onShow: function() {
			console.log('App Show')
		},
		onHide: function() {
			console.log('App Hide')
		},
		data() {
			return {
				appid: 'wx71a9025f448231c3',
				secret: '0e85aa98e4854fc34aee28924c8937e8'
			};
		},
		// 此处globalData为了演示其作用，不是uView框架的一部分
		globalData: {
			username: '白居易'
		},
		onLaunch() {
			// 1.1.0版本之前关于http拦截器代码，已平滑移动到/common/http.interceptor.js中
			// 注意，需要在/main.js中实例化Vue之后引入如下(详见文档说明)：
			// import httpInterceptor from '@/common/http.interceptor.js'
			// Vue.use(httpInterceptor, app)
		},
		mounted() {
			var that = this;
			uni.login({
				success: function(res) {
					let js_code = res.code;
					let data = {
						appid: that.appid,
						secret: that.secret,
						js_code: js_code
					};
					console.log(data);
					GetWechat(data).then(res => {
						console.log(res);
						if (res.data.code == 200) {
							uni.setStorageSync('openid', res.data.data.openid);
							uni.setStorageSync('session_key', res.data.data.session_key);
							console.log('openid:' + res.data.data.openid);
							console.log('session_key:' + res.data.data.session_key);
							if (res.data.data.openid != '' && res.data.data.openid != null && res.data.data.openid != undefined) {
								getWXOpenAuth(res.data.data.openid).then(res => {
									console.log('最开始:');
									console.log(res);
									if (res.data.code == 200) {
										let token = res.data.data.tokens;
										uni.setStorageSync('token', token);
										let user = {
											userName: res.data.data.user_name,
											userId: res.data.data.user_guid,
											userType: res.data.data.user_type,
											//DepartmentName: res.data.data.user_departmentName,
											//DepartmentGuid: res.data.data.user_departmentGuid,
											RoleName: res.data.data.roleName,
											token: token,
											phone: res.data.data.phone,
											openid: res.data.data.openid,
											// HomeAddressUUID: res.data.data.homeAddressUUID,
											// shopid: res.data.data.shop_guid,
											idCard: res.data.data.idCard,
											isUploadV: res.data.data.isUpVideo,
											isUploadP:res.data.data.isUpPicture,
											isAddPR:res.data.data.isAddPR,
											isFlow:res.data.data.isFlow,
											schoolGuid:res.data.data.schoolguid,
										};
										that.$store.commit('login', user);
										//that.$store.state.phone = user.userName;
										that.$store.state.seltab = 1;
										console.log(11111111111111);
										console.log(that.$store.state);
										console.log('code=' + res.data.code);
										console.log(res);
										// if (res.data.data.address == '' || res.data.data.address == null) {
										// 	uni.reLaunch({
										// 		url: '../YongHu/addinfo'
										// 	});
										// } else {
										// 	console.log(22);
										// uni.reLaunch({
										// 	url: '../home/index'
										// });
										// }
									} else {
										// uni.showModal({
										// 	title: '提示',
										// 	content: res.data.message,
										// 	showCancel: false,
										// 	success: function(res) {
		
										// uni.reLaunch({
										// 	url: '../login/login'
										// });
										// uni.navigateTo({
										// 	url: '/pages/home/index'
										// });
										// 	}
										// });
									}
								});
							}
						} else {
							uni.showModal({
								title: '提示',
								content: 'Openid获取失败,请重新获取!',
								showCancel: false
							});
						}
					});
				}
			});
		}
	}
</script>

<style lang="scss">
	@import "uview-ui/index.scss";
	/*每个页面公共css */
</style>
