<template>
	<view class="u-wrap">
		<view class="u-search-box">
			<u-search shape="round" :clearabled="true" border-color="#c3b6a7" :show-action="false" @search="toSearch" @clear="toClear"
			 @change="toChange"></u-search>
		</view>
		<view style="height: 100%;">
			<view class="wrap" style="height: 100%;">
				<view class="u-tabs-box" style="height: 6%;">
					<u-tabs-swiper activeColor="#b19f8b" ref="tabs" :list="list" :current="current" @change="change" :is-scroll="false"
					 swiperWidth="750"></u-tabs-swiper>
				</view>
				<swiper class="swiper-box" :current="swiperCurrent" @transition="transition" @animationfinish="animationfinish"
				 style="height: 94%;">
					<swiper-item class="swiper-item">
						<scroll-view scroll-y style="height: 100%;width: 100%;" @scrolltolower="reachBottom">
							<view class="page-box" v-if="orderListbus.length > 0">
								<view class="order" v-for="(res, index) in orderListbus" @click="tobusInfo(res.busUuid)" style="background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/parking/tbg.png);background-size: 100% 100%;">
									<view class="busRouteBox">
										<view class="leftBox" style="width: 200rpx;height: 200rpx;overflow: hidden;">
											<u-image width="100%" height="200rpx" :src="prefix + 'UploadFiles/Xing/'+picLis[index]"></u-image>
										</view>
										<view class="rightBox" style="width: 60%;">
											<view style="display: flex; width: 100%;height:50%;padding: 0 10rpx;">
												<view style="font-weight: 600;width: 25%;">起点：</view>
												<view style="color: #5e5f5f;flex:1;">{{res.begainSite}}</view>
											</view>
											<view style="display: flex; width: 100%;height:50%;padding: 0 10rpx;">
												<view style="font-weight: 600;;width: 25%;">终点：</view>
												<view style="color: #5e5f5f;;flex:1;">{{res.endSite}}</view>
											</view>
										</view>
									</view>
								</view>
								<u-loadmore :status="loadStatus" bg-color="transparent"></u-loadmore>
							</view>
						</scroll-view>
					</swiper-item>
					<swiper-item class="swiper-item">
						<scroll-view scroll-y style="height: 100%;width: 100%;" @scrolltolower="reachBottom">
							<view class="page-box" v-if="orderList.length > 0">
								<view class="order" v-for="(res, index) in orderList" :key="index" style="background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/parking/tbg.png);background-size: 100% 100%;"
								 @click="toParkingInfo(res.carParkUuid)">
									<view class="item">
										<view class="left" style="font-size: 0;">
											<image :src="prefix + 'UploadFiles/CarPark/' + res.picture" mode="aspectFill"></image>
										</view>
										<view class="content" style="width: 52%;">
											<view class="title u-line-2" style="text-align: center;font-weight: 600;">{{ res.name }}</view>
											<view class="type" style="text-align: center;color: #dfdfdf;">距离你当前位置约{{res.distance}}km</view>
											<view class="delivery-time">
												<view style="font-weight: 600;float: left;">总车位:</view>
												<view class="carnum" style="color: #bfc0c0;">{{res.truckSpace}}</view>
											</view>
											<view class="delivery-time">
												<view style="font-weight: 600;float: left;">剩余车位:</view>
												<view class="carnum" :style="res.surplusTs<(res.truckSpace/2)?'color:#ff1919':'color:#c8bcae'">{{res.surplusTs}}
												</view>
											</view>
										</view>
										<view class="right" style="position: relative; width: 20%;text-align: center;border-left: 1px solid #c3b6a7;">
											<view style="position: absolute;left: 50%; top: 50%;transform: translate(-50%,-50%);">
												<view>
													<image style="width: 20px;height: 20px;" src="https://hqjsc.hzgx.info/wxapp/static/images/parking/jt.png"></image>
												</view>
												<view style="color: #c3b6a7;">前往</view>
											</view>
										</view>
									</view>
								</view>
								<u-loadmore :status="loadStatus" bg-color="transparent"></u-loadmore>
							</view>
						</scroll-view>
					</swiper-item>
					<swiper-item class="swiper-item">
						<scroll-view scroll-y style="height: 100%;width: 100%;" @scrolltolower="reachBottom">
							<view class="page-box" v-if="orderListdc.length > 0">
								<view class="order" v-for="(res, index) in orderListdc" :key="index" style="background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/parking/tbg.png);background-size: 100% 100%;"
								 @click="toSharkin(res.lon,res.lat,res.address)">
									<view class="item">
										<view class="left" style="font-size: 0;">
											<image :src="prefix + 'UploadFiles/Xing/' + res.picture" mode="aspectFill"></image>
										</view>
										<view class="content" style="width: 50%;">
											<view class="delivery-time" style="height: 100rpx;line-height: 1;">
												<view style="font-weight: 600;line-height: 1.5;">租车点名称:</view>
												<view class="carnum" style="color: #c3b6a7;width: 90%;margin-top: 4rpx;">{{res.name}}</view>
											</view>
											<view class="delivery-time" style="height: 100rpx;line-height: 1;">
												<view style="font-weight: 600;line-height: 1.5;">所处位置:</view>
												<view class="carnum" style="color: #c3b6a7;width: 90%;margin-top: 4rpx;">{{res.address}}</view>
											</view>
										</view>
										<view class="right" style="position: relative; width: 15%;text-align: center;border-left: 1px solid #c3b6a7;margin-left: 20rpx;">
											<view style="position: absolute;left: 50%; top: 50%;transform: translate(-50%,-50%);">
												<view>
													<image style="width: 20px;height: 20px;" src="https://hqjsc.hzgx.info/wxapp/static/images/parking/jt.png"></image>
												</view>
												<view style="color: #c3b6a7;">前往</view>
											</view>
										</view>
									</view>
								</view>
								<u-loadmore :status="loadStatus" bg-color="transparent"></u-loadmore>
							</view>
						</scroll-view>
					</swiper-item>
				</swiper>
			</view>
		</view>
	</view>
