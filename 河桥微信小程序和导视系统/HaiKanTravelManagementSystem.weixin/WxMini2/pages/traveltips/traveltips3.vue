<template>
	<view>
		<view>
			<view style="padding: 0 40rpx;">
				<u-swiper :list="imglist" :height="340"></u-swiper>
			</view>
			<view style="padding: 0 40rpx;margin-bottom: 120rpx;">
				<view style="margin: 40rpx 0;box-shadow: 0 0 10px rgba(0,0,0,0.2);border-radius: 10rpx;padding: 30rpx;display: flex;">
					<view style="flex: 1;">
						<view class="scenceItem" style="font-size: 30rpx;line-height: 2;">瑞晶石花洞</view>
						<view class="scenceItem" style="font-size: 26rpx;">Ruijing Stone Flower Cave</view>
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
						瑞晶石花洞位于浙江临安区昌化地区的石瑞乡蒲村，距杭州120公里，该洞洞体呈垂直状，异常高大。堪称国内第一，洞内岩溶景观密度大、品种齐全，尤其是洞内有着大量的“石花”。它色泽洁白，晶莹剔透，呈花瓣放射状生长，美丽异常，瑞晶洞由于洞壁裂隙特别发育，方解石的含量高，洞内温度气压相对比较稳定，这就为石花产生创造了特别条件。瑞晶洞石花多达36000多朵，这些石花形态各异，争奇斗艳，竞相怒放，更有成片的石花如北国冬日漫天飞舞的大雪，纷纷扬扬，大大小小的石花布满洞顶，使瑞晶洞成了世上罕见的地下花园。
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
					image: 'https://hqjsc.hzgx.info/wxapp/static/rjshd1.jpg'
				}, {
					image: 'https://hqjsc.hzgx.info/wxapp/static/rjshd2.png'
				}, {
					image: 'https://hqjsc.hzgx.info/wxapp/static/rjshd3.png'
				}]
			}
		},
		methods: {
			toSharkin() {
				let lon = 119.102571;
				let lat = 30.082183;
				uni.openLocation({
					latitude: lat,
					longitude: lon,
					name: '瑞晶石花洞',
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
