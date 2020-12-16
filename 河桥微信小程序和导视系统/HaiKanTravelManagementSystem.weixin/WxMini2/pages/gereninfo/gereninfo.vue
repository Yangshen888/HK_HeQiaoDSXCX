<template>
	<view class="center">
		<view class="center_top">
			<view class="mask"></view>
		</view>
		
		<view class="center_box_bg">
			<view class="profily">
				<view class="base">
					<view class="profily_header">
						<image :src="imrrl" style="width: 120rpx;height: 120rpx;border-radius: 50%;margin-top: 30rpx;margin-left: 16rpx;"></image>
					</view>
					<view style="color: #FFFFFF;font-size: large;margin-top: -70rpx;margin-left: 160rpx;height: 50rpx;">{{mobile.nickname}}</view>
					<view style="color: #FFFFFF;font-size: small;float: right;margin-top: -50rpx;width: 168rpx;" @click="edininfo">
						<image src="https://hqjsc.hzgx.info/wxapp/static/gereninfo/d.png" mode="" style="float: left;"></image>
						<view style="padding-left: 40rpx;">修改信息></view>
					</view>
				</view>
				<view style="margin-top: 20rpx;">
					<view style="width: 33.3%;border-right: 1px solid #EBEEF5;text-align: center;color: #ffffff;float: left;">
						<view style="font-weight: 1000;">性别</view>
						<view style="font-size: small;height: 40rpx;margin-top: 8rpx;">{{mobile.sex}}</view>
					</view>
					<view style="width: 33.3%;border-right: 1px solid #EBEEF5;text-align: center;color: #ffffff;float: left;">
						<view style="font-weight: 1000;">年龄</view>
						<view style="font-size: small;height: 40rpx;margin-top: 8rpx;">{{mobile.age}}</view>
					</view>
					<view style="width: 33.3%;text-align: center;color: #ffffff;float: left;">
						<view style="font-weight: 1000;">居住地</view>
						<view class="topic_cont_text" style="font-size: small;height: 40rpx;margin-top: 8rpx;line-height: 40rpx;">{{mobile.placeofresidence}}</view>
					</view>
				</view>
				<view>
				</view>
			</view>
			<view class="baiban">
			</view>
			<view style="padding: 30rpx;border-color: #FFFFFF;margin-top: 60rpx;">
