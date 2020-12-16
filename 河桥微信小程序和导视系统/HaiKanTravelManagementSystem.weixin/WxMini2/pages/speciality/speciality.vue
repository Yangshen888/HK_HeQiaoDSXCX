<template>
	<view class="u-wrap" style="margin-top: 40rpx;">
		<!-- :style="{'background': meishibg,'background-size':'100% 100%'}" -->
		<!-- 荷花背景 -->
		<!-- <view style="position: fixed;bottom: 0;left: 0;font-size: 0;">
			<image src="https://hqjsc.hzgx.info/wxapp/static/lotus.png" mode="widthFix" style="width: 500rpx;"></image>
		</view> -->
		<!-- 特产购物 -->
		<view>
			<view class="specialityBox" v-for="(item, index) in tabbar[0].foods" @click="Imgclick(tabbar[0].name, item)" style="background-color: #fff;">
				<view class="leftBox" style="width: 200rpx;height: 200rpx;overflow: hidden;">
					<u-image width="100%" height="200rpx" :src="baseurl+item.icon"></u-image>
				</view>
				<view class="rightBox" style="line-height: 1.5;padding-top: 36rpx;">
					<view>{{item.name}}</view>
					<view class="decripte">{{item.introduction}}</view>
				</view>
			</view>
		</view>
		<!-- 河桥镇 -->
		<!-- <view style="z-index: 1;height: 8%;position: fixed;bottom: 0;width: 100%;">
			<p style="font-family: 华文行楷;font-size:50rpx;text-align: center;position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);">
				河桥镇
				<br />
				<span style="font-size:24rpx;font-family: 华文黑体;">HeQiaoZhen</span>
			</p>
		</view> -->
	</view>
</template>

<script>
	// import classifyData from '@/common/classify.data.js';

	import http from '@/utils/http.js';
	import {
		getFoodShow,
		getHotleFish,
		gettechanShow3,
		getHotelShow,
		getPickShow,
	} from '@/api/esea/esea.js';
	export default {
		data() {
			return {
				baseurl: http.baseUrl,
				tabbar: [
					{
						name: '特产购物',
						englishname: 'Specialty shopping',
						icon: 'https://hqjsc.hzgx.info/wxapp/static/images/esea/gw2x.png',
						// bg:'../https://hqjsc.hzgx.info/wxapp/static/images/esea/gwbg.png',
						sy: 'height: 100%;background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/esea/gwbg.png);background-size: 100% 100%;',
						foods: [],
						picture:''
					}
				],
				scrollTop: 0, //tab标题的滚动条位置
				current: 0, // 预设当前项的值
				menuHeight: 0, // 左边菜单的高度
				menuItemHeight: 0, // 左边菜单item的高度
				current: 0, // tabs组件的current值，表示当前活动的tab选项
				swiperCurrent: 0, // swiper组件的current值，表示当前那个swiper-item是活动的
			};
		},
		computed: {},
		onLoad() {
			let that = this;
			// getHotleFish().then(res => {
			// 	//绑定全鱼宴推荐数据
			// 	this.tabbar[0].foods = res.data.data
			// });
			// getFoodShow().then(res => {
			// 	//绑定特色小吃推荐数据
			// 	this.tabbar[1].foods = res.data.data
			// });

			gettechanShow3().then(res => {
				//绑定特产数据
				console.log('特产购物')
				console.log(res)
				this.tabbar[0].foods = res.data.data
				console.log(this.tabbar[0])
			});
			// getHotelShow().then(res => {
			// 	console.log("数据123")
			// 	console.log(res)
			// 	//绑定特色采摘数据
			// 	this.tabbar[1].foods = res.data.data
			// });
			// getPickShow().then(res => {
			// 	console.log("数据")
			// 	console.log(res)
			// 	//绑定特色采摘数据
			// 	this.tabbar[2].foods = res.data.data
			// });
		},
		methods: {
			Imgclick(name, data) {
				console.log("点击了图片")
				// if (name == "全鱼宴") {
				// 	uni.navigateTo({
				// 		url: '../ESEA/eaeashows?foodName=' + data.foodName + '&title=' + data.title + '&price=' + data.price +
				// 			'&address=' + data.address + '&picture=' + data.picture + '&introduction=' + data.introduction + '&lon=' +
				// 			data.lon + '&lat=' + data.lat
				// 	});
				// } else if (name == "特色小吃") {
				// 	uni.navigateTo({
				// 		url: '../ESEA/eaeashows?foodName=' + data.foodName + '&title=' + data.title + '&price=' + data.price +
				// 			'&address=' + data.address + '&picture=' + data.picture + '&introduction=' + data.introduction + '&lon=' +
				// 			data.lon + '&lat=' + data.lat
				// 	});
				// }
				// 	else if (name == "酒店民宿") {
				// 		uni.navigateTo({
				// 			url: '../ESEA/hotelshows?Name=' + data.name + '&phone=' + data.phone + '&price=' + data.price + '&address=' +
				// 				data.address + '&picture=' + data.picture + '&introduction=' + data.introduction + '&lon=' + data.lon +
				// 				'&lat=' + data.lat
				// 		});
				// 	} else 
				// if (name == "特色采摘") {
				// 	uni.navigateTo({
				// 		url: '../ESEA/pickshows?Name=' + data.name + '&phone=' + data.phone + '&price=' + data.price + '&address=' +
				// 			data.address + '&picture=' + data.picture + '&introduction=' + data.introduction + '&lon=' + data.lon +
				// 			'&lat=' + data.lat
				// 	});
				// } else
				if (name == "特产购物") {
					uni.navigateTo({
						url: '../../packageA/ESEA/techanshow?Name=' + data.name + '&phone=' + data.phone + '&price=' + data.price + '&address=' +
							data.address + '&picture=' + data.picture + '&introduction=' + data.introduction + '&lon=' + data.lon +
							'&lat=' + data.lat + '&shopId=' + data.shopId
					});
				}
			},
			getImg() {
				return Math.floor(Math.random() * 35);
			},
			// 点击左边的栏目切换
			async swichMenu(index) {
				if (index == this.current) return;
				let old = this.current;
				let lindex1 = this.tabbar[old].icon.lastIndexOf('.');
				// let s = this.tabbar[old].icon.substring(0, lindex1 - 1) + '.png';
				// console.log(s);
				// this.tabbar[old].icon = s;
				this.current = index;
				let lindex2 = this.tabbar[index].icon.lastIndexOf('.');
				// let s2 = this.tabbar[index].icon.substring(0, lindex2) + 'b.png';
				// console.log(s2);
				// this.tabbar[index].icon = s2;
				// 如果为0，意味着尚未初始化
				if (this.menuHeight == 0 || this.menuItemHeight == 0) {
					await this.getElRect('menu-scroll-view', 'menuHeight');
					await this.getElRect('u-tab-item', 'menuItemHeight');
				}
				// 将菜单菜单活动item垂直居中
				this.scrollTop = index * this.menuItemHeight + this.menuItemHeight / 2 - this.menuHeight / 2;
			},
			// 获取一个目标元素的高度
			getElRect(elClass, dataVal) {
				new Promise((resolve, reject) => {
					const query = uni.createSelectorQuery().in(this);
					query
						.select('.' + elClass)
						.fields({
							size: true
						}, res => {
							// 如果节点尚未生成，res值为null，循环调用执行
							if (!res) {
								setTimeout(() => {
									this.getElRect(elClass);
								}, 10);
								return;
							}
							this[dataVal] = res.height;
						})
						.exec();
				});
			}
		}
	};
