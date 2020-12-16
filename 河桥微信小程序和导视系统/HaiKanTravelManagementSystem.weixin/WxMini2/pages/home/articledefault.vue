<template>
	<view style="padding: 0 40rpx;">
		<view>
			<view class="title">{{info.title}}</view>
			<view style="text-align: center;">
				<u-swiper :list="lis" height="500"></u-swiper>
				<!-- <image src="../../static/images/suggest/suggest2.jpg" style="width: 100%;border-radius: 10rpx;"></image> -->
			</view>
			<view class="descripe"><u-parse :html="info.content"></u-parse></view>
		</view>
	</view>
</template>

<script>
	import http from '@/utils/http.js';
	import {
		getInfo
	} from '@/api/home/home.js'
	export default {
		data() {
			return {
				lis: [{
					image: '../../../static/images/suggest/suggest2.jpg'
				}],
				type:'',
				info:{}
			}
		},
		onLoad(opt) {
			console.log(opt);
			if (typeof(opt.type) != "undefined" && typeof(opt.uuid) != "undefined" && opt.type != null && opt.uuid != null &&
				opt.type != "" && opt.uuid != "") {
				this.type=opt.type;
				this.ShowInfo(opt.type,opt.uuid);
			}
		},
		methods: {
			ShowInfo(type, uuid) {
				getInfo({
					type: type,
					uuid: uuid
				}).then(res => {
					console.log(res);
					this.lis=[];
					let that=this;
					this.info = res.data.data;
					let imgs = res.data.data.url.split(',');
					if (type == "simg") {
						imgs.forEach(function(element) {

							element = http.baseUrl + 'UploadFiles/Scene/Picture/' + element;
							console.log(element);
							that.lis.push({
								image: element
							});
						});
					}
					if (type == "aimg") {
						imgs.forEach(function(element) {

							element = http.baseUrl + 'UploadFiles/Article/' + element;
							console.log(element);
							that.lis.push({
								image: element
							})
						});
					}


				});
			}

		}
	}
</script>

<style>
	.title {
		font-size: 42rpx;
		font-weight: 600;
		line-height: 2;
		padding: 20rpx 0;
	}

	.descripe {
		text-indent: 2em;
		text-align: justify;
		line-height: 1.5;
		padding: 20rpx 0;
		font-size: 32rpx;
	}
</style>
