<template>
	<view style="height: 100%;">
		<view>
			<u-tabs-swiper ref="uTabs" :list="list" :current="current" @change="tabsChange" :is-scroll="false" swiperWidth="750"></u-tabs-swiper>
		</view>
		<swiper :current="swiperCurrent" @transition="transition" @animationfinish="animationfinish" style="height: 90%;">
			<!-- 诊所 -->
			<swiper-item class="swiper-item" :key="index" style="overflow: auto;">
				<scroll-view scroll-y style="width: 100%;" @scrolltolower="onreachBottom">
					<view class="specialityBox" v-for="(item, index) in clinic" @click="tozheli(item)" style="background-color: #fff;">
						<view class="leftBox" style="width: 200rpx;height: 200rpx;overflow: hidden;">
							<u-image width="100%" height="200rpx" :src="item.picture"></u-image>
						</view>
						<view class="rightBox" style="line-height: 2;padding:0 30rpx;padding-top: 18rpx;">
							<view>{{item.name}}</view>
							<view class="decripte">地址：{{item.address}}</view>
							<view class="decripte">电话：{{item.phone}}</view>
						</view>
					</view>
				</scroll-view>
			</swiper-item>
			<!-- 厕所 -->
			<swiper-item class="swiper-item" :key="index" style="overflow: auto;">
				<scroll-view scroll-y style="width: 100%;" @scrolltolower="onreachBottom">
					<view class="specialityBox" v-for="(item, index) in toilet" @click="tozheli(item)" style="background-color: #fff;">
						<view class="leftBox" style="width: 200rpx;height: 200rpx;overflow: hidden;">
							<u-image width="100%" height="200rpx" :src="item.picture"></u-image>
						</view>
						<view class="rightBox" style="line-height: 2;padding:0 30rpx;padding-top: 40rpx;">
							<view>{{item.name}}</view>
							<view class="decripte">地址：{{item.address}}</view>
						</view>
					</view>
				</scroll-view>
			</swiper-item>
			<!-- 银行 -->
			<swiper-item class="swiper-item" :key="index" style="overflow: auto;">
				<scroll-view scroll-y style="width: 100%;" @scrolltolower="onreachBottom">
					<view class="specialityBox" v-for="(item, index) in bank" @click="tozheli(item)" style="background-color: #fff;">
						<view class="leftBox" style="width: 200rpx;height: 200rpx;overflow: hidden;">
							<u-image width="100%" height="200rpx" :src="item.picture"></u-image>
						</view>
						<view class="rightBox" style="padding:0 30rpx;padding-top: 18rpx;">
							<view>{{item.name}}</view>
							<view class="decripte">地址：{{item.address}}</view>
							<view class="decripte">电话：{{item.phone}}</view>
						</view>
					</view>
				</scroll-view>
			</swiper-item>
		</swiper>
	</view>
</template>

<script>
	import amap from "../../global/amap-wx.js"
	import http from '@/utils/http.js';
	import {
		gtoiletlist,
		hospitallist,
		banklist,
	} from '@/api/home/home.js'
	export default {
		data() {
			return {
				list: [{
					name: '卫生所'
				}, {
					name: '厕所'
				}, {
					name: '银行'
				}],
				// 因为内部的滑动机制限制，请将tabs组件和swiper组件的current用不同变量赋值
				current: 0, // tabs组件的current值，表示当前活动的tab选项
				swiperCurrent: 0, // swiper组件的current值，表示当前那个swiper-item是活动的
				// 诊所
				clinic: [{
					name: '临安区河桥镇中心卫生院',
					address: '临安区河桥镇中心卫生院',
					phone: '暂无', //联系电话
					picture: '', //图片
					longitude: '119.242341', //经度
					latitude: '30.104752', //纬度
				}],
				// 厕所
				toilet: [],
				//银行
				bank: [{
					name: '中国信合24小时自助银行（河桥分社）',
					address: '河桥村上街355',
					phone: '暂无', //联系电话
					picture: '', //图片
					longitude: '119.234376', //经度
					latitude: '30.102323', //纬度
				}],
			}
		},
		methods: {
			// 前往此处
			tozheli(e) {
				// console.log(e.longitude)
				// console.log(e.latitude)
				let lon = parseFloat(e.longitude);
				let lat = parseFloat(e.latitude);
				uni.openLocation({
					latitude: lat,
					longitude: lon,
					name: e.name,
					success: function() {
						console.log('success');
					},
					fail: function(err) {
						console.log(err);
					}
				});
			},
			// tabs通知swiper切换
			tabsChange(index) {
				this.swiperCurrent = index;
			},
			// swiper-item左右移动，通知tabs的滑块跟随移动
			transition(e) {
				let dx = e.detail.dx;
				this.$refs.uTabs.setDx(dx);
			},
			// 由于swiper的内部机制问题，快速切换swiper不会触发dx的连续变化，需要在结束时重置状态
			// swiper滑动结束，分别设置tabs和swiper的状态
			animationfinish(e) {
				let current = e.detail.current;
				this.$refs.uTabs.setFinishCurrent(current);
				this.swiperCurrent = current;
				this.current = current;
			},
			// scroll-view到底部加载更多
			onreachBottom() {

			}
		},
		onLoad() {
			let that=this;
			gtoiletlist().then(res => {
				if (res.data.code == 200) {
					console.log("公厕信息")
					console.log(res)
					const toiletlis = res.data.data;
					//成功回调
					toiletlis.forEach(function(item, index) {
						that.toilet.push({
							name: item.name,
							address: item.gtoiletAddress,
							picture: item.imageurl,
							latitude: item.lat, //marker  纬度
							longitude: item.lon, //marker 经度
						})
					})
				}
			}),
			hospitallist().then(res => {
				if (res.data.code == 200) {
					console.log("医院信息")
					console.log(res)
					const cliniclis = res.data.data;
					//成功回调
					cliniclis.forEach(function(item, index) {
						that.clinic.push({
							name: item.name,
							address: item.hospitalAddress,
							picture: item.imageurl,
							phone:item.phone,
							latitude: item.lat, //marker  纬度
							longitude: item.lon, //marker 经度
						})
					})
				}
			}),
			banklist().then(res => {
				if (res.data.code == 200) {
					console.log("银行")
					console.log(res)
					const banklis = res.data.data;
					//成功回调
					banklis.forEach(function(item, index) {
						that.bank.push({
							name: item.name,
							address: item.bankAddress,
							picture: item.imageurl,
							phone:item.phone,
							latitude: item.lat, //marker  纬度
							longitude: item.lon, //marker 经度
						})
					})
				}
			})
		}
	}
</script>

<style>
	page{
		height: 100%;
		background: url(https://hqjsc.hzgx.info/wxapp/static/bailu.gif);
		background-size: 100% 100%;
	}
	.specialityBox {
		display: flex;
		margin: 40rpx;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
		border-radius: 10rpx;
		overflow: hidden;
	}

	.leftBox {
		// float: left;
	}

	.imgBox {
		width: 100%;
		height: 100%;
		background-position: center center;
		background-size: cover;
		background-repeat: no-repeat;
	}

	.rightBox {
		flex: 1;
		line-height: 1.5;
		padding: 0 20rpx;
		padding-top: 18rpx;
	}

	.decripte {
		font-size: 24rpx;
		text-overflow: -o-ellipsis-lastline;
		text-overflow: ellipsis;
		overflow: hidden;
		display: -webkit-box;
		-webkit-line-clamp: 3;
		-webkit-box-orient: vertical;
		text-align: justify;
	}
</style>