<!-- 				<view style="overflow: hidden;position: relative;height: 50rpx;line-height: 50rpx;">
					<image src="https://hqjsc.hzgx.info/wxapp/static/gereninfo/1.png" style="position: absolute;top: 50%;transform: translateY(-50%); width: 12rpx;height: 30rpx;"></image>
					<text style="color: #000000; font-size: small;margin-left: 20rpx;"> 功能导航</text>
				</view> -->
				<view style="width: 100%;overflow: auto;padding: 20rpx 0;">
					<!-- <view style="float:left; width: 25%;text-align: center;" @click="lyjianyi">
						<image src="https://hqjsc.hzgx.info/wxapp/static/gereninfo/f.png" style="width: 110rpx;height: 110rpx;"></image>
						<view style="font-size: 24rpx;font-weight: 400;">客服中心</view>
					</view> -->
					<view style="position: relative;line-height: 80rpx; float:left; width: 100%;margin: 10rpx 0;background-color: rgba(255,255,255,0.8);border-radius: 20rpx;" @click="tostrategy">
						<!-- @click="glfabu" -->
						<view class="btnBox">
							<u-icon name="order" style="font-size: 18px;padding: 10rpx 0;"></u-icon>
						</view>
						<view style="font-size: 24rpx;font-weight: 400;float: left;padding-right: 10px;margin-left: 10rpx;">攻略发布</view>
						<u-icon name="arrow-right" style="position: absolute;top: 50%;transform: translateY(-50%);right: 32rpx;"></u-icon>
					</view>
					<!-- <view style="float:left; width: 100%;margin: 10rpx 0;background-color: rgba(255,255,255,0.8);border-radius: 20rpx;" @click="toSceneSpot">
						<view class="btnBox">
							<u-icon name="edit-pen" style="font-size: 18px;padding: 10rpx 0;"></u-icon>
						</view>
						<view style="font-size: 24rpx;font-weight: 400;float: left;padding-right: 10px;margin-left: 10rpx;">答题竞赛</view>
						<u-icon name="arrow-right" style="position: absolute;top: 50%;transform: translateY(-50%);right: 32rpx;"></u-icon>
					</view> -->
					<view style="position: relative;line-height: 80rpx;float:left; width: 100%;margin: 10rpx 0;background-color: rgba(255,255,255,0.8);border-radius: 20rpx;" @click="toclock">
						<!-- @click="glfabu" -->
						<view class="btnBox">
							<u-icon name="tags-fill" style="font-size: 18px;padding: 10rpx 0;"></u-icon>
						</view>
						<view style="font-size: 24rpx;font-weight: 400;float: left;padding-right: 10px;margin-left: 10rpx;">景点打卡</view>
						<u-icon name="arrow-right" style="position: absolute;top: 50%;transform: translateY(-50%);right: 32rpx;"></u-icon>
					</view>
					<view style="position: relative;line-height: 80rpx;float:left; width: 100%;margin: 10rpx 0;background-color: rgba(255,255,255,0.8);border-radius: 20rpx;" @click="toKefu">
						<view class="btnBox">
							<u-icon name="more-circle" style="font-size:18px;padding: 10rpx 0;"></u-icon>
						</view>
						<view style="font-size: 24rpx;font-weight: 400;float: left;padding-right: 10px;margin-left: 10rpx;">留言建议</view>
						<u-icon name="arrow-right" style="position: absolute;top: 50%;transform: translateY(-50%);right: 32rpx;"></u-icon>
					</view>
					<view style="position: relative;line-height: 80rpx;float:left; width: 100%;margin: 10rpx 0;background-color: rgba(255,255,255,0.8);border-radius: 20rpx;" @click="yijianbh">
						<view class="btnBox">
							<u-icon name="bell" style="font-size: 18px;padding: 10rpx 0;"></u-icon>
						</view>
						<view style="font-size: 24rpx;font-weight: 400;float: left;padding-right: 10px;margin-left: 10rpx;">一键报警</view>
						<u-icon name="arrow-right" style="position: absolute;top: 50%;transform: translateY(-50%);right: 32rpx;"></u-icon>
					</view>
					<!-- <view style="float:left; width: 25%;text-align: center;" @click="tocs">
						<image src="https://hqjsc.hzgx.info/wxapp/static/gereninfo/h.png" style="width: 110rpx;height: 110rpx;"></image>
						<view style="font-size: 24rpx;font-weight: 400;">宝藏记录</view>
					</view> -->
				</view>
			</view>
		</view>
		<view style="width: 100%;bottom:0;position: fixed;margin-bottom: 200rpx;">
			<p style="font-family: 华文行楷;font-size:50rpx;text-align: center;">
				河桥镇
				<br />
				<span style="font-size:24rpx;font-family: 华文黑体;">HeQiaoZhen</span>
			</p>
		</view>
		<!-- 底部tabs -->
<!-- 		<view class="bottomTab" style="width: 100%;position: fixed;bottom: 0;background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/tabbg.png);background-size: 100%;z-index: 99;">
			<view class="tabItem" @click="tohome">

				<u-icon name="home"></u-icon>
				<view>主页</view>
			</view>
			<view class="tabItem"  @click="tohandsmap">

				<u-icon name="map"></u-icon>
				<view>虚拟导览</view>
			</view>
			<view class="tabItem">

				<u-icon name="account" color="#079fe5"></u-icon>
				<view>我的</view>
			</view>
		</view> -->
	</view>
</template>

