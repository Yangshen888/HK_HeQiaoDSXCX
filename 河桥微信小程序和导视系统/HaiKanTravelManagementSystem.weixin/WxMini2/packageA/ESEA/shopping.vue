<template>
	<view class="u-wrap" style="padding-bottom: 40rpx;">
		<view class="u-menu-wrap">
			<scroll-view scroll-y scroll-with-animation class="u-tab-view menu-scroll-view" :scroll-top="scrollTop">
				<view v-for="(item, index) in tabbar" :key="index" class="u-tab-item" :class="[current == index ? 'u-tab-item-active' : '']"
				 :data-current="index" @tap.stop="swichMenu(index)" style="height: 120px;">
					<u-image :src="item.icon" height="70" width="70"></u-image>
					<!-- <text class="u-line-1">{{ item.name }}</text> -->
				</view>
			</scroll-view>
			<block v-for="(item, index) in tabbar" :key="index">
				<scroll-view scroll-y class="right-box" v-if="current == index" style="max-height: 580px;min-height: 500px;">
					<view class="page-view" :style="item.sy">
						<view class="class-item">
							<view class="item-title" style="height: 60px;line-height: 50px;margin-left: 20px;position: relative;"><text
								 style="font-size: 20px;font-weight: bold;">{{item.name}}</text><text style="font-size: 13px;color: #B19F8B;position: absolute;top: 25px;left: 0px;">{{item.englishname}}</text></view>
							<view class="item-container" style="margin-top: 15px;">
								<view class="thumb-box" v-for="(item1, index1) in item.foods" :key="index1" style="margin: 5% 0px;" :style="index1==3?'width:40%;':'width: 56%;'">
									<image class="item-menu-image" :src="baseurl+item1.icon" mode="" :style="item.name=='特产购物'?'border-radius: 50%;width:150rpx;height:150rpx;':'border-radius: 20rpx;width:200rpx;height:150rpx;'"
									 style="border: 2px solid #B19F8B;" @click="Imgclick(item.name,item.foods[index1])"></image>
									<view class="item-menu-name" style="color:#B19F8B;margin-top: 5px;">{{ item1.name }}</view>
								</view>
							</view>
							<p style="text-align: center;">
								<view class="huanyipi" @click="huanyipi(item.name)">换一批</view>
							</p>
						</view>
					</view>
				</scroll-view>
			</block>
		</view>
		<view>
			<p style="font-family: 华文行楷;font-size:50rpx;text-align: center;">
				河桥镇
				<br />
				<span style="font-size:24rpx;font-family: 华文黑体;">HeQiaoZheng</span>
			</p>
		</view>
	</view>
</template>

<script>
	// import classifyData from '@/common/classify.data.js';
	import http from '@/utils/http.js';
	import {
		getFoodShow,
		gettechanShow,
		gettechanShow2,
		getHotelShow,
		getPickShow,
	} from '@/api/esea/esea.js';
	export default {
		data() {
			return {
				ytype:"1",
				playType:"",
				baseurl: http.baseUrl,
				tabbar: [
					{
						name: '特产购物',
						englishname: 'Specialty shopping',
						icon: 'https://hqjsc.hzgx.info/wxapp/static/images/esea/gw2xb.png',
						// bg:'../https://hqjsc.hzgx.info/wxapp/static/images/esea/gwbg.png',
						sy: 'height: 100%;background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/esea/gwbg.png);background-size: 100% 100%;',
						foods: []
					}
				],
				scrollTop: 0, //tab标题的滚动条位置
				current: 0, // 预设当前项的值
				menuHeight: 0, // 左边菜单的高度
				menuItemHeight: 0 // 左边菜单item的高度
			};
		},
		computed: {},
		onLoad(opt) {

			this.playType = opt.playType;
			if (this.playType == "1") {
				gettechanShow().then(res => {
					console.log("数据")
					console.log(res)
					//绑定特色采摘数据
					this.tabbar[0].foods = res.data.data
			
				});
			};
			if (this.playType == "2") {
				gettechanShow2().then(res => {
					//绑定特色采摘数据
					this.tabbar[0].foods = res.data.data
				});
			}
		},
		methods: {
			Imgclick(name, data) {
				console.log("点击了图片")
				if (name == "美食推荐") {
					uni.navigateTo({
						url: '../ESEA/eaeashows?foodName=' + data.foodName + '&title=' + data.title + '&price=' + data.price +
							'&address=' + data.address + '&picture=' + data.picture + '&introduction=' + data.introduction + '&lon=' +
							data.lon + '&lat=' + data.lat
					});
				} 
				else if (name == "酒店民宿") {
					uni.navigateTo({
						url: '../ESEA/hotelshows?Name=' + data.name + '&phone=' + data.phone + '&price=' + data.price + '&address=' +
							data.address + '&picture=' + data.picture + '&introduction=' + data.introduction + '&lon=' + data.lon +
							'&lat=' + data.lat
					});
				} else if (name == "特色采摘") {
					uni.navigateTo({
						url: '../ESEA/pickshows?Name=' + data.name + '&phone=' + data.phone + '&price=' + data.price + '&address=' +
							data.address + '&picture=' + data.picture + '&introduction=' + data.introduction + '&lon=' + data.lon +
							'&lat=' + data.lat
					});
				} else if (name == "特产购物") {
					uni.navigateTo({
						url: '../ESEA/techanshow?Name=' + data.name + '&phone=' + data.phone + '&price=' + data.price + '&address=' +
							data.address + '&picture=' + data.picture + '&introduction=' + data.introduction + '&lon=' + data.lon +
							'&lat=' + data.lat
					});
				}
			},
			//点击换一批
			huanyipi(data) {
				if (data == "特产购物") {
					if (this.playType == "1") {
						gettechanShow().then(res => {
							console.log("数据")
							console.log(res)
							//绑定特色采摘数据
							this.tabbar[0].foods = res.data.data
					
						});
					};
					if (this.playType == "2") {
						gettechanShow2().then(res => {
							//绑定特色采摘数据
							this.tabbar[0].foods = res.data.data
						});
					}
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
				let s = this.tabbar[old].icon.substring(0, lindex1 - 1) + '.png';
				console.log(s);
				this.tabbar[old].icon = s;
				this.current = index;
				let lindex2 = this.tabbar[index].icon.lastIndexOf('.');
				let s2 = this.tabbar[index].icon.substring(0, lindex2) + 'b.png';
				console.log(s2);
				this.tabbar[index].icon = s2;
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

	.u-search-box {
		padding: 18rpx 30rpx;
	}

	.u-menu-wrap {
		flex: 1;
		display: flex;
		overflow: hidden;
	}

	.u-search-inner {
		background-color: rgb(234, 234, 234);
		border-radius: 100rpx;
		display: flex;
		align-items: center;
		padding: 10rpx 16rpx;
	}

	.u-search-text {
		font-size: 26rpx;
		color: $u-tips-color;
		margin-left: 10rpx;
	}

	.u-tab-view {
		width: 200rpx;
		height: 100%;
	}

	.u-tab-item {
		height: 110rpx;
		background: #f6f6f6;
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
		background: #fff;
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
		height: 35px;
		line-height: 35px;
		font-size: 11px;
		background-position-y: 10px;
		background-repeat: no-repeat;
		background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/esea/huanyipi@3x.png);
		background-size: 15px 15px;
		color: #B19F8B;
	}
</style>