</script>

<style lang="scss" scoped>
	.specialityBox {
		display: flex;
		margin: 40rpx;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
		border-radius: 10rpx;
		overflow: hidden;
	}

	.leftBox {
		// float: left;
	}

	.imgBox {
		width: 100%;
		height: 100%;
		background-position: center center;
		background-size: cover;
		background-repeat: no-repeat;
	}

	.rightBox {
		flex: 1;
		line-height: 1.5;
		padding:0 20rpx;
		padding-top: 18rpx;
	}

	.decripte {
		font-size: 24rpx;
		text-overflow: -o-ellipsis-lastline;
		text-overflow: ellipsis;
		overflow: hidden;
		display: -webkit-box;
		-webkit-line-clamp: 3;
		-webkit-box-orient: vertical;
		text-align: justify;
	}

	.u-wrap {
		/* #ifdef H5 */
		height: calc(100vh - var(--window-top));
		/* #endif */
		display: flex;
		flex-direction: column;
	}

	.u-menu-wrap {
		flex: 1;
		display: flex;
		// overflow: hidden;
	}

	.u-tab-view {
		width: 200rpx;
		height: 100%;
	}

	.u-tab-item {
		height: 110rpx;
		background: #fff;
		// background: #f6f6f6;
		box-sizing: border-box;
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 26rpx;
		color: #444;
		font-weight: 400;
		line-height: 1;
	}

	.u-tab-item-active {
		position: relative;
		color: #000;
		font-size: 30rpx;
		font-weight: 600;
		background: #f6f6f6;
	}

	.u-tab-item-active::before {
		content: '';
		position: absolute;
		//border-left: 4px solid $u-type-primary;
		height: 32rpx;
		left: 0;
		top: 39rpx;
	}

	.u-tab-view {
		height: 100%;
	}

	.right-box {
		background-color: rgb(250, 250, 250);
	}

	.page-view {
		padding: 16rpx;
	}

	.class-item {
		margin-bottom: 30rpx;
		//background-color: #fff;
		padding: 16rpx;
		border-radius: 8rpx;
	}

	.item-title {
		font-size: 26rpx;
		color: $u-main-color;
		font-weight: bold;
	}

	.item-menu-name {
		font-weight: normal;
		font-size: 24rpx;
		color: $u-main-color;
	}

	.item-container {
		display: flex;
		flex-wrap: wrap;
	}

	.thumb-box {
		width: 33.333333%;
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
		margin-top: 20rpx;
	}

	.item-menu-image {
		width: 150rpx;
		height: 150rpx;
	}
</style>
<style>
	page {
		background: url(https://hqjsc.hzgx.info/wxapp/static/taohua.gif);
		background-size: 100% 100%;
	}
</style>