<script>
	import {
		GetPogoID,
	} from '@/api/gereninfo/gereninfo.js';
	export default {
		data() {
			return {
				menushow: false,
				mobile: {
					age: "",
					nickname: "",
					userIdCard: "",
					phone: "",
					sex: "",
					placeofresidence: "",
					systemUserUuid: '',
				},
				imrrl:"https://hqjsc.hzgx.info/wxapp/static/mengxin.jpg",
			}
		},
		onLoad() {
			//console.log("进入个人中心");
			//console.log(this.$store.state.userId);
			this.doGetweekmenu();
			let data = {
				systemUserUuid: this.$store.state.userId
			};
			GetPogoID(data).then(res => {			
				console.log("获取微信用户信息");
				console.log(res);
				if (res.data.data.listData == '') {
					uni.showToast({
						title: '未获取到信息',
						icon: 'none'
					});
					return;
				} else {
					this.mobile = res.data.data[0];
					if(this.mobile.sex == "男")
					{
						this.imrrl="https://hqjsc.hzgx.info/wxapp/static/man.jpg"		
					};	
					if(this.mobile.sex == "女")
					{
						this.imrrl="https://hqjsc.hzgx.info/wxapp/static/woman.jpg"		
					};		
					console.log(this.mobile);
				}
			});
		},
		methods: {
			tostrategy(){
				uni.navigateTo({
					url: '/pages/gereninfo/strategy'
				})
			},
			checkAuth() {
				console.log(11111);
				console.log(this.$store.state);
				if (this.$store.state.openid == '' || this.$store.state.openid == null) {
					return true;
				} else {
					return false;
				}
			},
			toclock(){
				uni.navigateTo({
					url: '/pages/gereninfo/clockinfo'
					// url: '/pages/parking/copy1'
				})
			},
			toKefu() {
				// uni.showModal({
				//     title: '提示',
				//     content: '此模块正在建设中,敬请期待相关精彩内容!',
				//     success: function (res) {
				//         if (res.confirm) {
				//             console.log('用户点击确定');
				//         } else if (res.cancel) {
				//             console.log('用户点击取消');
				//         }
				//     }
				// });
				// uni.navigateTo({
				// 	url: '../gereninfo/liuyan'
				// });
				if (this.checkAuth()) {
					console.log("登陆失败");
					uni.redirectTo({
						url: '/pages/index/index'
					});
				} else {
					console.log("已经登录成功");
					uni.navigateTo({
						url: '/pages/gereninfo/liuyan'
					})
				}
			},
			toSceneSpot() {
				uni.showModal({
					title: '提示',
					content: '此模块正在建设中,敬请期待相关精彩内容!',
					success: function(res) {
						if (res.confirm) {
							console.log('用户点击确定');
						} else if (res.cancel) {
							console.log('用户点击取消');
						}
					}
				});
			},
			tohome(){
				uni.navigateTo({
					url: '/pages/home/index'
				})
			},
			tohandsmap() {
				uni.navigateTo({
					url: '/pages/home/handsmap'
				});
			},
			tocs() {
				uni.navigateTo({
					url: '../precious/preciousjl'
				});
			},
			glfabu() {
				uni.navigateTo({
					url: '../gereninfo/gonglue'
				});
			},
			lyjianyi() {
				uni.showModal({
					title: '提示',
					content: '此模块正在建设中,敬请期待相关精彩内容!',
					success: function(res) {
						if (res.confirm) {
							console.log('用户点击确定');
						} else if (res.cancel) {
							console.log('用户点击取消');
						}
					}
				});
				// uni.navigateTo({
				// 	url: '../gereninfo/liuyan'
				// });
			},
			edininfo() {
				uni.redirectTo({
					url: '../gereninfo/editgereninfo'
				});
			},
			yijianbh() {
				uni.makePhoneCall({
					// 手机号
					phoneNumber: '110',
					// 成功回调
					success: (res) => {
						console.log('调用成功!')
					},

					// 失败回调
					fail: (res) => {
						console.log('调用失败!')
					}

				});
			},
			doGetweekmenu() {
				if (this.menushow == false) {
					this.menushow = true;
				} else {
					this.menushow = true;
				}
			},
		},
	}
</script>

