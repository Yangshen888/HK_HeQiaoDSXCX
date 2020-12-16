<template>
	<view class="u-wrap" style="height: 100%;">
	<view style="height: 100%;">
		<view class="wrap" style="height: 100%;">
			<view class="u-tabs-box" style="height: 6%;">
				<u-tabs-swiper activeColor="#b19f8b" ref="tabs" :list="list" :current="current" @change="change" :is-scroll="false"
				 swiperWidth="750"></u-tabs-swiper>
			</view>
			
			<swiper class="swiper-box" :current="swiperCurrent" @transition="transition" @animationfinish="animationfinish"
			 style="height: 94%;">
				<swiper-item class="swiper-item">
					<scroll-view scroll-y style="height: 100%;width: 100%;">
						<view style="height: 100%;position: relative;padding: 0 30rpx;">
							<!-- background-image: url(https://hqjsc.hzgx.info/wxapp/static/areabg.png);background-size: 100%; -->
							<!-- <view class="leftItem" @click="nini" style="background-image: url(https://hqjsc.hzgx.info/wxapp/static/youwan1.png); width:50%;height:100%;background-size:100% 100%;border-right: 5rpx solid #6f6d5f;writing-mode: vertical-rl;">
								古镇游
							</view>
							<view class="rightItem" @click="xoxo"  style="background-image: url(https://hqjsc.hzgx.info/wxapp/static/youwan2.png); width:50%;height:100%;background-size:100% 100%;writing-mode: vertical-rl;">
								周边游
							</view> -->
							<view class="scence">
								<view style="font-size: 0;">
									<video src="https://hqjsc.hzgx.info/wxapp/static/village/xiaohongn.mp4" controls poster="https://hqjsc.hzgx.info/wxapp/static/village/dmPoster.png" style="width: 100%;height: 390rpx;"></video>
								</view>
								<view class="scenceName" style="padding-left: 20rpx;">狐妖小红娘国漫小镇</view>
							</view>
							<view class="scenceBox">
								<view class="scence" @click="totraveltips">
									<view class="imageBox">
										<image src="https://hqjsc.hzgx.info/wxapp/static/guzhenheqiao1.png" mode="" style="width:100%;position: absolute;top: 50%;transform: translateY(-50%);"></image>
									</view>
									<view style="padding-left: 20rpx;padding-bottom: 20rpx;">
										<view class="scenceName">河桥古镇</view>
										<view style="font-size: 24rpx;">临安区河桥古镇，地处杭州西南部，它是一个拥有1300多年历史的山区古镇，现为省级历史文化保护区...</view>
									</view>
								</view>
								<view class="scence" @click="totraveltips1">
									<view class="imageBox">
										<image src="https://hqjsc.hzgx.info/wxapp/static/lxj2.png" mode="" style="width:100%;position: absolute;top: 50%;transform: translateY(-50%);"></image>
									</view>
									<view style="padding-left: 20rpx;padding-bottom: 20rpx;">
										<view class="scenceName">柳溪江码头</view>
										<view style="font-size: 24rpx;">临安区柳溪江景区是浙西唯一的水景旅游区，被誉为浙西最美女人河，有着“浙西秦淮”的别称...</view>
									</view>
								</view>
								<view class="scence" @click="totraveltips2">
									<view class="imageBox">
										<image src="https://hqjsc.hzgx.info/wxapp/static/images/banner/banner2.jpg" mode="" style="width:100%;position: absolute;top: 50%;transform: translateY(-50%);"></image>
									</view>
									<view style="padding-left: 20rpx;padding-bottom: 20rpx;">
										<view class="scenceName">示范型村落景区</view>
										<view style="font-size: 24rpx;">泥骆村位于浙江省杭州市临安区河桥镇，地处美丽的柳溪江畔;云浪村位于河桥镇东面，美丽的柳溪江沿线而过...</view>
									</view>
								</view>
								<view class="scence" @click="totraveltips3">
									<view class="imageBox">
										<image src="https://hqjsc.hzgx.info/wxapp/static/rjshd1.jpg" mode="" style="width:100%;position: absolute;top: 50%;transform: translateY(-50%);"></image>
									</view>
									<view style="padding-left: 20rpx;padding-bottom: 20rpx;">
										<view class="scenceName">瑞晶石花洞</view>
										<view style="font-size: 24rpx;">瑞晶洞又名“中国石花洞”，有七星岩之宏大；庐笛岩之绚丽；瑶琳洞之离奇...</view>
									</view>
								</view>
								<!-- <view class="scence" @click="totraveltips4">
									<view class="imageBox">
										<image src="https://hqjsc.hzgx.info/wxapp/static/images/banner/guzhenyou.jpg" mode="" style="width:100%;position: absolute;top: 50%;transform: translateY(-50%);"></image>
									</view>
									<view style="padding-left: 20rpx;padding-bottom: 20rpx;">
										<view class="scenceName">古镇游</view>
										<view style="font-size: 24rpx;">来到美丽河桥，感受山水神韵，它将会带你去寻找青瓦白墙、流水缠绕的地方，那些最后的、尚未消逝的家园...</view>
									</view>
								</view> -->
								<view class="scence" @click="totraveltips5">
									<view class="imageBox">
										<image src="https://hqjsc.hzgx.info/wxapp/static/images/banner/banner3.jpg" mode="" style="width:100%;position: absolute;top: 50%;transform: translateY(-50%);"></image>
									</view>
									<view style="padding-left: 20rpx;padding-bottom: 20rpx;">
										<view class="scenceName">周边游</view>
										<view style="font-size: 24rpx;">不需要太多时间，不需要太多金钱，不需要太多奔波，不需要太多计划，你只需要带上心情和你的朋友...</view>
									</view>
								</view>
							</view>
							<!-- <view style="width: 50%;text-align: center;position: absolute;top: 40%;transform: translateY(-50%);left: 0;">
								<image src="https://hqjsc.hzgx.info/wxapp/static/guzhenyou.png" style="width: 50%;" mode="widthFix" @click="nini"></image>
							</view>
							<view style="width: 50%;text-align: center;position: absolute;top: 40%;transform: translateY(-50%);right: 0;">
								<image src="https://hqjsc.hzgx.info/wxapp/static/zhoubianyou.png" style="width: 50%;" mode="widthFix" @click="xoxo"></image>
							</view> -->
						</view>
			        </scroll-view>
			    </swiper-item>
				
				<swiper-item class="swiper-item">
					<scroll-view scroll-y style="height: 100%;width: 100%;" @scrolltolower="reachBottom">
						<view>
							<view class="cu-card article" v-for="(item, index) in kw" v-if="kw.length > 0" :key="index">
								<view class="cu-item shadow"  @click="clickStrategy(item.strategyUuid)">
									<view class="content">
										<view style="width: 45%;">
											<!-- <u-image width="100%" height="100%" :src="dealwithphoto(purl,item.photoUrl)" mode="scaleToFill" border-radius="10rpx"></u-image> -->
											<image :src="dealwithphoto(purl,item.photoUrl)" style="border-radius: 10rpx;width: 100%;height: 160rpx;"></image>
										</view>
										<view class="desc" style="position: relative;">
											<view class="title">
												<view class="text-cut">{{ item.title }}</view>
											</view>
											<view class="text-content">{{ item.strategyContent }}</view>
											<view style="font-size: 10px;margin-top: 4px;position: absolute;left: 0;bottom: 0;">发布时间：{{ item.addTime }}</view>
										</view>
									</view>
								</view>
							</view>
						
						</view>
				    </scroll-view>
				</swiper-item>
			</swiper>
		</view>
	</view>
	</view>
	
	
</template>

<script>
	import {
		GetLiNewAll,
	} from '@/api/gereninfo/gereninfo.js';
	import http from '@/utils/http.js';
	export default {
		data() {
			return {
				list: [{
						name: '游玩'
					},
					{
						name: '攻略'
					}
				],
				current: 0,
				swiperCurrent: 0,
				dx: 0,
				ischeck: 0,
				
				menushow: false,
				mobile: {
					title: "",
					strategyContent: "",
					photoUrl: "",
					addTime: "",
					placeofresidence: "",
					systemUserUuid: '',
				},
				kw: [],
				purl: http.baseUrl + 'UploadFiles/Traveltips/Strategy/',
			}
		},
		methods: {
			nini() {
				uni.navigateTo({
					url: '/pages/home/tour?ytype=1'
				});
			},
			xoxo() {
				uni.navigateTo({
					url: '/pages/home/tour?ytype=2'
				});
			},
			totraveltips(){
				uni.navigateTo({
					url: '../traveltips/traveltips'
				});
			},
			totraveltips1(){
				uni.navigateTo({
					url: '../traveltips/traveltips1'
				});
			},
			totraveltips3(){
				uni.navigateTo({
					url: '../traveltips/traveltips3'
				});
			},
			totraveltips2(){
				uni.navigateTo({
					url: '../traveltips/traveltips2'
				});
			},
			totraveltips4(){
				uni.navigateTo({
					url: '../traveltips/traveltips4?playType=1'
				});
			},
			totraveltips5(){
				// uni.navigateTo({
				// 	url: '../traveltips/traveltips4?playType=2'
				// });
				uni.navigateTo({
					url: '../introduce/index?playType=2'
				});
			},
			// tab栏切换
			change(index) {
				this.swiperCurrent = index;
				
			},
			transition({
				detail: {
					dx
				}
			}) {
				this.$refs.tabs.setDx(dx);
			},
			animationfinish({
				detail: {
					current
				}
			}) {
				this.$refs.tabs.setFinishCurrent(current);
				this.current = current;
				this.swiperCurrent = current;

				if (this.current == 0) {
				
				} else if (this.current == 1) {
					this.gettravelList();
				} 
			},
			
			dealwithphoto(base, photourl) {
				if (photourl != null) {
					console.log(base + photourl.split(',')[0])
					return base + photourl.split(',')[0];
				} else {
					return base + photourl;
				}
			},
			gettravelList()
			{
				let data = {
					systemUserUuid: this.$store.state.userId
				};
				GetLiNewAll(data).then(res => {
					console.log("获取当前账号已发布的攻略");
					console.log(res);
					if (res.data.data.length == 0) {
						uni.showToast({
							title: '未获取到信息',
							icon: 'none'
						});
						return;
					} else {
						this.kw = res.data.data
						console.log(this.kw);
					}
				});
			},
			clickStrategy(guid) {
				console.log(guid);
				uni.navigateTo({
					url: "../gereninfo/StrategyInfo?guid=" + guid
				})
			},
			reachBottom1(){
				
			}
		}
	}
</script>

<style>
	page {
		height: 100%;
	}

	.scence {
		margin: 15px 0;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
		border-radius: 20rpx;
		overflow: hidden;
	}

	.imageBox {
		position: relative;
		width: 100%;
		height: 120px;
		overflow: hidden;
	}

	.scenceName {
		line-height: 2;
		font-size: 30rpx;
	}

	.leftItem {
		width: 50%;
		height: 100%;
		float: left;
		/* background-image: url(../../static/map.jpg); */
		/* position: absolute;
		top: 0; */
		overflow: hidden;
		/* transform-origin: top right;
		
		transform: rotate(15deg); */
		z-index: 1;
	}

	.rightItem {
		width: 50%;
		height: 100%;
		float: right;
		/* background-image: url(../../static/map.jpg); */
		/* position: absolute;
		bottom: 0; */
		overflow: hidden;
		background-color: purple;
	}
	
	
	.cu-card {
		display: block;
		overflow: hidden;
		padding-top: 20rpx;
		margin: 20rpx 0;
		box-shadow: 0 0 2px rgba(0, 0, 0, 0.2);
		border-radius: 10rpx;
	}
	
	.cu-card .article {
		display: block;
	}
	
	.cu-item {
		display: block;
		background-color: #ffffff;
		overflow: hidden;
		border-radius: 5px;
		margin: 0 10px;
	}
	
	.title {
		font-size: 14px;
		font-weight: 900;
		color: #333333;
		line-height: 60rpx;
	}
	
	.text-cut {
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
	}
	
	.content {
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
	}
	
	.text-content {
		font-size: 12px;
		text-indent: 2em;
		/* text-align: justify; */
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
	}
	
	.desc {
		margin-left: 20rpx;
		width: 50%;
	}
	
	.text-bottom {
		font-size: 12px;
		line-height: 30px;
	}
</style>
