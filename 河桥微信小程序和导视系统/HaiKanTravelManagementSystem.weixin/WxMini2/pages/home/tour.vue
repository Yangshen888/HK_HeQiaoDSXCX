<template>
	<view style="padding: 0 20px;">
		<view style="width: 100%;overflow: auto;padding: 0 5px;">
			<view class="cardBox" @click="totraveltips5" style="background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/jdjsbg.jpg);background-size: 100%;">
				<!-- <view class="btnBox">
					<u-icon name="photo" style="font-size: 18px;padding: 10rpx 0;"></u-icon>
				</view> -->
				<view class="carditem">景点介绍</view>
				<u-icon class="rightbtn" name="arrow-right"></u-icon>
			</view>
			<view class="cardBox" @click="totraveltips6" style="background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/czbg.jpg);background-size: 100%;">
				<!-- <view class="btnBox">
					<u-icon name="cut" style="font-size:18px;padding: 10rpx 0;"></u-icon>
				</view> -->
				<view class="carditem">采摘</view>
				<u-icon class="rightbtn" name="arrow-right"></u-icon>
			</view>
			<view class="cardBox" @click="totraveltips7" style="background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/lyglbg.png);background-size: 100%;">
				<!-- <view class="btnBox">
					<u-icon name="order" style="font-size: 18px;padding: 10rpx 0;"></u-icon>
				</view> -->
				<view class="carditem">旅游攻略</view>
				<u-icon class="rightbtn" name="arrow-right"></u-icon>
			</view>
			<view class="cardBox" @click="totraveltips8" style="background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/gwbg.jpg);background-size: 100%;">
				<!-- <view class="btnBox">
					<u-icon name="bag" style="font-size: 18px;padding: 10rpx 0;"></u-icon>
				</view> -->
				<view class="carditem">购物</view>
				<u-icon class="rightbtn" name="arrow-right"></u-icon>
			</view>
		</view>
	</view>
</template>

<script>
	export default{
		data(){
			return{
				ytype :"1"
			}
		},
		onLoad(opt){
			console.log(opt.ytype);
			this.ytype = opt.ytype;
		},
		methods:{
			totraveltips5() {
				uni.navigateTo({
					url: '/pages/traveltips/traveltips5'
				});
			},
			totraveltips6(){
				uni.navigateTo({
					url: '/pages/traveltips/traveltips6'
				});
			},
			totraveltips7(){
				uni.navigateTo({
					url: '/pages/traveltips/traveltips7'
				});
			},
			totraveltips8(){
				uni.navigateTo({
					url: '/pages/traveltips/traveltips8'
				});
			}
		}
	}
</script>

<style>
	.cardBox{
		float:left; 
		width: 100%;
		margin: 10rpx 0;
		/* background-color: #FFFFFF; */
		box-shadow: 0 0 2px rgba(0,0,0,0.2);
		height: 160rpx;
		line-height: 160rpx;
		border-radius: 10rpx;
		position: relative;
		padding-left: 20rpx;
	}
	.btnBox{
		width: 10%;
		text-align: center;
		float: left;
		padding-top: 4rpx;
	}
	.carditem{
		float: left;
		color: #fff;
	}
	.rightbtn{
		position: absolute;
		top: 50%;
		transform: translateY(-50%);
		right: 10px;
		float: right;
		color: #fff;
	}
</style>
