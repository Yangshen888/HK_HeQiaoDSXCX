<template>
	<view style="padding: 0px 20px;">
		<view class="wrap">
			<u-swiper :list="picture"></u-swiper>
		</view>
		<!-- 		<view style="height: 120px;margin: 0px auto;border-radius: 5px;background-image: url(https://hqjsc.hzgx.info/wxapp/static/image/swiper2.jpg);background-size: 100% 100%;">
		</view> -->
		<view style="border-bottom: 1px solid #EEEEEE;">
			<view style="float: left;">
				<p style="font-size: 15px;font-weight: bold;height: 40px;line-height: 40px;">{{Name}}</p>
				<p style="color: #C8C9CC;height: 30px;">{{address}}</p>
			</view>
			<view style="float: right;height: 70px;line-height: 70px;text-align: center;color: #F29100;font-size: 18px;">
				￥{{price}}
			</view>
			<view style="clear: both;"></view>
		</view>
		<view>
			<p style="height: 35px;line-height: 35px;font-size: 15px;font-weight: bold;">商品介绍</p>
			<view style="overflow: hidden;word-wrap:break-word;min-height: 60px;padding-bottom: 10px;">
				{{introduction}}
			</view>
		</view>
		<view>
			<p style="height: 35px;line-height: 35px;font-size: 15px;font-weight: bold;">联系电话</p>
			<view style="overflow: hidden;word-wrap:break-word;min-height: 60px;padding-bottom: 10px;" @click="toHotelKefu">
				{{phone}}
			</view>
		</view>
		<view>
			<button style="float: left; background-color: #0089ce; color: white; height: 35px;line-height: 35px;width: 45%;" @click="toOPenYuYue">立即预订</button>
			<button style="float: right;background-color: #FCBD71; color: white; height: 35px;line-height: 35px;width: 45%;" @click="toOpenMap">前往此地</button>
		</view>
	</view>
</template>

<script>
	import http from '@/utils/http.js';
	export default {
		data() {
			return {
				Name: "", //名称
				phone: "", //电话
				price: "", //价格
				address: "", //地址
				picture: [], //图片
				introduction: "", //介绍
				lon: "",
				lat: "",
				shopId:"",
			};
		},
		computed: {},
		onLoad(option) {
			let that = this;
			that.lon = option.lon;
			that.lat = option.lat;
			that.Name = option.Name;
			that.introduction = option.introduction;
			that.price = option.price;
			that.address = option.address;
			that.phone = option.phone;
			that.shopId = option.shopId;
			console.log("商品编号")
			console.log(that.shopId)
			let imglist = option.picture.split(',');
			for (let i = 0; i < imglist.length; i++) {
				that.picture.push({
					image: http.baseUrl + 'UploadFiles/Hotel/' + imglist[i]
				});
				
			}
			console.log("后台地址")
			console.log(http.baseUrl)
			console.log(that.picture)
		},
		methods: {	
			toOPenYuYue(){
				let that = this;
				console.log("商品编号")
				console.log(that.shopId)
				wx.navigateToMiniProgram({
				  //appId: 'wxde8ac0a21135c07d',		//美团APPID
				  appId: 'wx52d250a5d4957ade',		//需要跳转的APPID
				  path: 'pages/good/index?id=' + that.shopId,		//打开跳转的小程序具体页面路径
				  extraData: {
				  },
				  envVersion: 'release',		//正式版
				  //envVersion: 'develop',		//开发板
				  //envVersion: 'trial',			//体验版
				  success(res) {
				    // 
					console.log("打开成功")
				  }
				})
			},
			toOpenMap() {			
				let lon = parseFloat(this.lon);
				let lat = parseFloat(this.lat);
				uni.openLocation({
					latitude: lat,
					longitude: lon,
					name:this.address,
					success: function() {
						console.log('success');
					},
					fail: function(err) {
						console.log(err);
					}
				});
				
				// uni.chooseLocation({
				// 	longitude:lon,
				// 	latitude:lat,
				//     success: function (res) {
				// 		console.log(lat);
				// 		console.log(lon);
				//         console.log('位置名称：' + res.name);
				//         console.log('详细地址：' + res.address);
				//         console.log('纬度：' + res.latitude);
				//         console.log('经度：' + res.longitude);
				//     },fail:function(err){
				//     	console.log(222222);
				//     	console.log(err);
				//     }
				// });
			},
			goXieCheng() {
				uni.navigateToMiniProgram({ //这里用uniapp的跳转方法，原生应该是wx.navigateToMiniProgram
					appId: 'wx0e6ed4f51db9d078', //这里的appid为目标小程序的appid，此处为携程小程序
					path: '',
					extraData: {},
					success(res) {
						// 打开成功
						console.log(res)
					},
					fail(err) {
						// 打开失败	
						console.log(err)
					}
				})
			},
			toHotelKefu() {
				uni.makePhoneCall({
					// 手机号
					phoneNumber: this.phone,
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
		}
	};
</script>

<style>
	page{
		margin-bottom: 50px;
	}
</style>
