<template>
	<view style="padding: 0 3%;position: relative;">
		<view style="width: 106%;margin-left: -3%;font-size: 0;">
			<image src="https://hqjsc.hzgx.info/wxapp/static/top1.png" mode="widthFix" style="width: 100%;"></image>
		</view>
		<view style="position: absolute;top: 20rpx;left: 30rpx; display: inline-block;margin-right: 20rpx;font-size: 32rpx;background-color: rgba(204,204,204,0.2);height: 72rpx;width: 72rpx;line-height: 72rpx;text-align: center;border-radius: 50%;">
			<u-count-down :timestamp="timestamp" :show-days="false" :show-hours="false" :show-minutes="false" bg-color="transparent"
			 @end="skip"></u-count-down>s
			<!-- @end="skip" -->
		</view>
		<view style="position: absolute;top: 30rpx;right: 30rpx;color: #fff; display: inline-block;padding: 4rpx 10rpx;border-radius: 4rpx;background-color: rgba(129,129,129,0.5);"
		 @click="skipOut">跳过</view>
		<view style="clear: both;color: #000000;margin-bottom: 40rpx;padding: 0 20rpx;margin-top: -80rpx;">
			<view style="text-align: center;font-size: 36rpx;line-height: 2;">河桥古镇</view>
			<view style="text-align: justify;line-height: 1.5;text-indent: 2em;font-size: 32rpx;">临安区河桥古镇，地处杭州西南部，距杭州市区91公里、离临安区48公里。它是一个拥有1300多年历史的山区古镇，现为省级历史文化保护区，也是杭州市首批13个风情小镇建设重点示范镇。全镇地域面积190.8平方公里，人口1.8万，境内青山环翠，物产丰富，环境优美，森林覆盖率达85%以上，拥有柳溪江、瑞晶洞两个国家AAAA级旅游景区，是一方神奇而美丽古老而年轻的风水宝地。
			</view>
			<view style="text-align: justify;line-height: 1.5;text-indent: 2em;font-size: 32rpx;">在以生态闻名的中国优秀旅游城市临安，河桥是唯一仅存的古镇。浙西边陲的独特区位，浙皖交界的风土人情，都给这座千年古镇蒙上了神秘的面纱。</view>
		</view>
		<view style="position: fixed;bottom: 0;left: -3%; width: 103%;z-index: -1;opacity: 0.5;font-size: 0;">
			<image src="https://hqjsc.hzgx.info/wxapp/static/image1.png" mode="widthFix" style="width: 100%;"></image>
		</view>
		<!-- 首页预加载 -->
		<view style="display: none;">
			<image src="https://hqjsc.hzgx.info/wxapp/static/shi.png" mode=""></image>
			<image src="https://hqjsc.hzgx.info/wxapp/static/su.png" mode=""></image>
			<image src="https://hqjsc.hzgx.info/wxapp/static/xing.png" mode=""></image>
			<image src="https://hqjsc.hzgx.info/wxapp/static/you.png" mode=""></image>
			<image src="https://hqjsc.hzgx.info/wxapp/static/gou.png" mode=""></image>
			<image src="https://hqjsc.hzgx.info/wxapp/static/yu.png" mode=""></image>
			<image src="https://hqjsc.hzgx.info/wxapp/static/life.png" mode=""></image>
			<image src="https://hqjsc.hzgx.info/wxapp/static/heqiao.png" mode=""></image>
			<image src="https://hqjsc.hzgx.info/wxapp/static/yunlang.png" mode=""></image>
			<image src="https://hqjsc.hzgx.info/wxapp/static/niluo.png" mode=""></image>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				timestamp: 5,
				skipStatu: false
			}
		},
		methods: {
			skip() {
				if (this.skipStatu == false) {
					uni.redirectTo({
						url: '/pages/home/handsmap'
					});
				}
			},
			skipOut() {
				this.skipStatu = true
				uni.redirectTo({
					url: '/pages/home/handsmap'
				});
			}
		},
		onLoad() {

		}
	}
</script>

<style>

</style>
