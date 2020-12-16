<template>
	<view class="wrap">
		<image src="https://hqjsc.hzgx.info/wxapp/static/images/precious/bzxz.png" class="wrap-image"></image>
		<view class="a-wrap" @click="open">
			<view class="a-wrap-qianzhi">
				<view class="a-wrap-wenhao"><u-icon name="question" size="20" color="#ad9c86"></u-icon></view>
			</view>
			<view style="color: #e7e2dc;">查看记录规则</view>
		</view>
		<u-modal v-model="show" :content="content" title="规则"></u-modal>
		<view class="u-wrap">
			<view class="u-wrap-p">————获奖内容————</view>
			<view style="height: 82%;padding-top: 10px;">
				<scroll-view scroll-y style="height: 100%;width: 100%;">
					<view style="margin-top: 30rpx;overflow: hidden;" v-for="(item,index) in preciouslist" key="index">
						<view class="u-wrap-dian"></view>
						<view style="float: left;">{{item.content}}</view>
						<view class="u-wrap-time">{{item.createtime}}</view>
					</view>
				</scroll-view>
			</view>
			<view style="text-align: center;margin-top: 15px;">
				查看更多
				<u-icon name="arrow-right" size="26"></u-icon>
			</view>
		</view>
		<view class="b-wrap">
			<p style="font-family: 华文行楷;font-size:50rpx;">
				河桥镇
				<br />
				<span style="font-size:24rpx;font-family: 华文黑体;">HeQiaoZhen</span>
			</p>
		</view>
	</view>
</template>

<script>
	import {
		GetPrecious,
	} from '@/api/gereninfo/gereninfo.js';
export default {
	data() {
		return {
			show: false,
			content: '无规则不成方圆！',
			preciouslist:[]
		};
	},
	onLoad() {
		this.doGetPrecious();
	},
	methods: {
		open(){
			this.show = true;
		},
		doGetPrecious(){
			let data='965C8F49-B909-41BB-BF5D-C26EAD9608AF';
			GetPrecious(data).then(res=>{
				console.log(res.data.data);
				this.preciouslist=res.data.data;
			});
		}
	}
};
</script>

<style>
page {
	height: 100%;
	background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/precious/bzjlbj.png);
	background-attachment: fixed;
}
.wrap {
	height: 100%;
}
.wrap-image {
	height: 17%;
	width: 55%;
	margin-left: 23%;
	margin-top: 90rpx;
}
.a-wrap {
	position: fixed;
	top: 0;
	right: 0;
	width: 115px;
	margin-top: 20px;
}
.a-wrap-qianzhi {
	background-color: #e7e2dc;
	float: left;
	border-radius: 50%;
	width: 24rpx;
	height: 24rpx;
	margin-top: 8rpx;
	margin-right: 8rpx;
}
.a-wrap-wenhao {
	margin-top: -5px;
	text-align: center;
}
.u-wrap {
	width: 90%;
	background-color: #ffffff;
	padding: 30rpx;
	margin-left: 5%;
	border-radius: 40rpx;
	/* height: 930rpx; */
	height: 63%;
	margin-top: -40rpx;
}
.u-wrap-p {
	color: #d9d0c7;
	text-align: center;
	font-weight: 600;
	margin-top: 30rpx;
}
.u-wrap-dian {
	width: 10rpx;
	height: 10rpx;
	border-radius: 50%;
	background-color: #b2a18d;
	float: left;
	margin-top: 16rpx;
	margin-right: 20rpx;
}
.u-wrap-time {
	float: right;
	color: #c6c6c6;
	font-size: 12px;
	margin-top: 2px;
}
.b-wrap {
	/* position: fixed; */
	bottom: 0;
	width: 100%;
	text-align: center;
	margin-top: 40rpx;
	margin-bottom: 40rpx;
}
</style>
