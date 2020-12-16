<template>
	<view>
<!-- 		<u-navbar title="微信授权登录"></u-navbar> -->
		<view class="wrap">
			<view class="list-wrap">
<!-- 				<u-field v-model="phone" label="手机号" placeholder="请获取手机号" icon="phone-fill" disabled="true"></u-field> -->
				<!-- #ifdef MP-WEIXIN -->
				<button
					class="dlbutton"
					hover-class="dlbutton-hover"
					type="default"
					open-type="getUserInfo"
					@getuserinfo="getUserInfo"
					withCredentials="true"
				>
					微信号授权登录
				</button>
<!-- 				<button v-if="phone < 11" class="dlbutton" hover-class="dlbutton-hover" open-type="getPhoneNumber" @getphonenumber="getPhoneNumber">获取手机号</button> -->
				<!-- #endif -->
			</view>
		</view>
	</view>
</template>

<script>
import { GetWechat, getWXOpenAuth, WXAuth, WXPhone } from '@/api/wxopenid/wxinfo.js';
export default {
	data() {
		return {
			phone: '',
			appid: 'wx71a9025f448231c3',
			secret: '0e85aa98e4854fc34aee28924c8937e8'
		};
	},
	methods: {
		getUserInfo(e) {
			console.log(e);
			let that = this;
			uni.login({
				provider: 'weixin',
				success: function(loginRes) {
					console.log(loginRes);
					// 获取用户信息
					uni.getUserInfo({
						provider: 'weixin',
						success: function(infoRes) {
							console.log(infoRes);
							console.log('用户昵称为：' + infoRes.userInfo.nickName);
							// console.log(that.phone);
							let data = {
								encryptedData: infoRes.encryptedData,
								iv: infoRes.iv,
								nickName: infoRes.userInfo.nickName,
								session_key: uni.getStorageSync('session_key'),
								openid: uni.getStorageSync('openid'),
								phone: that.phone,
								sex: infoRes.userInfo.gender
							};
							WXAuth(data).then(res => {
								console.log(res);
								if (res.data.code == 200) {
									uni.showToast({ title: res.data.message + ' 正在登陆....', icon: 'none', mask: true, duration: 3000 });
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
																	isUploadV: res.data.data.isUpVideo,
																	isUploadP:res.data.data.isUpPicture,
																	isAddPR:res.data.data.isAddPR,
																	isFlow:res.data.data.isFlow,
																	idCard: res.data.data.idCard
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
																console.log(22);
																uni.reLaunch({
																	url: '../home/handsmap'
																});
																// }
															} else {
																uni.showModal({
																	title: '提示',
																	content: '登录失败'
																});
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
							});
						},
						fail: function(err) {
							uni.showModal({
								title: '提示',
								content: '微信授权失败',
								showCancel: false
							});
						}
					});
				}
			});
		},
		getPhoneNumber(e) {
			console.log(e.detail.errMsg);
			console.log(e.detail.iv);
			console.log(e.detail.encryptedData);

			if (e.detail.errMsg == 'getPhoneNumber:ok') {
				var that = this;
				uni.login({
					success: function(res) {
						let js_code = res.code;
						let data = {
							appid: that.appid,
							secret: that.secret,
							js_code: js_code
						};
						GetWechat(data).then(res => {
							console.log(res);
							if (res.data.code == 200) {
								uni.setStorageSync('openid', res.data.data.openid);
								uni.setStorageSync('session_key', res.data.data.session_key);
								console.log('openid:' + res.data.data.openid);
								console.log('session_key:' + res.data.data.session_key);
								let data = {
									encryptedData: e.detail.encryptedData,
									iv: e.detail.iv,
									nickName: '',
									session_key: res.data.data.session_key,
									openid: res.data.data.openid,
									phone: '',
									sex: 0
								};
								WXPhone(data).then(res => {
									console.log(res);
									that.phone = res.data.data;
								});
							} else {
								uni.showModal({
									title: '提示',
									content: '解密用户信息失败'
								});
							}
						});
					}
				});
			} else {
				uni.showModal({
					title: '提示',
					content: '获取手机号失败,登录需要手机号',
					showCancel: false
				});
			}
		}
	}
};
</script>

<style>
.wrap {
	padding: 30rpx;
}
.dlbutton {
	color: #ffffff;
	font-size: 34upx;
	width: 470upx;
	height: 100upx;
	background: linear-gradient(-90deg, rgba(63, 205, 235, 1), rgba(188, 226, 158, 1));
	box-shadow: 0upx 0upx 13upx 0upx rgba(164, 217, 228, 0.2);
	border-radius: 50upx;
	line-height: 100upx;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	margin-top: 40upx;
}
.dlbutton-hover {
	background: linear-gradient(-90deg, rgba(63, 205, 235, 0.9), rgba(188, 226, 158, 0.9));
}
</style>





<!-- <template>
	<view>
		<view class="wrap">
			<view class="list-wrap">
				<button class="dlbutton" hover-class="dlbutton-hover" type="default" open-type="getUserInfo" @getuserinfo="getUserInfo" withCredentials="true">
					微信号授权登录
				</button>
			</view>
		</view>
	</view>
</template>

<script>
	import { GetWechat,getWXOpenAuth,WXAuth } from '@/api/wxopenid/wxinfo.js';
export default {
	
		data() {
			return {
				appid: 'wx71a9025f448231c3',
				secret: '0e85aa98e4854fc34aee28924c8937e8'
			};
		},
	methods: {
		getopenid(data){
			GetWechat(data).then(res => {
				if (res.data.code == 200) {
					uni.setStorageSync('openid', res.data.data.openid);
					uni.setStorageSync('session_key', res.data.data.session_key);
					console.log('openid:' + res.data.data.openid);
					console.log('session_key:' + res.data.data.session_key);
					if (res.data.data.openid != '' && res.data.data.openid != null && res.data.data.openid != undefined) {
						this.recordUser();
					}
				} else {
					uni.showModal({
						title: '提示',
						content: 'Openid获取失败,请重新获取!',
						showCancel: false
					});
				}
			});
		},
		getusertoken(openid){
			let that = this;
			getWXOpenAuth(openid).then(res => {
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
						// phone: res.data.data.phone,
						openid: res.data.data.openid,
						// HomeAddressUUID: res.data.data.homeAddressUUID,
						// shopid: res.data.data.shop_guid,
						idCard: res.data.data.idCard
					};
					that.$store.commit('login', user);
					//that.$store.state.phone = user.userName;
					that.$store.state.seltab = 1;

					uni.reLaunch({
						url: '../home/index'
					});
					// }
				} else {
					uni.showModal({
						title: '提示',
						content: '登录失败'
					});
				}
			});
		},
		
		recordUser(){
			let that = this;
			uni.getUserInfo({
				provider: 'weixin',
				success: function(infoRes) {
					console.log(infoRes);
					console.log('用户昵称为：' + infoRes.userInfo.nickName);
			
					// console.log(that.phone);
					let data = {
						encryptedData: infoRes.encryptedData,
						iv: infoRes.iv,
						nickName: infoRes.userInfo.nickName,
						session_key: uni.getStorageSync('session_key'),
						openid: uni.getStorageSync('openid'),
						// phone: that.phone,
						sex: infoRes.userInfo.gender
					};
			
					WXAuth(data).then(res => {
						if (res.data.code == 200) {
							that.getusertoken(uni.getStorageSync('openid'))
						}
					});
				},
				fail: function(err) {
					uni.showModal({
						title: '提示',
						content: '微信授权失败',
						showCancel: false
					});
				}
			});
		},
		getUserInfo(e) {
			uni.reLaunch({
				url: '../home/index'
			});
			
			// let that = this;
			
			// uni.login({
			// 	success: function(res) {
			// 		let js_code = res.code;
			// 		console.log(res)
			// 		let data = {
			// 			appid: that.appid,
			// 			secret: that.secret,
			// 			js_code: js_code
			// 		};
			// 		console.log(data)
			// 		//if(that.utils.isEmpty(uni.getStorageSync('openid')))
			// 		{
			// 			that.getopenid(data)
			// 		}
			// 	}
			// });
		},
		
	}
};
</script>

<style>
.wrap {
	padding: 30rpx;
}
.dlbutton {
	color: #ffffff;
	font-size: 34upx;
	width: 470upx;
	height: 100upx;
	background: linear-gradient(-90deg, rgba(63, 205, 235, 1), rgba(188, 226, 158, 1));
	box-shadow: 0upx 0upx 13upx 0upx rgba(164, 217, 228, 0.2);
	border-radius: 50upx;
	line-height: 100upx;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	margin-top: 40upx;
}
.dlbutton-hover {
	background: linear-gradient(-90deg, rgba(63, 205, 235, 0.9), rgba(188, 226, 158, 0.9));
}
</style>
 -->