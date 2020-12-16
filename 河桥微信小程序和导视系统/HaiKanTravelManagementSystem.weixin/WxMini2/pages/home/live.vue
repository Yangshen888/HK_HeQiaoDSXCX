<template>
	<view style="padding: 0 30rpx;">
		<view style="width: 100%;box-shadow: 0 0 2px rgba(0,0,0,0.2);padding: 5px;margin: 20px 0;border-radius: 10rpx;" v-for="(item, index) in tabbar">
			<view class="top">
				<view class="putBox">热门推荐</view>
				<view class="topItem">{{ item.name }}</view>
			</view>
			<view class="content" style="width: 100%;height: 160px;">
				<view style="width: 65%;padding: 1px;">
					<image :src="baseurl+'UploadFiles/Hotel/'+image[index][0]" style="width: 100%;height: 100%;" @click="Imgclick(item)"></image>
				</view>
				<view style="width: 35%;padding: 1px;">
					<image :src="baseurl+'UploadFiles/Hotel/'+image[index][1]" style="width: 100%;height: 49%;" @click="Imgclick(item)"></image>
					<image :src="baseurl+'UploadFiles/Hotel/'+image[index][2]" style="width: 100%;height: 49%;" @click="Imgclick(item)"></image>
				</view>
			</view>
			<view class="bottom">
				<view style="float: left;width: 100%;">
					<view style="float: left;">地址：{{item.address}}</view>
					<!-- <view style="float: right;">
						详情<u-icon name="arrow-right" style="float: right;margin-top: 18rpx;"></u-icon>
					</view> -->
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import http from '@/utils/http.js';
	import {
		getFoodShow,
		gettechanShow,
		getHotelShow2,
		getPickShow,
	} from '@/api/esea/esea.js';
	export default {
		data() {
			return {
				baseurl: http.baseUrl,
				tabbar:[],
				image:[]
			}
		},
		methods:{
			Imgclick(data) {
				console.log("点击了图片")
				uni.navigateTo({
					url: '../../packageA/ESEA/hotelshows?Name=' + data.name + '&phone=' + data.phone + '&price=' + data.price + '&address=' +
						data.address + '&picture=' + data.picture + '&introduction=' + data.introduction + '&lon=' + data.lon +
						'&lat=' + data.lat + '&shopId=' + data.shopId
				});
			},
		},
		onLoad() {
			let that = this;
			getHotelShow2().then(res => {
				console.log("数据123")
				console.log(res)
				that.tabbar = res.data.data
				res.data.data.forEach(item=>{
					that.image.push(item.picture.split(','));
				})
				console.log(that.image)
			});
		}
	}
</script>

<style>
	.topItem{
		float: right;
	}
	.bottom{
		overflow: auto;
		height: 30px;
		line-height: 30px;
	}
	.putBox{
		position: absolute;
		left: -30rpx;
		width:180rpx;
		height: 108rpx;
		line-height: 120rpx;
		text-align: center;
		border-radius: 0 10px 0 8px;
		background: url(https://hqjsc.hzgx.info/wxapp/static/tagsbg.png) no-repeat;
		background-size: 100% 100%;
		/* background-image: linear-gradient(to top right, #fd62af, #fc4355); */
		color: #fff;
		top: -20rpx;
	}
	.top{
		height: 40px;
		line-height: 40px;
		position: relative;
	}
	.content image{
		border-radius: 10rpx;
	}
	
	.cu-card {
		display: block;
		overflow: hidden;
		padding-top: 20rpx;
		margin: 20rpx 0;
		box-shadow: 0 0 2px rgba(0, 0, 0, 0.2);
		border-radius: 10rpx;
	}

	.cu-card .article {
		display: block;
	}

	.cu-item {
		display: block;
		background-color: #ffffff;
		overflow: hidden;
		border-radius: 5px;
		margin: 0 10px;
	}

	.title {
		font-size: 14px;
		font-weight: 900;
		color: #333333;
		line-height: 60rpx;
	}

	.text-cut {
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
	}

	.content {
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
	}

	.text-content {
		font-size: 12px;
		text-indent: 2em;
		/* text-align: justify; */
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 3;
		-webkit-box-orient: vertical;
	}

	.desc {
		margin-left: 20rpx;
		width: 50%;
	}

	.text-bottom {
		font-size: 12px;
		line-height: 30px;
	}
</style>
