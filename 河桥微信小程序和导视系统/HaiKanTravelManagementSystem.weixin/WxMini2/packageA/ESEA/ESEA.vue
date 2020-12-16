<template>
	<view class="u-wrap" :style="{'background': meishibg,'background-size':'100% 100%'}">
		<!-- 荷花背景 -->
		<!-- <view style="position: fixed;bottom: 0;left: 0;font-size: 0;">
			<image src="../../static/shibg.png" mode="widthFix" style="width: 500rpx;"></image>
		</view> -->
		<!-- tabs -->
		<view style="background-color: transparent;">
			<u-tabs-swiper ref="uTabs" :list="list" :current="current" @change="tabsChange" :is-scroll="false" swiperWidth="750" bg-color="rgba(112,112,112,0.4)" inactive-color="#fff"></u-tabs-swiper>
		</view>
		<!-- tabs-item -->
		<swiper :current="swiperCurrent" @transition="transition" @animationfinish="animationfinish" style="height: 65%;background-color: transparent;margin-top: 10%;padding: 0 40rpx;">
			<swiper-item class="swiper-item" v-for="(item, index) in tabbar" :key="index">
				<scroll-view scroll-y style="width: 100%;position: relative;height: 100%;" @scrolltolower="onreachBottom">
					<view style="width: 50%;display: inline-block;text-align: center;margin: 20rpx 0;" v-for="(item1, index1) in item.foods" :key="index1"
					 @click="Imgclick(item.name,item.foods[index1])">
						<view style="width: 80%;height: 170rpx; border-radius: 10rpx;overflow: hidden;font-size: 0;display: inline-block;">
							<image v-if="item1.icon.substring(item1.icon.lastIndexOf('.'))!='.mp4'" :src="baseurl+item1.icon" style="width: 100%;height: 100%;"></image>
							<video v-if="item1.icon.substring(item1.icon.lastIndexOf('.'))=='.mp4'" :src="baseurl+item1.icon" :autoplay="true" :loop="true" style="width: 100%;height: 100%;"></video>
						</view>
						<view class="item-menu-name" style="color:#B19F8B;margin-top: 5px;">{{ item1.name }}</view>
					</view>
					<!-- <p style="text-align: center;position: absolute;bottom: 0;width: 100%;">
						<view class="huanyipi" @click="huanyipi(item.name)">换一批</view>
					</p> -->
				</scroll-view>
			</swiper-item>
			<!-- <swiper-item class="swiper-item" :key="index">
				<scroll-view scroll-y style="height: 800rpx;width: 100%;" @scrolltolower="onreachBottom">
					<view style="width: 50%;" v-for="(item1, index1) in item.foods" :key="index1" @click="Imgclick(item.name,item.foods[index1])">
						<view style="width: 90%;height: 140rpx; border-radius: 10rpx;overflow: hidden;font-size: 0;">
							<image :src="baseurl+item1.icon" style="width: 100%;height: 100%;"></image>
						</view>
						<view class="item-menu-name" style="color:#B19F8B;margin-top: 5px;">{{ item1.name }}</view>
					</view>
				</scroll-view>
			</swiper-item> -->
		</swiper>
		<!-- <scroll-view scroll-y scroll-with-animation class="u-tab-view menu-scroll-view" :scroll-top="scrollTop">
				<view v-for="(item, index) in tabbar" :key="index" class="u-tab-item" :class="[current == index ? 'u-tab-item-active' : '']"
				 :data-current="index" @tap.stop="swichMenu(index)" style="height: 120rpx;">
					<image :src="item.icon" mode="widthFix" style="width: 90%;"></image>
				</view>
			</scroll-view> -->
		<!-- 河桥镇 -->
		<view style="z-index: 1;height: 8%;position: fixed;bottom: 0;width: 100%;">
			<p style="font-family: 华文行楷;font-size:50rpx;text-align: center;position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);">
				河桥镇
				<br />
				<span style="font-size:24rpx;font-family: 华文黑体;">HeQiaoZhen</span>
			</p>
		</view>
	</view>
</template>

