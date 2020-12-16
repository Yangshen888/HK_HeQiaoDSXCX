<template>
	<view style="padding: 0px 20px;">
		<!-- <view class="wrap">
			<u-swiper :list="picture" height="300"></u-swiper>
		</view> -->
		<!-- 		<view style="height: 120px;margin: 0px auto;border-radius: 5px;background-image: url(https://hqjsc.hzgx.info/wxapp/static/image/swiper2.jpg);background-size: 100% 100%;">
		</view> -->
		<swiper :autoplay="true" duration="500">
			<block v-for="(item,index) in picture" :key="index">
			  <swiper-item>
				<view style="width: 100%;position: relative;height: 100%;">
					<image :src="item.image" v-if="item.image.substring(item.image.lastIndexOf('.'))!='.mp4'" style="width: 100%;object-fit: cover;position: absolute;top: 50%;transform: translateY(-50%);"></image>
					<video :src="item.image" v-if="item.image.substring(item.image.lastIndexOf('.'))=='.mp4'" style="width: 100%;height: 100%;"></video>
				</view>
			  </swiper-item>
			</block>
		  </swiper>
		<view style="border-bottom: 1px solid #EEEEEE;">
			<view style="float: left;">
				<p style="font-size: 15px;font-weight: bold;height: 40px;line-height: 40px;">{{foodName}}</p>
				<p style="color: #C8C9CC;margin-left: 15px;height: 30px;">{{address}}</p>
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
			<button style="background-color: #FCBD71;color: white;height: 35px;line-height: 35px;width: 80%;" @click="toOpenMap">前往此处</button>
		</view>


	</view>
</template>

<script>
	import http from '@/utils/http.js';
	export default {
		data() {
			return {
				foodName: "", //名称
				title: "", //简介
				price: "", //价格
				address: "", //地址
				picture: [], //图片
				introduction: "", //介绍
				lon: "",
				lat: "",
			};
		},
		computed: {},
		onLoad(option) {
			let that = this;
			that.lon = option.lon;
			that.lat = option.lat;
			that.foodName = option.foodName;
			that.introduction = option.introduction;
			that.price = option.price;
			that.address = option.address;
			let imglist = option.picture.split(',');
			for (let i = 0; i < imglist.length; i++) {
				that.picture.push({
					image: http.baseUrl + 'UploadFiles/Food/' + imglist[i]
				});
			}
			console.log("后台地址")
			console.log(http.baseUrl)
			console.log(that.picture)
		},
		methods: {
			toOpenMap() {
				let lon = parseFloat(this.lon);
				let lat = parseFloat(this.lat);
				console.log(lon);
				console.log(lat);
				uni.openLocation({
					latitude: lat,
					longitude: lon,
					name: this.address,
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
			}
			// goXieCheng(){
			// 		uni.navigateToMiniProgram({ //这里用uniapp的跳转方法，原生应该是wx.navigateToMiniProgram
			// 		  appId: 'wx0e6ed4f51db9d078',//这里的appid为目标小程序的appid，此处为携程小程序
			// 		  path:'',
			// 		  success(res) {
			// 		  		// 打开成功
			// 			   console.log(res)
			// 		  },
			// 		  fail(err){
			// 		  		// 打开失败	
			// 			  console.log(err)
			// 		  }
			// 		})
			// 	},
		}
	};
</script>

<style>
</style>