</template>

<script>
	import http from '@/utils/http.js';
	import {
		getParkingList
	} from '@/api/parking/parking.js';
	export default {
		data() {
			return {
				prefix: http.baseUrl,
				orderList: [],
				orderListdc: [],
				orderListbus: [],
				query: {
					totalCount: 0,
					pageSize: 5,
					currentPage: 1,
					kw: '',
					type: 0,
					lon: 0,
					lat: 0,
					sort: [{
						direct: 'DESC',
						field: 'ID'
					}],
				},
				loadStatus: 'nomore',
				pindex: 0,
				list: [{
						name: '公交路线'
					},
					{
						name: '停车场'
					},
					{
						name: '共享单车'
					}
				],
				current: 0,
				swiperCurrent: 0,
				dx: 0,
				ischeck: 0,
				picLis:[]
			};
		},
		onLoad() {
			console.log(http);
			let that = this;
			uni.getLocation({
				type: 'gcj02',
				success: function(res) {
					console.log('当前位置的经度：' + res.longitude);
					console.log('当前位置的纬度：' + res.latitude);
					that.query.lon = res.longitude;
					that.query.lat = res.latitude;
					that.getlistInfo();
				},
				fail: function(err) {
					console.log(err);
					// uni.showToast({
					//     title: err,
					//     duration: 2000
					// });
					that.getlistInfo();
				}
			});

			//this.getlistInfo();
		},
		methods: {
			tobusInfo(uuid) {
				uni.navigateTo({
					url: '/pages/parking/businfo?uuid=' + uuid
				});
			},
			// tab栏切换
			change(index) {
				this.swiperCurrent = index;
				console.log(this.swiperCurrent);
				this.query.type = index;
				this.orderList = [];
				this.orderListdc = [];
				this.orderListbus = [];
				this.query.currentPage = 1;
				this.pindex = 0;
				if (this.current == index) {
					this.getlistInfo();
				}
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
				this.orderList = [];
				this.orderListdc = [];
				this.orderListbus = [];
				this.query.type = current;
				this.query.currentPage == 1;
				if (this.current == 0) {
					this.query.type = 0;
					this.getlistInfo();
				} else if (this.current == 1) {
					this.query.type = 1;
					this.getlistInfo();
				} else if (this.current == 2) {
					this.query.type = 2;
					this.getlistInfo();
				}
				console.log('balababa')
				console.log(this.swiperCurrent)
			},
			reachBottom() {
				this.loadStatus = 'loading';
				this.pindex++;
				this.query.currentPage++;
				console.log(this.query.currentPage);
				if (this.current == 0) {
					this.query.type = 0;
					this.getlistInfo();
				} else if (this.current == 1) {
					this.query.type = 1;
					this.getlistInfo();
				} else if (this.current == 2) {
					this.query.type = 2;
					this.getlistInfo();
				}
			},
			toParkingInfo(uuid) {
				//console.log(uuid);
				uni.navigateTo({
					url: '/pages/parking/parkingInfo?uuid=' + uuid
				});
			},
			toSharkin(a, b, c) {
				let lon = parseFloat(a);
				let lat = parseFloat(b);
				uni.openLocation({
					latitude: lat,
					longitude: lon,
					name: c,
					success: function() {
						console.log('success');
					},
					fail: function(err) {
						console.log(err);
					}
				});
			},
			getlistInfo() {
				getParkingList(this.query).then(res => {
					console.log(res);

					if (this.query.kw != '' && this.query.currentPage == 1) {
						if (this.query.type == 0) {
							this.orderListbus = res.data.data;
						} else if (this.query.type == 1) {
							this.orderList = res.data.data;
							console.log(4654654)
							console.log(this.orderList);
						} else if (this.query.type == 2) {
							this.orderListdc = res.data.data;
						}
					} else {
						if (this.query.type == 0) {
							this.orderListbus.push.apply(this.orderListbus, res.data.data);
							this.picLis=[];
							this.orderListbus.forEach(item=>{
								let pictures=item.picture.split(',')
								this.picLis.push(pictures[0])
								console.log('hei boy')
								console.log(this.picLis)
							})
						} else if (this.query.type == 1) {
							this.orderList.push.apply(this.orderList, res.data.data);
						} else if (this.query.type == 2) {
							this.orderListdc.push.apply(this.orderListdc, res.data.data);
						}

					}
					console.log(16565)
					console.log(this.orderList);
					this.loadStatus = "nomore";
					if (res.data.data.length == 0) {
						this.query.currentPage--;
						this.pindex--;
					}
					//this.$forceUpdate();
				});
			},
			toSearch(e) {
				console.log(e);
				this.query.kw = e;
				this.query.currentPage = 1;
				this.pindex = 0;
				this.orderList = [];
				this.orderListdc = [];
				this.orderListbus = [];
				this.getlistInfo();
			},
			toClear(e) {
				this.query.kw = '';
				this.query.currentPage = 1;
				this.pindex = 0;
				this.orderList = [];
				this.orderListdc = [];
				this.orderListbus = [];
				this.getlistInfo();
			},
			toChange(e) {
				console.log(e);

			}
		}
	};
