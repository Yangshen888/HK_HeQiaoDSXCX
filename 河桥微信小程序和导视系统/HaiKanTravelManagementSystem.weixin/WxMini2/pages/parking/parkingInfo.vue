<template>
	<view>
		<u-navbar :background="background" title-color="#ffffff" :title="'停车场详情'" :is-back="true" :immersive="true" back-icon-color="#ffffff"></u-navbar>
		<view class="u-wrap" style="background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/parking/pkbg.png);background-size: 100%; background-attachment: fixed;background-repeat: no-repeat;">
			<view v-if="isShow" style="border-bottom: 1px #C8C9CC solid;padding-bottom: 10px;margin-top: 100px;overflow: auto;">
				<image :src="prefix + 'UploadFiles/CarPark/' + info.picture" mode="widthFix" style="width: 100%;height: 270rpx;border-radius: 20rpx;"></image>
				<view style="width: 60%;float: left;">
					<view style="font-size:36rpx ;font-weight: 600;">{{ info.name }}</view>
					<view style="font-size: 24rpx;color: #C8C9CC;line-height: 1.5;">{{ info.address }}</view>
				</view>
				<view style="margin-top: 10px;">
					<view style="float: left;margin-top: 2px;margin-right: 5px;">剩余车位数:</view>
					<view style="font-size:36rpx ;font-weight: 600;color: red;">{{ info.surplusTs }}</view>
				</view>
			</view>
			<view>
				<view class="head">
					<view style="overflow: hidden;float: left;">
						<view style="background-color: #C8C9CC;width: 6rpx;height: 24rpx;float: left;margin-top: 6rpx;border-radius: 50rpx;"></view>
						<view style="margin-left: 20rpx;font-weight: 600;font-size: 26rpx;">收费标准</view>
					</view>
					<view style="float: right;">￥{{ info.price }}/小时</view>
				</view>

				<!-- <view class="d1">
					<view class="dtr">
						<view class="dtd1">1小时</view>
						<view class="dtd1">1小时</view>
						<view class="dtd1">1小时</view>
						<view class="dtd1">1小时</view>
						<view class="dtd1">超4小时</view>
					</view>

					<view class="dtr2">
						<view class="dtd" style="border-left: 2px #c2b5a5 solid;border-bottom-left-radius: 20rpx;">￥{{ info.price }}</view>
						<view class="dtd" style="border-left: 1px #c2b5a5 solid;">￥0</view>
						<view class="dtd" style="border-left: 1px #c2b5a5 solid;">￥0</view>
						<view class="dtd" style="border-left: 1px #c2b5a5 solid;">￥0</view>
						<view class="dtd" style="border-left: 1px #c2b5a5 solid;border-right: 2px #c2b5a5 solid;border-bottom-right-radius: 20rpx;">￥5</view>
					</view>
				</view> -->
				<view style="padding-top: 30rpx;">
					<image class="pimg" src="https://hqjsc.hzgx.info/wxapp/static/images/parking/pt.png"></image>
					<view style="word-wrap:break-word">{{ info.chargesNotes }}</view>
					<!-- <image class="pimg" src="https://hqjsc.hzgx.info/wxapp/static/images/parking/pt.png"></image>
					<view style="word-wrap:break-word">xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</view> -->
				</view>
			</view>
		</view>
		<view class="bottom"><button style="width: 70%;background-color: #c2b5a5;color: #FFFFFF;" @click="toOpenMap">前往停车场</button></view>
	</view>
</template>

<script>
import http from '@/utils/http.js';
import { getParkingInfo } from '@/api/parking/parking.js';
export default {
	data() {
		return {
			prefix: http.baseUrl,
			info: {},
			isShow: false,
			background: {
				//backgroundColor: '#c2b5a5'
				// 导航栏背景图
				// background: 'url(https://cdn.uviewui.com/uview/swiper/1.jpg) no-repeat',
				// 还可以设置背景图size属性
				// backgroundSize: 'cover',
				// 渐变色
				// backgroundImage: 'linear-gradient(45deg, rgb(28, 187, 180), rgb(141, 198, 63))'
			}
		};
	},
	onLoad(opt) {
		console.log(opt.uuid);
		let that = this;
		getParkingInfo(opt.uuid).then(res => {
			console.log(res);
			if (res.statusCode == 200) {
				that.info = res.data.data;
				that.isShow = true;
				console.log();
			}
		});
	},
	methods: {
		toOpenMap() {
			console.log(this.info.lon);
			console.log(this.info.lat);
			let lon = parseFloat(this.info.lon);
			let lat = parseFloat(this.info.lat);
			uni.openLocation({
				latitude: lat,
				longitude: lon,
				name:this.info.address,
				success: function() {
					console.log('success');
				},fail:function(err){
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
	}
};
</script>

<style>
.u-wrap {
	padding: 20rpx;
}
.head {
	width: 100%;
	height: 40rpx;
	margin-top: 40rpx;
	margin-bottom: 15px;
}
.d1 {
	width: 100%;
	/* position: absolute; */
	z-index: 1;
	padding: 0 20rpx 0 20rpx;
}
.dtr {
	background-color: #c2b5a5;
	border-top-left-radius: 20rpx;
	border-top-right-radius: 20rpx;
	overflow: hidden;
}

.dtr2 {
	border-bottom-left-radius: 20rpx;
	border-bottom-right-radius: 20rpx;
	overflow: hidden;
}
.dtd {
	float: left;
	width: 20%;
	text-align: center;
	height: 100rpx;
	line-height: 100rpx;
	border-bottom: 2px #c2b5a5 solid;
}

.dtd1 {
	float: left;
	width: 20%;
	text-align: center;
	height: 80rpx;
	line-height: 80rpx;
	color: #ffffff;
}
.pimg {
	float: left;
	width: 20rpx;
	height: 20rpx;
	padding: 6px 6px 0 10px;
}
.bottom {
	position: fixed;
	bottom: 0;
	width: 100%;
	margin-bottom: 30px;
}
</style>
