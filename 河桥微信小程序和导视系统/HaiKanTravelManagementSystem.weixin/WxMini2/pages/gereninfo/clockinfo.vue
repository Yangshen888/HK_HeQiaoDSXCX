<template>
	<view style="height: 100%;">
		<view style="padding: 0 30rpx;">
			<u-tabs-swiper ref="uTabs" :list="list" :current="current" @change="tabsChange" :is-scroll="false" swiperWidth="750"></u-tabs-swiper>
		</view>
		<view style="text-align: center;line-height: 2;color: #19BE6B;" v-if="typ">
			恭喜您,已完成全部景点打卡!
			您是第{{rankingId}}位完成的用户
		</view>
		<view style="position: fixed;top: -10px;left: 4px;width: 70px;" v-if="typ">
			<image src="https://hqjsc.hzgx.info/wxapp/static/finishNum.png" mode="widthFix" style="width: 100%;"></image>
			<view style="position: absolute;top: 48rpx;left: 4rpx;font-size: 28rpx;width: 100%;text-align: center;color: #55aa00;">{{rankingId}}</view>
		</view>
		<view style="height: 100%;padding-bottom: 60rpx;">
			<swiper :current="swiperCurrent" @transition="transition" @animationfinish="animationfinish" style="height: 100%;">
				<swiper-item class="swiper-item" :key="index">
					<scroll-view scroll-y style="height: 100%;width: 100%;" @scrolltolower="onreachBottom">
						<view class="itemBox" v-for="(res,index) in orderList">
							<view class="imageBox">
								<image :src="prefix + 'UploadFiles/Scene/Picture/' + res.picture" mode="" style="width:100%;position: absolute;top: 50%;transform: translateY(-50%);"></image>
							</view>
							<view style="padding: 20rpx;line-height: 1.5;">
								<view class="scenceName">{{res.name}}</view>
								<view style="font-size: 24rpx;">{{res.address}}</view>
							</view>
							<image src="https://hqjsc.hzgx.info/wxapp/static/checked.png" mode="widthFix" style="position: absolute;right: 0;bottom: 0;width: 200rpx;"></image>
						</view>
					</scroll-view>
				</swiper-item>
				<swiper-item class="swiper-item" :key="index">
					<scroll-view scroll-y style="height: 100%;width: 100%;" @scrolltolower="onreachBottom">
						<view class="itemBox" v-for="(res, index) in orderListdk">
							<view class="imageBox">
								<image :src="prefix + 'UploadFiles/Scene/Picture/' + res.picture" mode="" style="width:100%;position: absolute;top: 50%;transform: translateY(-50%);"></image>
							</view>
							<view style="padding: 20rpx;line-height: 1.5;">
								<view class="scenceName">{{res.name}}</view>
								<view style="font-size: 24rpx;">{{res.address}}</view>
							</view>
							<image src="https://hqjsc.hzgx.info/wxapp/static/nocheck.png" mode="widthFix" style="position: absolute;right: 0;bottom: 0;width: 200rpx;"></image>
						</view>
					</scroll-view>
				</swiper-item>
			</swiper>
		</view>
	</view>
</template>

<script>
	import http from '@/utils/http.js';
	import {
		GetClockList,
	} from '@/api/gereninfo/gereninfo.js';
	export default {
		data() {
			return {
				typ: false,
				rankingId: "0",
				prefix: http.baseUrl,
				orderList: [],
				orderListdk: [],
				type: 0,
				list: [{
					name: '已打卡'
				}, {
					name: '未打卡'
				}],
				current: 0, // tabs组件的current值，表示当前活动的tab选项
				swiperCurrent: 0, // swiper组件的current值，表示当前那个swiper-item是活动的
				tabs: [{
					content: '123'
				}, {
					content: '123'
				}]
			}
		},
		onLoad() {
			this.getlistInfo();
		},
		methods: {
			getlistInfo() {
				let data = {
					type: this.current,
					// systemUserUuid: '423968DF-A15D-4B5F-9E25-005486496332'
					UserUuid: this.$store.state.userId
				};
				GetClockList(data).then(res => {
					console.log(res);
					if (this.current == 0) {
						this.orderList = res.data.data;
						if (this.orderList.length > 0) {
							if (res.data.data[0].ranking == 0) {
								this.typ = true;
								this.rankingId = res.data.data[0].paiming;
							}
						}
						console.log("已打卡")
						console.log(this.orderList)
					} else if (this.current == 1) {
						this.orderListdk = res.data.data;
						console.log("未打卡")
						console.log(this.orderListdk)
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
				this.getlistInfo();
			},
			// scroll-view到底部加载更多
			onreachBottom() {

			}
		}
	}
</script>

<style>
	page {
		height: 100%;
	}

	.itemBox {
		position: relative;
		border-radius: 10rpx;
		overflow: hidden;
		margin: 15px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	}

	.boxTop {
		line-height: 2;
		text-align: center;
	}

	.imageBox {
		position: relative;
		width: 100%;
		height: 120px;
		overflow: hidden;
	}
</style>