</script>

<style lang="scss" scoped>
	.busRouteBox {
		display: flex;
		// box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
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
		padding: 0 20rpx;
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

	.order {
		width: 710rpx;
		background-color: #ffffff;
		margin: 20rpx auto;
		border-radius: 20rpx;
		box-sizing: border-box;
		padding: 20rpx;
		font-size: 28rpx;

		.top {
			display: flex;
			justify-content: space-between;

			.left {
				display: flex;
				align-items: center;

				.store {
					margin: 0 10rpx;
					font-size: 32rpx;
					font-weight: bold;
				}
			}

			.right {
				color: $u-type-warning-dark;
				padding: 0;
			}
		}

		.item {
			display: flex;
			.left {
				margin-right: 20rpx;

				image {
					width: 200rpx;
					height: 200rpx;
					border-radius: 10rpx;
				}
			}

			.content {
				.title {
					font-size: 28rpx;
					line-height: 50rpx;
				}

				.type {
					margin: 10rpx 0;
					font-size: 24rpx;
					color: $u-tips-color;
				}

				.delivery-time {
					// color: #e5d001;
					font-size: 24rpx;
					line-height: 1.5;
					overflow: auto;
				}
			}

			.right {
				margin-left: 40rpx;
				padding-top: 20rpx;
				text-align: right;

				.decimal {
					font-size: 24rpx;
					margin-top: 4rpx;
				}

				.number {
					color: $u-tips-color;
					font-size: 24rpx;
				}
			}
		}

		.total {
			margin-top: 20rpx;
			text-align: right;
			font-size: 24rpx;

			.total-price {
				font-size: 32rpx;
			}
		}

		.bottom {
			display: flex;
			margin-top: 40rpx;
			padding: 0 10rpx;
			justify-content: space-between;
			align-items: center;

			.btn {
				line-height: 52rpx;
				width: 160rpx;
				border-radius: 26rpx;
				border: 2rpx solid $u-border-color;
				font-size: 26rpx;
				text-align: center;
				color: $u-type-info-dark;
			}

			.evaluate {
				color: $u-type-warning-dark;
				border-color: $u-type-warning-dark;
			}
		}
	}

	.carnum {
		font-weight: 600;
		float: right;
	}

	.centre {
		text-align: center;
		margin: 200rpx auto;
		font-size: 32rpx;

		image {
			width: 164rpx;
			height: 164rpx;
			border-radius: 50%;
			margin-bottom: 20rpx;
		}

		.tips {
			font-size: 24rpx;
			color: #999999;
			margin-top: 20rpx;
		}

		.btn {
			margin: 80rpx auto;
			width: 200rpx;
			border-radius: 32rpx;
			line-height: 64rpx;
			color: #ffffff;
			font-size: 26rpx;
			background: linear-gradient(270deg, rgba(249, 116, 90, 1) 0%, rgba(255, 158, 1, 1) 100%);
		}
	}
</style>
<style>
	page {
		background: url(https://hqjsc.hzgx.info/wxapp/static/chuan.gif);
		background-size: 100% 100%;
	}
</style>
