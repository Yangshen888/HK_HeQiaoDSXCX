<template>
	<view>
		<view style="padding: 0 40rpx;">
			<u-swiper :list="imglist" :height="340"></u-swiper>
		</view>
		<view style="padding: 40rpx;text-align: center;">
			<view style="display: inline-block;padding-bottom: 10rpx;border-bottom: 2rpx solid #333;">
				<view style=" font-size: 1.1em;border-bottom: 4rpx solid #333;display: inline-block;padding: 0 20rpx;line-height: 56rpx;text-align: center;">
					{{"-"}}{{strategydetail.title}}{{"-"}}
				</view>
			</view>
			
			<view style="position: relative;min-height: 600rpx; text-align: justify; margin-top: 40rpx; font-size: 1em;text-indent: 1.6em;padding: 20px;border: 1px solid #333;">
				<!-- <view style="position: absolute;top: -2rpx;left: 50%;transform: translateX(-50%); height: 4rpx;width: 80%;background-color: #fff;"></view> -->
				<view>{{strategydetail.strategyContent}}</view>
				<view style="position: absolute;bottom: -2rpx;left: 50%;transform: translateX(-50%); height: 4rpx;width: 80%;background-color: #fff;"></view>
			</view>
		</view>
	</view>
</template>

<script>
	import http from '@/utils/http.js';
	import {
		getStrategyDetail,
		misuliulan1,
	} from '@/api/traveltips/strategy.js';
	export default {
		data() {
			return {
				strategydetail: {

				},
				imglist: [],
				purl: http.baseUrl + 'UploadFiles/Traveltips/Strategy/',
			}
		},
		onLoad(opt) {
			if (opt.guid != "") {
				this.dogetStrategyDetail(opt.guid);
				this.genxinliulan(opt.guid);
			}
		},
		methods: {
			dogetStrategyDetail(guid) {
				getStrategyDetail(guid).then(res => {
					if (res.data.code == 200) {
						this.strategydetail = res.data.data;
						let imgs = [];
						if (res.data.data.photoUrl != '') {
							for (let j = 0; j < res.data.data.photoUrl.split(',').length; j++) {
								let images = {
									image: (this.purl + res.data.data.photoUrl.split(',')[j]).toString()
								};
								imgs[j] = images;
							}
						}
						this.imglist = imgs;
					} else {
						this.$u.toast(res.data.message);
					}
				})
			},
			genxinliulan(uuid) {
				misuliulan1(uuid).then(res => {
					console.log("浏览量更新")
				})
			}
		}
	}
</script>

<style>
</style>
