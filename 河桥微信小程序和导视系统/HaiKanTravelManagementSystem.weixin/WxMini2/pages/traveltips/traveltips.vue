<template>
	<view>
		<view>
			<view style="padding: 0 40rpx;">
				<u-swiper :list="imglist" :height="340"></u-swiper>
			</view>
			<view style="padding: 0 40rpx;margin-bottom: 120rpx;">
				<view style="margin: 40rpx 0;box-shadow: 0 0 10px rgba(0,0,0,0.2);border-radius: 10rpx;padding: 30rpx;display: flex;">
					<view style="flex: 1;">
						<view class="scenceItem" style="font-size: 30rpx;line-height: 2;">河桥古镇</view>
						<view class="scenceItem" style="font-size: 26rpx;">HeQiao Ancient Town</view>
					</view>
					<!-- <view style="padding: 4rpx 14rpx; text-align: center;letter-spacing: 2rpx;background-color: #079FE5;color: #fff;border-radius: 10rpx;">
						<view style="height: 50%;">点击</view>
						<view style="height: 50%;">购票</view>
					</view> -->
				</view>
				<view class="scenceDesc">
					<view style="text-align: center;color: #6e7175;font-size: 32rpx;font-weight: bold;">
						<view style="display: inline-block;margin-right: 10rpx;">—</view>
						<view style="display: inline-block;letter-spacing: 20rpx;">景点详情</view>
						<view style="display: inline-block;margin-left: -4rpx;">—</view>
					</view>
					<view style="border: 4rpx solid #c39c26;border-bottom: 0;padding: 40rpx;border-radius: 20rpx;margin-top: 30rpx;text-align: justify;line-height: 1.5;font-size: 30rpx;text-indent: 2em;">
						临安区河桥古镇，地处杭州西南部，距杭州市区91公里、离临安区48公里。它是一个拥有1300多年历史的山区古镇，现为省级历史文化保护区，也是杭州市首批13个风情小镇建设重点示范镇。全镇地域面积190.8平方公里，人口1.8万，境内青山环翠，物产丰富，环境优美，森林覆盖率达85%以上，拥有柳溪江、瑞晶洞两个国家AAAA级旅游景区，是一方神奇而美丽古老而年轻的风水宝地。
					</view>
				</view>
			</view>
		</view>
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
				imglist: [{
					image: 'https://hqjsc.hzgx.info/wxapp/static/guzhenheqiao1.png'
				}, {
					image: 'https://hqjsc.hzgx.info/wxapp/static/guzhenheqiao2.png'
				}, {
					image: 'https://hqjsc.hzgx.info/wxapp/static/guzhenheqiao3.png'
				}]
			}
		},
		methods: {
			toSharkin() {
				let lon = 119.240816;
				let lat = 30.101797;
				uni.openLocation({
					latitude: lat,
					longitude: lon,
					name: '河桥古镇',
					success: function() {
						console.log('success');
					},
					fail: function(err) {
						console.log(err);
					}
				});
			},
		}
	}
</script>

<style>
	.scenceItem {
		color: #303133;
		font-weight: bold;
	}
</style>
