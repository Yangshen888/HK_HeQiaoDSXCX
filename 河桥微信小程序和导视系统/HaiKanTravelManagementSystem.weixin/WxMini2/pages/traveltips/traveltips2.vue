<template>
	<view style="height: 100%;">
		<view>
			<u-tabs-swiper ref="uTabs" :list="list" :current="current" @change="tabsChange" :is-scroll="false" swiperWidth="750"></u-tabs-swiper>
		</view>
		<swiper :current="swiperCurrent" @transition="transition" @animationfinish="animationfinish" style="margin-top: 40rpx; padding:0 30rpx;height: 100%;">
			<swiper-item class="swiper-item" :key="index">
				<scroll-view scroll-y style="height: auto;width: 100%;" @scrolltolower="onreachBottom">
					<view style="padding: 0 10rpx;">
						<u-swiper :list="imglist1" :height="340"></u-swiper>
					</view>
					<view style="padding: 0 10rpx;margin-bottom: 120rpx;">
						<view style="margin: 40rpx 0;box-shadow: 0 0 10px rgba(0,0,0,0.2);border-radius: 10rpx;padding: 30rpx;display: flex;">
							<view style="flex: 1;">
								<view class="scenceItem" style="font-size: 30rpx;line-height: 2;">泥骆村</view>
								<view class="scenceItem" style="font-size: 26rpx;">Ni Luo Village</view>
							</view>
							<!-- <view style="padding: 4rpx 14rpx; text-align: center;letter-spacing: 2rpx;background-color: #079FE5;color: #fff;border-radius: 10rpx;">
								<view style="height: 50%;">点击</view>
								<view style="height: 50%;">购票</view>
							</view> -->
						</view>
						<view class="scenceDesc">
							<view style="text-align: center;color: #6e7175;font-size: 32rpx;font-weight: bold;">
								<view style="display: inline-block;margin-right: 10rpx;">—</view>
								<view style="display: inline-block;letter-spacing: 20rpx;">村落详情</view>
								<view style="display: inline-block;margin-left: -4rpx;">—</view>
							</view>
							<view style="border: 4rpx solid #c39c26;border-bottom: 0;padding: 40rpx;border-radius: 20rpx;margin-top: 30rpx;text-align: justify;line-height: 1.5;font-size: 30rpx;text-indent: 2em;">
							泥骆村位于浙江省杭州市临安区河桥镇，地处美丽的柳溪江畔，全村农户372户，总人口1032人，分10个村民小组，全村耕地面积620亩，山林面积18300余亩，森林面积覆盖率97%，全村农户主要是种桑养蚕和竹产业为主，是临安的产茧大村。4A级景区柳溪江风景就在我村境内。泥骆村环境优美，人杰地灵，村中水泥路油路四通八达，公路两旁绿树成荫，平时旅游车、游客川流不息，农家乐也搞得红红火火。
							</view>
						</view>
					</view>
				</scroll-view>
			</swiper-item>
			<swiper-item class="swiper-item" :key="index">
				<scroll-view scroll-y style="height: auto;width: 100%;" @scrolltolower="onreachBottom">
					<view style="padding: 0 10rpx;">
						<u-swiper :list="imglist2" :height="340"></u-swiper>
					</view>
					<view style="padding: 0 10rpx;margin-bottom: 120rpx;">
						<view style="margin: 40rpx 0;box-shadow: 0 0 10px rgba(0,0,0,0.2);border-radius: 10rpx;padding: 30rpx;display: flex;">
							<view style="flex: 1;">
								<view class="scenceItem" style="font-size: 30rpx;line-height: 2;">云浪村</view>
								<view class="scenceItem" style="font-size: 26rpx;">Yun Lang Village</view>
							</view>
							<!-- <view style="padding: 4rpx 14rpx; text-align: center;letter-spacing: 2rpx;background-color: #079FE5;color: #fff;border-radius: 10rpx;">
								<view style="height: 50%;">点击</view>
								<view style="height: 50%;">购票</view>
							</view> -->
						</view>
						<view class="scenceDesc">
							<view style="text-align: center;color: #6e7175;font-size: 32rpx;font-weight: bold;">
								<view style="display: inline-block;margin-right: 10rpx;">—</view>
								<view style="display: inline-block;letter-spacing: 20rpx;">村落详情</view>
								<view style="display: inline-block;margin-left: -4rpx;">—</view>
							</view>
							<view style="border: 4rpx solid #c39c26;border-bottom: 0;padding: 40rpx;border-radius: 20rpx;margin-top: 30rpx;text-align: justify;line-height: 1.5;font-size: 30rpx;text-indent: 2em;">
							云浪村位于河桥镇东面，美丽的柳溪江沿线而过，也紧邻杭徽高速及靠昌文公路，地域面积9.1平方公里，辖10个自然村，9个村民小组，共有农户365户，总人口1143人，有耕地面积1061亩，，山林面积12654亩，是个森林资源相对丰富，人均耕地较多的村，村民的主要经济收入是竹笋种植，养蚕，吊瓜种植，花幷苗木及水果产业和务工经商等。村民人均年收入1万余元，并呈逐年上升趋势。
							</view>
						</view>
					</view>
				</scroll-view>
			</swiper-item>
		</swiper>
		<view style="height: 100rpx;line-height: 100rpx;text-align: center;background-image: linear-gradient(45deg,#2585eb,#00aaff,#2585eb);position: fixed;bottom: 0;border-radius: 20rpx 20rpx 0 0;width: 100%;" @click="toSharkin">
			<view style="display: inline-block;font-size: 32rpx;letter-spacing: 6rpx;font-weight: 600;color: #fff;">前往此处</view>
			<image src="https://hqjsc.hzgx.info/wxapp/static/images/parking/jt.png" mode="widthFix" style="width: 40rpx;margin-left: 20rpx;"></image>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				list: [{
					name: '泥骆村'
				}, {
					name: '云浪村'
				}],
				// 因为内部的滑动机制限制，请将tabs组件和swiper组件的current用不同变量赋值
				current: 0, // tabs组件的current值，表示当前活动的tab选项
				swiperCurrent: 0, // swiper组件的current值，表示当前那个swiper-item是活动的
				tabs:[{
					name:'123'
				},{
					name:'456'
				}],
				imglist1: [{
					image: 'https://hqjsc.hzgx.info/wxapp/static/village/niluo1.jpg'
				}, {
					image: 'https://hqjsc.hzgx.info/wxapp/static/village/niluo2.jpg'
				},{
					image: 'https://hqjsc.hzgx.info/wxapp/static/village/niluo3.jpg'
				}],
				imglist2: [{
					image: 'https://hqjsc.hzgx.info/wxapp/static/village/yunlang1.jpg'
				}, {
					image: 'https://hqjsc.hzgx.info/wxapp/static/village/yunlang2.jpg'
				},{
					image: 'https://hqjsc.hzgx.info/wxapp/static/village/yunlang3.jpg'
				}]
			}
		},
		methods: {
			toSharkin() {
				let lon = 119.252177;
				let lat = 30.118594;
				uni.openLocation({
					latitude: lat,
					longitude: lon,
					name: '云浪村',
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
		}
	}
</script>

<style>
	page{
		height: 100%;
	}
</style>
