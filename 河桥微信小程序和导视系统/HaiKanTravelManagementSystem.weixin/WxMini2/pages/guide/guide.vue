<template>
	<view class="wrap">
		<u-navbar  :back-text="'返回'" :custom-back="customback"  :title="'智能导游'" ></u-navbar>
		<!-- <image src="https://hqjsc.hzgx.info/wxapp/static/images/precious/zhinengdaoyou.png"  mode="widthFix" style="width: 100%;"></image>
		<view style="width: 80rpx;height: 50rpx;background-color: #ccc;"></view>
		<view>
			<audio style="float: left;padding: 10rpx 0 0 30rpx;">
				<u-icon name="volume-up" @click="reader(item.aduio)" v-if="isplay&&item.aduio!=''" size="32"></u-icon>
				<u-icon name="volume-up-fill" @click="reader(item.aduio)" v-if="!isplay&&item.aduio!=''" size="32"></u-icon>
			</audio>
		</view> -->
		<view
			style="background-image: url('https://hqjsc.hzgx.info/wxapp/static/images/precious/zhinengdaoyou.png');min-height: 766px;min-width: 384px; background-size: 100% 100%; position: relative;"
		>
			<view style="width: 180rpx;height: 80rpx;position: absolute;top: 76%;right: 13%;">
				<view style="width: 100%;height:100%;" v-if="isplay1" @click="reader1(aduio1)"></view>
				<view style="width: 100%;height:100%;" v-if="!isplay1" @click="reader1(aduio1)"></view>
			</view>
			<view style="width: 160rpx;height: 80rpx;position: absolute;top: 49%;right: 24%;">
				<view style="width: 100%;height:100%;" v-if="isplay2" @click="reader2(aduio2)"></view>
				<view style="width: 100%;height:100%;" v-if="!isplay2" @click="reader2(aduio2)"></view>
			</view>
			<view style="width: 180rpx;height: 60rpx;position: absolute;top: 30%;right: 40%;">
				<view style="width: 100%;height:100%;" v-if="isplay3" @click="reader3(aduio3)"></view>
				<view style="width: 100%;height:100%;" v-if="!isplay3" @click="reader3(aduio3)"></view>
			</view>
			<view style="width: 180rpx;height: 80rpx;position: absolute;top: 7%;right: 25%;">
				<view style="width: 100%;height:100%;" v-if="isplay4" @click="reader4(aduio4)"></view>
				<view style="width: 100%;height:100%;" v-if="!isplay4" @click="reader4(aduio4)"></view>
			</view>
		</view>
	</view>
</template>

<script>
import http from '@/utils/http.js';
export default {
	data() {
		return {
			aduio1: '河桥老街.mp3',
			aduio2: '狐妖小红娘景区.mp3',
			aduio3: '柳溪江绿道.mp3',
			aduio4: '游客服务中心.mp3',
			isplay1: true,
			isplay2: true,
			isplay3: true,
			isplay4: true,
			innerAudioContext: wx.createInnerAudioContext(),
			Audiourl: http.baseUrl + 'UploadFiles/Scene/Audio/',
			// Audiourl: 'http://localhost:54321/UploadFiles/Scene/Audio/'
			
		};
	},
	onLoad() {
	},
	destroyed: function () {
	           console.log("我已经离开了！");
	    //this.stopTimer();
		this.innerAudioContext.stop();
	},
	methods: {
		customback(){
			this.innerAudioContext.pause();
				this.isplay1 = true;
				this.isplay2 = true;
				this.isplay3 = true;
				this.isplay4 = true;
				uni.redirectTo({
					url: '/pages/home/index'
				})
		},
		reader1(e) {
			this.innerAudioContext.src = encodeURI(this.Audiourl + e);
			console.log(this.innerAudioContext.src);
			if (this.isplay1) {
				this.innerAudioContext.play();
				
				this.isplay1 = false;
				this.isplay2 = true;
				this.isplay3 = true;
				this.isplay4 = true;	
				console.log("开始播放："+e);
				this.innerAudioContext.onEnded(() => {
					
					this.isplay1 = true;
					console.log("结束播放："+e);
				});
			} else {
				this.innerAudioContext.pause();
				
				this.isplay1 = true;
				console.log("暂停播放："+e);
			}
			this.innerAudioContext.onError(res => {
				console.log(res.errMsg);
				console.log(res.errCode);
			});
		},
		reader2(e) {
			this.innerAudioContext.src = encodeURI(this.Audiourl + e);
			console.log(this.innerAudioContext.src);
			if (this.isplay2) {
				this.innerAudioContext.play();
				
				this.isplay2 = false;
				this.isplay1 = true;
				this.isplay3 = true;
				this.isplay4 = true;
				console.log("开始播放："+e);
				this.innerAudioContext.onEnded(() => {
					
					this.isplay2 = true;
					console.log("结束播放："+e);
				});
			} else {
				this.innerAudioContext.pause();
				
				this.isplay2 = true;
				console.log("暂停播放："+e);
			}
			this.innerAudioContext.onError(res => {
				console.log(res.errMsg);
				console.log(res.errCode);
			});
		},
		reader3(e) {
			this.innerAudioContext.src = encodeURI(this.Audiourl + e);
			console.log(this.innerAudioContext.src);
			if (this.isplay3) {
				this.innerAudioContext.play();
				
				this.isplay3 = false;
				this.isplay2 = true;
				this.isplay1 = true;
				this.isplay4 = true;
				console.log("开始播放："+e);
				this.innerAudioContext.onEnded(() => {
					
					this.isplay3 = true;
					console.log("结束播放："+e);
				});
			} else {
				this.innerAudioContext.pause();
				
				this.isplay3 = true;
				console.log("暂停播放："+e);
			}
			this.innerAudioContext.onError(res => {
				console.log(res.errMsg);
				console.log(res.errCode);
			});
		},
		reader4(e) {
			this.innerAudioContext.src = encodeURI(this.Audiourl + e);
			console.log(this.innerAudioContext.src);
			if (this.isplay4) {
				this.innerAudioContext.play();
				this.isplay4 = false;
				this.isplay1 = true;
				this.isplay3 = true;
				this.isplay2 = true;
				console.log("开始播放："+e);
				this.innerAudioContext.onEnded(() => {
					this.isplay4 = true;
					console.log("结束播放："+e);
				});
			} else {
				this.innerAudioContext.pause();
				this.isplay4 = true;
				console.log("暂停播放："+e);
			}
			this.innerAudioContext.onError(res => {
				console.log(res.errMsg);
				console.log(res.errCode);
			});
		}
	}
};
</script>

<style>
page {
	height: 100%;
	overflow: auto;
}
.wrap {
	height: 100%;
}
</style>
