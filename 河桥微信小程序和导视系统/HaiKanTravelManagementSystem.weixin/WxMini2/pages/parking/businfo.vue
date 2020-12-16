<template>
	<view>
		<!-- <view>{{info.begainSite}}{{info.endSite}}</view> -->
		<!-- <view class="descripe">
			<u-parse :html="info.introduction" :tag-style="tagstyle"></u-parse>
		</view> -->
		<view v-for="(res, index) in pictureUrl">
			<image :src="prefix + res" mode="widthFix" style="width: 100%;" @bindtap="preview" :data-src="prefix + res"></image>
		</view>
	</view>
</template>

<script>
	import http from '@/utils/http.js';
	import {
		getBusinfoList
	} from '@/api/parking/parking.js';
	export default {
		data() {
			return {
				prefix: http.baseUrl + 'UploadFiles/Xing/',
				info: {},
				pictureUrl: [],
				isShow: false,
				background: {
					//backgroundColor: '#c2b5a5'
					// 导航栏背景图
					// background: 'url(https://cdn.uviewui.com/uview/swiper/1.jpg) no-repeat',
					// 还可以设置背景图size属性
					// backgroundSize: 'cover',
					// 渐变色
					// backgroundImage: 'linear-gradient(45deg, rgb(28, 187, 180), rgb(141, 198, 63))'
				},
				tagstyle: {
					// 字符串的形式
					span: 'color: red;font-size:32rpx',
					span: 'font-size: 28rpx'
				}
			}
		},
		onLoad(opt) {
			console.log('babazaici')
			console.log(opt.uuid);
			let that = this;
			getBusinfoList(opt.uuid).then(res => {
				console.log(res);
				if (res.statusCode == 200) {
					that.info = res.data.data;
					if (that.info.picture != '' && that.info.picture != null) {
						that.pictureUrl = that.info.picture.split(',')
					}
					console.log(this.pictureUrl)
					that.isShow = true;
					console.log();
				}
			});
		},
		methods: {
			preview(event) {
				console.log(event.currentTarget.dataset.src)
				let currentUrl = event.currentTarget.dataset.src
				wx.previewImage({
					current: currentUrl, // 当前显示图片的http链接
					urls: this.data.imgList // 需要预览的图片http链接列表
				})
			}
		}
	}
</script>

<style>
	.descripe {
		text-indent: 2em;
		text-align: justify;
		line-height: 1.5;
		padding: 20rpx 0;
		font-size: 32rpx;
	}
</style>
