<template>
	<view>
		<view>
			<view style="padding: 0 40rpx;">
				<u-swiper :list="imglist" :height="340"></u-swiper>
			</view>
			<view style="padding: 0 40rpx;margin-bottom: 120rpx;">
				<view style="margin: 40rpx 0;box-shadow: 0 0 10px rgba(0,0,0,0.2);border-radius: 10rpx;padding: 30rpx;display: flex;">
					<view style="flex: 1;">
						<view class="scenceItem" style="font-size: 30rpx;line-height: 2;">柳溪江码头</view>
						<view class="scenceItem" style="font-size: 26rpx;">LiuXiJiang Wharf</view>
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
						临安柳溪江景区是浙西唯一的水景旅游区，被誉为浙西最美女人河，有着“浙西秦淮”的别称。景区资源丰富，集山、峡、溪、湖、潭、瀑、石、滩、古桥、古道、庵庙、石刻、野生动植物于一体。上游沙明水净，河滩开阔，游鱼可数；下游江湾相连，青山对峙，呈浙西三峡的独特风貌；而江边的古镇乃浙西边城，鼎盛时期三百舟船泊古埠，舷歌对唱闹浙西，商贾去集，青楼林立，碧波秀水之上，给柳溪江增添了不少历史文化的厚重感。
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
					image: 'https://hqjsc.hzgx.info/wxapp/static/lxjmt1.jpg'
				}, {
					image: 'https://hqjsc.hzgx.info/wxapp/static/lxjmt2.jpg'
				}, {
					image: 'https://hqjsc.hzgx.info/wxapp/static/lxjmt3.jpg'
				}, {
					image: 'https://hqjsc.hzgx.info/wxapp/static/lxjmt4.jpg'
				}]
			}
		},
		methods: {
			toSharkin() {
				let lon = 119.248139;
				let lat = 30.121476;
				uni.openLocation({
					latitude: lat,
					longitude: lon,
					name: '柳溪江风景区-漂流码头门楼',
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