<style>
	.center{
		background-image: url(https://hqjsc.hzgx.info/wxapp/static/taohua.gif);
		background-size: 100% 100%;
	}
	.topic_cont_text {
		overflow: hidden;
		word-break: break-all;
		/* break-all(允许在单词内换行。) */
		text-overflow: ellipsis;
		/* 超出部分省略号 */
		display: -webkit-box;
		/** 对象作为伸缩盒子模型显示 **/
		-webkit-box-orient: vertical;
		/** 设置或检索伸缩盒对象的子元素的排列方式 **/
		-webkit-line-clamp: 1;
		/** 显示的行数 **/

	}
	.btnBox{
		width: 10%;
		text-align: center;
		float: left;
		padding-top: 4rpx;
	}
</style>

<style lang="scss" scoped>
	// @import 'uview-ui/index.scss';

	.menu {
		/* background: url(https://hqjsc.hzgx.info/wxapp/static/image/yjjx.png) no-repeat; */
		background-size: 100%;
		height: 60rpx;
		width: 100%;
		overflow: hidden;
	}
	.tabItem{
		width: 33.333333%;
		height: 100%;
		float: left;
		text-align: center;
		padding: 10px 0;
	}
	.tabItem u-icon{
		font-size: 24px;
	}
</style>

<style lang="scss">
	page {
		height: 100%;
	}

	.profily,
	.profily_header {
		border-radius: 8px;
		margin-top: -45px;
	}

	.center {
		height: 100%;

		&_top {
			height: 10%;
			//background: url('https://hqjsc.hzgx.info/wxapp/static/fumou-center-template/header.jpg') no-repeat 0% 50%;
			background-size: cover;

			// background: #E6E6E6;
			// .mask {
			// 	background: rgba(0, 0, 0, .4);
			// 	height: 100%;
			// }
		}

		&_box_bg {
			//background: #F9F9F9;
			position: relative;

			.profily {
				position: absolute;
				width: 90%;
				// border:1px solid #F7F7F7;
				margin: 0 auto;
				top: -100upx;
				left: 5%;
				// background: #b19f8b;
				// background-color:rgba(177,159,139,0.7);
				background-color:rgba(102, 102, 102, 0.5);
				padding: 35upx;
				box-sizing: border-box;
				margin-top: 28px;
				//box-shadow: 0px 2px 5px #EDEDED;
			}
		}
	}

	.base {
		// display: flex;
		align-items: center;
		//border-bottom: 2px solid #F6F6F6;
		padding-bottom: 35upx;
		position: relative;

		.profily_header {
			height: 160upx;
			width: 160upx;
			background-size: 100%;
		}

		text {
			margin-left: 20px;
			font-size: 30upx;
		}

		image {
			// position: absolute;
			height: 35rpx;
			width: 35rpx;
			right: 0px;
			top: 0px;
		}
	}

	.order_status {
		display: flex;
		justify-content: space-between;
		margin-top: 35upx;

		.status {
			width: 140upx;
			font-size: 24upx;
			text-align: center;
			letter-spacing: .5px;
			display: flex;
			flex-direction: column;

			.icon {
				width: 50upx;
				height: 50upx;
				margin: 0 auto;
				margin-bottom: 5px;

			}
		}
	}

	.baiban {
		//background: #FEFEFE;
		height: 200upx;
	}

	.center_menu {
		width: 100%;
		display: inline-block;

		.menu_item {
			font-size: 28upx;
			letter-spacing: 1px;
			padding: 14px 5%;
			//background: #FEFEFE;
			overflow: hidden;
			box-sizing: border-box;
			display: flex;
			align-items: center;
			position: relative;
			border-bottom: 1px solid #EFEFEF;

			&:hover {
				background: #F6F6F6 !important;
			}

			&::after {
				content: '';
				width: 30upx;
				height: 30upx;
				position: absolute;
				right: 5%;
				background: url('https://hqjsc.hzgx.info/wxapp/static/fumou-center-template/right.png') no-repeat;
				background-size: 100%;
			}

			text:nth-of-type(1) {
				margin-left: 10px;
			}

			image {
				width: 40upx;
				height: 40upx;
			}

			&:nth-of-type(4) {
				margin-top: 10px;
			}
		}
	}
</style>
