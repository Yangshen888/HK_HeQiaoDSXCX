<template>
	<view style="height: 100%;">
		<view style="width: 65%; position: fixed;top: 7%;left: 50%;transform: translateX(-50%);z-index: 1;color: #000000;"
		 @click="toAbout">
		 <image src="https://hqjsc.hzgx.info/wxapp/static/images/456.png" mode="widthFix" style="width: 100%;"></image>
			<!-- <p style="font-family: '华文行楷';font-size:120rpx;text-align: center;">
				古韵河桥
			</p> -->
		</view>
		<!-- <view style="height: 100%;position: relative;" :style="{height:mapWid}"> -->
		<view style="position: relative;height: 100%;">
			<!-- 手绘地图 -->
			<!-- <image src="https://hqjsc.hzgx.info/wxapp/static/images/handsmap.png" style="width: 100%;" :style="{height:mapWid}"></image> -->
			<image src="https://hqjsc.hzgx.info/wxapp/static/images/handsmap777.png" mode="scaleToFill" style="width: 100%;height: 100vh;"></image>

		</view>
		<!-- 个人中心 -->
		<view style="position: fixed;bottom: 40rpx;right: 40rpx; color: #fff;border-radius: 50%; font-size: 20px;width: 80rpx;height: 80rpx;background-color:  rgba(136, 136, 136, 0.8);"
		 @click="toGerenInfo">
			<u-icon name="account" style="position: absolute;top: 43%;left: 50%;transform: translate(-50%,-50%);" size="44"></u-icon>
		</view>
		<!-- 地点详情 -->
		<view>
			<u-modal v-model="show" :title-style="{color: 'red'}" :show-title="false" :mask-close-able="true"
			 :show-confirm-button="false">
				<view class="slot-content">
					<view style="text-align: center;line-height: 60rpx;">河桥老街美食广场</view>
					<image src="https://hqjsc.hzgx.info/wxapp/static/images/images/jp.jpg" mode="widthFix" style="width: 100%;"></image>
					<view>
						<view>联系电话：123456789</view>
						<view style="overflow: auto;line-height: 30px;">
							<view style="float: left;">地址：云浪村</view>
							<view style="float: right;" @click="toOpenMap">前往</view>
						</view>
					</view>
				</view>
			</u-modal>
		</view>
		<!-- 食宿住行 -->
		<view style="position: fixed;left: 30rpx;top: 13%;width: 70rpx;">
			<view style="text-align: center;" @click="toESES">
				<image src="https://hqjsc.hzgx.info/wxapp/static/shi.png" mode="widthFix" style="width:100%"></image>
				<!-- <view style="border-bottom: 1px solid #fff;width: 40rpx;height: 68rpx;line-height: 68rpx;float: right;padding-right: 10rpx;">食</view> -->
			</view>
			<view style="text-align: center;" @click="toLive">
				<image src="https://hqjsc.hzgx.info/wxapp/static/su.png" mode="widthFix" style="width:100%"></image>
				<!-- <view style="border-bottom: 1px solid #fff;width: 40rpx;height: 68rpx;line-height: 68rpx;float: right;padding-right: 10rpx;"></view> -->
			</view>
			<view style="text-align: center;" @click="toParking">
				<image src="https://hqjsc.hzgx.info/wxapp/static/xing.png" mode="widthFix" style="width:100%"></image>
				<!-- <view style="border-bottom: 1px solid #fff;width: 40rpx;height: 68rpx;line-height: 68rpx;float: right;padding-right: 10rpx;"></view> -->
			</view>
			<view style="text-align: center;" @click="toTour">
				<image src="https://hqjsc.hzgx.info/wxapp/static/you.png" mode="widthFix" style="width:100%"></image>
				<!-- <view style="border-bottom: 1px solid #fff;width: 40rpx;height: 68rpx;line-height: 68rpx;float: right;padding-right: 10rpx;"></view> -->
			</view>
			<view style="text-align: center;" @click="toSpeciality">
				<image src="https://hqjsc.hzgx.info/wxapp/static/gou.png" mode="widthFix" style="width:100%"></image>
			</view>
			<view style="text-align: center;" @click="toAmusement">
				<image src="https://hqjsc.hzgx.info/wxapp/static/yu.png" mode="widthFix" style="width:100%"></image>
			</view>
			<view style="text-align: center;" @click="toLife">
				<image src="https://hqjsc.hzgx.info/wxapp/static/life.png" mode="widthFix" style="width:100%"></image>
			</view>
		</view>
		<!-- 村庄选择 -->
		<!-- <view style="position: fixed;left: 10rpx;bottom: 22%;padding: 0 10rpx;">
			<view style="width: 140rpx;">
				<view style="position: relative;background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/modelbg2.png);background-size: 100% 100%;margin: 10px 0;padding: 10rpx;height: 68rpx;"
				 @click="getmapview(30.101874,119.240659)" :key='spreadindex' :style="{color:currentColor[0]}">
					<image src="https://hqjsc.hzgx.info/wxapp/static/heqiao.png" style="width: 100%;height: 100%;"></image>
				</view>
				<view style="position: relative;background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/modelbg2.png);background-size: 100% 100%;margin: 10px 0;padding: 10rpx;height: 68rpx;"
				 @click="getmapview(30.118028,119.252617)" :key='spreadindex' :style="{color:currentColor[1]}">
					<image src="https://hqjsc.hzgx.info/wxapp/static/yunlang.png" style="width: 100%;height: 100%;"></image>
				</view>
				<view style="position: relative;background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/modelbg2.png);background-size: 100% 100%;margin: 10px 0;padding: 10rpx;height: 68rpx;"
				 @click="getmapview(30.096852,119.250369)" :key='spreadindex' :style="{color:currentColor[2]}">
					<image src="https://hqjsc.hzgx.info/wxapp/static/niluo.png" style="width: 100%;height: 100%;"></image>
				</view>
			</view>
		</view> -->
		<!-- 村庄选择 -->
		<view style="position: fixed;left: 0rpx;bottom: 24%;">
			<view style="width: 180rpx;">
				<view style="position: relative;margin: 10px 0;"
				 @click="getmapview(30.101874,119.240659)" :key='spreadindex' :style="{color:currentColor[0]}">
					<image src="https://hqjsc.hzgx.info/wxapp/static/heqiao.png" style="width: 100%;" mode="widthFix"></image>
				</view>
				<view style="position: relative;margin: 10px 0;"
				 @click="getmapview(30.118028,119.252617)" :key='spreadindex' :style="{color:currentColor[1]}">
					<image src="https://hqjsc.hzgx.info/wxapp/static/yunlang.png" style="width: 100%;" mode="widthFix"></image>
				</view>
				<view style="position: relative;margin: 10px 0;"
				 @click="getmapview(30.096852,119.250369)" :key='spreadindex' :style="{color:currentColor[2]}">
					<image src="https://hqjsc.hzgx.info/wxapp/static/niluo.png" style="width: 100%;" mode="widthFix"></image>
				</view>
			</view>
		</view>
		<!-- 底部tabs -->
		<!-- <view class="bottomTab" style="width: 100%;position: fixed;bottom: 0;background-color: #606266;opacity: 0.5;  z-index: 99;">
			<view class="tabItem" @click="tohome"> -->
		<!-- <image style="width: 100%;height: 30px;"></image> -->
		<!-- <u-icon name="home" color="#fff"></u-icon>
				<view style=" color:#fff">主页</view>
			</view>
			<view class="tabItem"> -->
		<!-- <image style="width: 100%;height: 30px;"></image> -->
		<!-- <u-icon name="map" color="#079fe5"></u-icon>
				<view style=" color:#fff">虚拟导览</view>
			</view>
			<view class="tabItem" @click="toGerenInfo"> -->
		<!-- <image style="width: 100%;height: 30px;"></image> -->
		<!-- <u-icon name="account" color="#fff"></u-icon>
				<view style=" color:#fff">我的</view>
			</view>
		</view> -->
		<view style="width: 120rpx;position: fixed;bottom: 20rpx;left: 20rpx;" @click="toAbout">
			<image src="https://hqjsc.hzgx.info/wxapp/static/panchMe.png" mode="widthFix" style="width: 100%;"></image>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				animation: {},
				menkey1: 1,
				menkey2: 2,
				menkey3: 3,
				menkey4: 4,
				menkey5: 5,
				mapWid: '',

				totalllis: [{
					title: '',
					img: ''
				}],
				sceniclis: [{
					title: '',
					img: ''
				}],
				canteenlis: [{
					title: '',
					img: ''
				}],
				hotellis: [{
					title: '',
					img: ''
				}],
				nativelis: [{
					title: '',
					img: ''
				}],
				picklis: [{
					title: '',
					img: ''
				}],
				show: false,
				list: [{
						name: '食',
						disabled: false
					},
					{
						name: '住',
						disabled: false
					},
					{
						name: '行',
						disabled: false
					},
					{
						name: '游',
						disabled: false
					}
				],
				value: '食',
				spreadindex: '0',
				currentColor: ['#fff', '#dcdcdc', '#dcdcdc'],
				centerRight: '22%',
				centerBottom: '16%',
				centerLeft: ''
			}
		},
		onLoad() {
			this.getmapwidth()
		},
		// onShow:function(){
		// 	const that=this;
		// 	var animation =wx.createAnimation({
		// 		duration:1000,
		// 		timingFunction:'linear',
		// 		delay:100,
		// 		transformOrigin:'ease',
		// 		success:function(res){
		// 			console.log(动画开始了)
		// 			console.log(res)
		// 		}
		// 	})
		// 	that.animation=animation;
		// 	setInterval(function(){
		// 		that.smallvalue++;
		// 		console.log(that.animation);
		// 		that.animation.width(40).height(20).step()
		// 		that.setData({
		// 			animation:animation.export()
		// 		})
		// 	}.bind(that),5000)
		// },
		methods: {
			toLife(){
				uni.navigateTo({
					url: '/pages/life/life'
				})
			},
			toAmusement(){
				uni.navigateTo({
					url: '/pages/amusement/amusement'
				})
			},
			toSpeciality(){
				uni.navigateTo({
					url: '/pages/speciality/speciality'
				})
			},
			touserinfo() {
				uni.navigateTo({
					url: '/pages/home/userinfo'
				})
			},
			toGerenInfo() {
				if (this.checkAuth()) {
					console.log("未登录");
					uni.redirectTo({
						url: '/pages/index/index'
					});
				} else {
					console.log("登录成功");
					uni.navigateTo({
						url: '/pages/gereninfo/gereninfo'
					})
				}
				// console.log("已经登录成功");
				// uni.navigateTo({
				//         url: '/pages/gereninfo/gereninfo'
				// })
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
			toESES() {
				uni.navigateTo({
					url: '/packageA/ESEA/ESEA'
				})
			},
			toLive() {
				uni.navigateTo({
					url: '/pages/home/live'
				});
			},
			toParking() {
				uni.navigateTo({
					url: '/pages/parking/parkingLot'
				});
			},
			toTour() {
				uni.navigateTo({
					url: '/pages/home/youtype'
				});
			},
			toAbout() {
				uni.navigateTo({
					url: '/pages/home/about'
				})
			},
			spread(item) {
				this.spreadindex = item;
				for (var i = 0; i < 3; i++) {
					if (i == item) {
						this.currentColor[i] = '#fff'
					} else {
						this.currentColor[i] = '#dcdcdc'
					}
				}
			},
			getmapview(latitude, longitude) {
				if (this.checkAuth()) {
					console.log("未登录");
					uni.redirectTo({
						url: '/pages/index/index'
					});
				} else {
					uni.navigateTo({
						url: '/pages/home/mapview?latitude=' + latitude + "&longitude=" + longitude
					});
				}
			},
			// 选中某个单选框时，由radio时触发
			radioChange(e) {
				console.log(e);
			},
			// 选中任一radio时，由radio-group触发
			radioGroupChange(e) {
				// console.log(e);
			},
			toOpenMap() {
				let lon = 119.243325;
				let lat = 30.106770;
				uni.openLocation({
					latitude: lat,
					longitude: lon,
					name: this.info.address,
					success: function() {
						console.log('success');
					},
					fail: function(err) {
						console.log(err);
					}
				});
			},
			open() {
				this.show = true;
			},
			tohome() {
				uni.navigateTo({
					url: '/pages/home/index'
				})
			},
			chooseItem(item) {
				// let that=this;
				this.current = item;
				for (let i = 0; i < 5; i++) {
					if (i == item) {
						this.navbgc[i] = '#079fe5';
						this.navcolor[i] = '#fff';
						this.menkey1 += 1;
						this.menkey2 += 1;
						this.menkey3 += 1;
						this.menkey4 += 1;
						this.menkey5 += 1;
						// console.log(this.navbgc)
						// console.log(this.navcolor)
					} else {
						this.navbgc[i] = '#fff';
						this.navcolor[i] = '#333';
						this.menkey1 += 1;
						this.menkey2 += 1;
						this.menkey3 += 1;
						this.menkey4 += 1;
						this.menkey5 += 1;
						// console.log(this.navbgc)
						// console.log(this.navcolor)
					}
				}
			},
			getmapwidth() {
				// let that = this;
				// // 获取系统信息
				// wx.getSystemInfo({
				//   success: function (res) {
				// 	that.setData({
				// 	  widheight: res.screenHeight
				// 	});
				// 	console.log(widheight)
				//   }
				// });
				let pageWid = wx.getSystemInfoSync().windowWidth;
				let pageHei = wx.getSystemInfoSync().windowHeight;
				console.log(pageWid);
				let mapscale = 1165 / 575;
				let mapWid = pageWid * mapscale;
				let widscale = pageWid / 375;
				let heiscale = pageHei / 760;

				this.centerRight = widscale * 160 + 'rpx';
				this.centerLeft = widscale * 320 + 'rpx';
				this.centerBottom = heiscale * 198 + 'rpx';
				console.log(mapWid)
				this.mapWid = mapWid + 'px';
			},
			// toGerenInfo() {
			// 	console.log("已经登录成功");
			// 	uni.navigateTo({
			// 		url: '/pages/gereninfo/gereninfo'
			// 	})
			// }
		}
	}