<script>
	// import classifyData from '@/common/classify.data.js';

	import http from '@/utils/http.js';
	import {
		getFoodShow,
		getHotleFish,
		gettechanShow,
		getHotelShow,
		getPickShow,
	} from '@/api/esea/esea.js';
	export default {
		data() {
			return {
				baseurl: http.baseUrl,
				list: [{
					name: '全鱼宴'
				}, {
					name: '特色小吃'
				}],
				meishibg:'url(https://hqjsc.hzgx.info/wxapp/static/meishi.jpg)',
				tabbar: [{
						name: '全鱼宴',
						englishname: 'Fish Feast',
						icon: 'https://hqjsc.hzgx.info/wxapp/static/quanyu.png',
						//bg:'../https://hqjsc.hzgx.info/wxapp/static/images/esea/msbg.png',
						sy: 'height: 100%;background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/background.png);background-size: 100% 100%;',
						foods: []
					},
					{
						name: '特色小吃',
						englishname: 'Special Snack',
						icon: 'https://hqjsc.hzgx.info/wxapp/static/tese.png',
						// bg:'../https://hqjsc.hzgx.info/wxapp/static/images/esea/zsbg.png',
						sy: 'height: 100%;background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/esea/msbg.png);background-size: 100% 100%;',
						foods: []
					},
					// {
					// 	name: '特色采摘',
					// 	englishname: 'Special picking',
					// 	icon: 'https://hqjsc.hzgx.info/wxapp/static/images/esea/cz2x.png',
					// 	// bg:'../https://hqjsc.hzgx.info/wxapp/static/images/esea/czbg.png',
					// 	sy: 'height: 100%;background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/esea/czbg.png);background-size: 100% 100%;',
					// 	foods: []
					// },
					// {
					// 	name: '特产购物',
					// 	englishname: 'Specialty shopping',
					// 	icon: 'https://hqjsc.hzgx.info/wxapp/static/images/esea/gw2x.png',
					// 	// bg:'../https://hqjsc.hzgx.info/wxapp/static/images/esea/gwbg.png',
					// 	sy: 'height: 100%;background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/esea/gwbg.png);background-size: 100% 100%;',
					// 	foods: []
					// }
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
			getHotleFish().then(res => {
				//绑定全鱼宴推荐数据
				this.tabbar[0].foods = res.data.data
				console.log("获取全鱼宴的数据")
				console.log(this.tabbar[0].foods)
			});
			getFoodShow().then(res => {
				//绑定特色小吃推荐数据
				this.tabbar[1].foods = res.data.data
				console.log("获取特色小吃的数据")
				console.log(this.tabbar[1].foods)
			});

			// gettechanShow().then(res => {
			// 	//绑定特产数据
			// 	this.tabbar[3].foods = res.data.data
			// });
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
			// tabs通知swiper切换
			tabsChange(index) {
				this.swiperCurrent = index;
			},
			// swiper-item左右移动，通知tabs的滑块跟随移动
			transition(e) {
				let dx = e.detail.dx;
				this.$refs.uTabs.setDx(dx);
			},
			// 由于swiper的内部机制问题，快速切换swiper不会触发dx的连续变化，需要在结束时重置状态
			// swiper滑动结束，分别设置tabs和swiper的状态
			animationfinish(e) {
				if(e.detail.current==0){
					this.meishibg='url(https://hqjsc.hzgx.info/wxapp/static/meishi.jpg)'
				}else{
					this.meishibg='url(https://hqjsc.hzgx.info/wxapp/static/meishibg.png)'
				}
				console.log('在这里')
				console.log(e.detail.current)
				let current = e.detail.current;
				this.$refs.uTabs.setFinishCurrent(current);
				this.swiperCurrent = current;
				this.current = current;
			},
			// scroll-view到底部加载更多
			onreachBottom() {

			},
			Imgclick(name, data) {
				console.log("点击了图片")
				if (name == "全鱼宴") {
					uni.navigateTo({
						url: '../ESEA/eaeashows?foodName=' + data.foodName + '&title=' + data.title + '&price=' + data.price +
							'&address=' + data.address + '&picture=' + data.picture + '&introduction=' + data.introduction + '&lon=' +
							data.lon + '&lat=' + data.lat
					});
				} else if (name == "特色小吃") {
					uni.navigateTo({
						url: '../ESEA/eaeashows?foodName=' + data.foodName + '&title=' + data.title + '&price=' + data.price +
							'&address=' + data.address + '&picture=' + data.picture + '&introduction=' + data.introduction + '&lon=' +
							data.lon + '&lat=' + data.lat
					});
				}
				// 	else if (name == "酒店民宿") {
				// 		uni.navigateTo({
				// 			url: '../ESEA/hotelshows?Name=' + data.name + '&phone=' + data.phone + '&price=' + data.price + '&address=' +
				// 				data.address + '&picture=' + data.picture + '&introduction=' + data.introduction + '&lon=' + data.lon +
				// 				'&lat=' + data.lat
				// 		});
				// 	} else if (name == "特色采摘") {
				// 		uni.navigateTo({
				// 			url: '../ESEA/pickshows?Name=' + data.name + '&phone=' + data.phone + '&price=' + data.price + '&address=' +
				// 				data.address + '&picture=' + data.picture + '&introduction=' + data.introduction + '&lon=' + data.lon +
				// 				'&lat=' + data.lat
				// 		});
				// 	} else if (name == "特产购物") {
				// 		uni.navigateTo({
				// 			url: '../ESEA/techanshow?Name=' + data.name + '&phone=' + data.phone + '&price=' + data.price + '&address=' +
				// 				data.address + '&picture=' + data.picture + '&introduction=' + data.introduction + '&lon=' + data.lon +
				// 				'&lat=' + data.lat
				// 		});
				// 	}
			},
			//点击换一批
			huanyipi(data) {
				if (data == "全鱼宴") {
					getHotleFish().then(res => {
						//绑定美食推荐数据
						this.tabbar[0].foods = res.data.data
					});
				} else if (data == "特色小吃") {
					getFoodShow().then(res => {
						//绑定美食推荐数据
						this.tabbar[1].foods = res.data.data
					});
				}
				// else if (data == "酒店民宿") {
				// 	getHotelShow().then(res => {
				// 		this.tabbar[1].foods = res.data.data
				// 	});
				// } else if (data == "特色采摘") {
				// 	getPickShow().then(res => {
				// 		this.tabbar[2].foods = res.data.data
				// 	});
				// } else if (data == "特产购物") {
				// 	gettechanShow().then(res => {
				// 		//绑定特产数据
				// 		this.tabbar[3].foods = res.data.data
				// 	});
				// }
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
	.u-wrap {
		height: calc(100vh);
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

	//换一批按钮样式
	.huanyipi {
		display: inline-block;
		width: 75px;
		height: 75px;
		line-height: 75px;
		font-size: 11px;
		background-position-y: 60rpx;
		background-repeat: no-repeat;
		background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/esea/huanyipi@3x.png);
		background-size: 15px 15px;
		color: #B19F8B;
	}
</style>
<style>
	/* page {
		background: url(https://hqjsc.hzgx.info/wxapp/static/meishi.jpg);
		background-size: 100% 100%;
	} */
</style>