</script>

<style>
	page {
		height: 100%;
		overflow: auto;
	}

	.pallet {
		width: 60rpx;
		height: 24rpx;
		border-radius: 50%;
		border: 4rpx solid red;
		position: absolute;
		left: 50%;
		transform: translateX(-50%) rotate(-20deg);
		bottom: 26rpx;
		border-top: 0;
		border-right: 0;
		/* background-color: #fff; */
	}

	.smallpallet {
		width: 24rpx;
		height: 12rpx;
		border-radius: 50%;
		border: 1px solid #fff;
		position: absolute;
		left: 50%;
		transform: translateX(-50%);
		top: 0;
		border-top: 0;
		/* background-color: transparent; */
		/* background-color: #fff; */
	}

	.jiantou {
		position: absolute;
		width: 40rpx;
		height: 40rpx;
		transform: rotate(-45deg);
		background-color: #fff;
		/* border-left: 1px solid #333;
		border-bottom: 1px solid #333; */
	}

	.slot-content {
		font-size: 28rpx;
		color: $u-content-color;
		padding: 30rpx;
	}

	.area {
		margin: 10rpx 0;
		border-left: 1px solid #333;
		border-right: 1px solid #333;
	}

	.areatag {
		position: absolute;
		background-color: #fff;
		width: 60rpx;
		border-radius: 10rpx;
		text-align: center;
		padding: 4px;
	}

	.tabItem {
		width: 33.333333%;
		height: 100%;
		float: left;
		text-align: center;
		padding: 10px 0;
	}

	.tabItem u-icon {
		font-size: 24px;
	}
</style>
