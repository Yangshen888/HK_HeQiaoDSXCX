<template>
	<view class="u-wrap">
		<view></view>
		<!-- <view class="tabs"> -->
<!-- 		<view class="tabs">
			<view class="tabsli" @click="chooseVillage(0)" :style="{backgroundColor:villagebgcolor[0],color:villagecolor[0]}"
			 :key='village1'>河桥村</view>
			<view class="tabsli" @click="chooseVillage(1)" :style="{backgroundColor:villagebgcolor[1],color:villagecolor[1]}"
			 :key='village2'>云浪村</view>
			<view class="tabsli" @click="chooseVillage(2)" :style="{backgroundColor:villagebgcolor[2],color:villagecolor[2]}"
			 style="border: 0;" :key='village3'>泥骆村</view>
		</view> -->
		<view class="u-menu-wrap">
			<map style="height: 100%;width: 100%;" :latitude="latitude" :longitude="longitude" scale="18" :markers="markers"
			 :show-location="true" @markertap="markertap" subkey="F4TBZ-JOQHS-TWJOQ-6IZUL-3WB2F-UAFWL">
				<block v-for="(item,index) in markers">
					<cover-view slot="callout">
						<cover-view :marker-id="item.id" style="white-space: normal;">
							<cover-view class="markerBox">
								<cover-view class="item_name">{{item.name}}</cover-view>
								<cover-view class="item_address">{{item.address}}</cover-view>
								<cover-view style="width: 100%;height: 80rpx;margin-top: 10rpx;">
									<cover-view style="display: inline-block; width: 50%;text-align: center ;white-space: normal;" bindtap='tozheli(item.lon,item.lat)'>
										<cover-view style="white-space: normal; display: inline-block; width: 40rpx;height: 40rpx;border-radius: 50%;background-color: #0081FF;color: #fff;text-align: center;line-height: 40rpx;">
											<!-- <u-icon name="map-fill"></u-icon> -->
											<cover-view style="font-size: 22rpx;display: inline;line-height: 40rpx;">Go</cover-view>
										</cover-view>
										<cover-view style="white-space: normal;font-size: 16rpx;display: inline-block;margin-top: 4rpx;width: 100%;">到这去</cover-view>
									</cover-view>
									<cover-view style="display: inline-block; width: 50%;text-align: center;white-space: normal;">
										<cover-view style="white-space: normal;display: inline-block; width: 40rpx;height: 40rpx;border-radius: 50%;background-color: #0081FF;color: #fff;text-align: center;line-height: 40rpx;font-size: 28rpx;">
											<!-- <u-icon name="file-text-fill"></u-icon> -->
											<cover-view style="font-size: 20rpx;display: inline;line-height: 40rpx;">Des</cover-view>
										</cover-view>
										<cover-view style="white-space: normal;font-size: 16rpx;display: inline-block;margin-top: 4rpx;width: 100%;">详情</cover-view>
									</cover-view>
								</cover-view>
								<cover-view class="triangle"></cover-view>
							</cover-view>
						</cover-view>
					</cover-view>
				</block>
			</map>
		</view>
		<!-- nav -->
		<view class="nav">
			<view class="navtab" @click="chooseItem(0)" :style="{backgroundColor: navbgc[0], color:navcolor[0]}" :key="menkey1">
				<view style="display: table-cell;vertical-align: middle;">
					<view style="font-family: 'icomoon';display: inline;font-size: 36rpx;"></view>
					<view style="font-size: 12px;">美食</view>
				</view>
			</view>
			<view class="navtab" @click="chooseItem(1)" :style="{backgroundColor: navbgc[1], color:navcolor[1]}" :key="menkey2">
				<view style="display: table-cell;vertical-align: middle;">
					<view style="font-family: 'icomoon';display: inline;font-size: 36rpx;"></view>
					<view style="font-size: 12px;">住宿</view>
				</view>
			</view>
			<view class="navtab" @click="chooseItem(2)" :style="{backgroundColor: navbgc[2], color:navcolor[2]}" :key="menkey3">
				<view style="display: table-cell;vertical-align: middle;">
					<view style="font-family: 'icomoon';display: inline;font-size: 36rpx;"></view>
					<view style="font-size: 12px;">停车</view>
				</view>
			</view>
			<view class="navtab" @click="chooseItem(3)" :style="{backgroundColor: navbgc[3], color:navcolor[3]}" :key="menkey4">
				<view style="display: table-cell;vertical-align: middle;">
					<view style="font-family: 'icomoon';display: inline;font-size: 36rpx;"></view>
					<view style="font-size: 12px;">景点</view>
				</view>
			</view>
		</view>
<!-- 		<view style="padding: 20rpx 0;">
			<p style="font-family: 华文行楷;font-size:50rpx;text-align: center;">
				河桥镇
				<br />
				<span style="font-size:24rpx;font-family: 华文黑体;">HeQiaoZhen</span>
			</p>
		</view> -->
	</view>
</template>

<script>
	import amap from "../../global/amap-wx.js"
	import {
		getHotelist,
		getFoodlist,
		getPicklist,
		getScienlist,
	} from '@/api/home/home.js'
	export default {
		data() {
			return {
				type:"",
				amapPlugin: null,
				key: '08425307365fa42fb24e97d3c160fffb',
				markers: [],
				poisdatas: [{}, {}, {}],
				title: 'map',
				latitude: 30.107638,
				longitude: 119.247314,
				iconpath: 'https://hqjsc.hzgx.info/wxapp/static/marker_s.png',
				iconpath2: 'https://hqjsc.hzgx.info/wxapp/static/marker_z.png',
				iconpath3: 'https://hqjsc.hzgx.info/wxapp/static/marker_x.png',
				iconpath4: 'https://hqjsc.hzgx.info/wxapp/static/marker_y.png',
				village1: 0,
				village2: 0,
				village3: 0,
				villagebgcolor: ['#079fe5', '#fff', '#fff'],
				villagecolor: ['#fff', '#333', '#333'],
				navbgc: ['#079fe5', '#fff', '#fff', '#fff', '#fff'],
				navcolor: ['#fff', '#333', '#333', '#333', '#333'],
				current: 0
			}
		},
		onLoad(opt) {
			this.latitude = opt.latitude;
			this.longitude = opt.longitude;
			if (this.longitude == "119.240659") {

			} else if (this.longitude == "119.252617") {
				this.villagebgcolor = ['#fff', '#079fe5', '#fff'];
				this.villagecolor = ['#333', '#fff', '#333']
			} else if (this.longitude == "119.250369") {
				this.villagebgcolor = ['#fff', '#fff', '#079fe5'];
				this.villagecolor = ['#333', '#333', '#fff']
			}
			//this.dogetHotelist();
			var that = this;
			var amapPluginInstance = new amap.AMapWX({
				key: this.key //该key 是在高德中申请的微信小程序key
			});
			getFoodlist().then(res => {
				if (res.data.code == 200) {
					this.markers = res.data.data
					console.log(123)
					console.log(this.markers)
					amapPluginInstance.getPoiAround({
						success: function(data) {
							//成功回调
							// that.markers = data.markers;
							// that.poisdatas = data.poisData;
							console.log(that.iconpath)
							var markers_new = [];
							that.markers.forEach(function(item, index) {
								markers_new.push({
									id: item.id, //marker 序号
									name: item.name,
									address: item.address,
									width: 28, //marker 宽度
									height: 28, //marker 高度
									iconPath: that.iconpath, //marker 图标路径
									latitude: item.lat, //marker  纬度
									longitude: item.lon, //marker 经度
									//自定义标记点上方的气泡窗口
									// callout: {
									// 	padding: 2, //callout 文本边缘留白
									// 	lineHeight:2,
									// 	fontSize: 14, //callout  文字大小
									// 	backgroundColor: 'pink', //callout 背景颜色
									// 	color: '#079fe5', //callout 文字颜色
									// 	borderRadius: 5, //边框圆角
									// 	display: 'BYCLICK', //callout 'BYCLICK':点击显示; 'ALWAYS':常显
									// 	content: item.name + '\n' + item.address+'\n'+'<u-icon name="icon-home"></u-icon>' //地理位置名称
									// }
									customCallout: {
										anchorX: 0,
										anchorY: 0,
										display: "BYCLICK"
									}
								})
							})
							that.markers = markers_new;
							console.log('这里')
							console.log(that.markers)
							//console.log("data", JSON.stringify(that.poisdatas));
							//成功回调
						},
						fail: function(info) {
							//失败回调
							console.log(info)
						}
					})
				}
			})

		},
		methods: {
			tozheli(e, b) {
				console.log(123)
				console.log("获取当前坐标经纬度")
				console.log(e)
				console.log(b)
				let lon = parseFloat(e);
				let lat = parseFloat(b);
				uni.openLocation({
					latitude: lat,
					longitude: lon,
					name: this.address,
					success: function() {
						console.log('success');
					},
					fail: function(err) {
						console.log(err);
					}
				});
				// (item.lon,item.lat)
			},
			chooseItem(item) {
				// let that=this;
				this.current = item;
				for (let i = 0; i < 4; i++) {
					if (i == item) {
						this.navbgc[i] = '#079fe5';
						this.navcolor[i] = '#fff';
						this.menkey1 += 1;
						this.menkey2 += 1;
						this.menkey3 += 1;
						this.menkey4 += 1;
						// console.log(this.navbgc)
						// console.log(this.navcolor)
					} else {
						this.navbgc[i] = '#fff';
						this.navcolor[i] = '#333';
						this.menkey1 += 1;
						this.menkey2 += 1;
						this.menkey3 += 1;
						this.menkey4 += 1;
						// console.log(this.navbgc)
						// console.log(this.navcolor)
					}
				};
				//食
				if (item == 0) {
					this.markers = [];
					var that = this;
					var amapPluginInstance = new amap.AMapWX({
						key: this.key //该key 是在高德中申请的微信小程序key
					});
					getFoodlist().then(res => {
						if (res.data.code == 200) {
							this.markers = res.data.data
							amapPluginInstance.getPoiAround({
								success: function(data) {
									//成功回调
									// that.markers = data.markers;
									// that.poisdatas = data.poisData;
									console.log(that.iconpath)
									var markers_new = [];
									that.markers.forEach(function(item, index) {
										markers_new.push({
											id: item.id, //marker 序号
											name: item.name,
											address: item.address,
											width: 28, //marker 宽度
											height: 28, //marker 高度
											iconPath: that.iconpath, //marker 图标路径
											latitude: item.lat, //marker  纬度
											longitude: item.lon, //marker 经度
											//自定义标记点上方的气泡窗口
											// callout: {
											// 	padding: 2, //callout 文本边缘留白
											// 	lineHeight:2,
											// 	fontSize: 14, //callout  文字大小
											// 	backgroundColor: 'pink', //callout 背景颜色
											// 	color: '#079fe5', //callout 文字颜色
											// 	borderRadius: 5, //边框圆角
											// 	display: 'BYCLICK', //callout 'BYCLICK':点击显示; 'ALWAYS':常显
											// 	content: item.name + '\n' + item.address+'\n'+'<u-icon name="icon-home"></u-icon>' //地理位置名称
											// }
											customCallout: {
												anchorX: 0,
												anchorY: 0,
												display: "BYCLICK"
											}
										})
									})
									that.markers = markers_new;
									this.type = "food";
									//console.log("data", JSON.stringify(that.poisdatas));
									//成功回调
								},
								fail: function(info) {
									//失败回调
									console.log(info)
								}
							})
						}
					})
				};
				//住
				if (item == 1) {
					this.markers = [];
					var that = this;
					var amapPluginInstance = new amap.AMapWX({
						key: this.key //该key 是在高德中申请的微信小程序key
					});

					getHotelist().then(res => {
						if (res.data.code == 200) {
							this.markers = res.data.data
							console.log(123)
							console.log(this.markers)
							amapPluginInstance.getPoiAround({
								success: function(data) {
									//成功回调
									var markers_new = [];
									that.markers.forEach(function(item, index) {
										markers_new.push({
											id: item.id, //marker 序号
											name: item.name,
											address: item.address,
											width: 28, //marker 宽度
											height: 28, //marker 高度
											iconPath: that.iconpath2, //marker 图标路径
											latitude: item.lat, //marker  纬度
											longitude: item.lon, //marker 经度
											customCallout: {
												anchorX: 0,
												anchorY: 0,
												display: "BYCLICK"
											}
										})
									})
									that.markers = markers_new;
									this.type = "hotel";
									//成功回调
								},
								fail: function(info) {
									//失败回调
									console.log(info)
								}
							})
						}
					})
				};
				//行
				if (item == 2) {
					this.markers = [];
					var that = this;
					var amapPluginInstance = new amap.AMapWX({
						key: this.key //该key 是在高德中申请的微信小程序key
					});

					getPicklist().then(res => {
						if (res.data.code == 200) {
							this.markers = res.data.data
							amapPluginInstance.getPoiAround({
								success: function(data) {
									//成功回调
									var markers_new = [];
									that.markers.forEach(function(item, index) {
										markers_new.push({
											id: item.id, //marker 序号
											name: item.name,
											address: item.address,
											width: 28, //marker 宽度
											height: 28, //marker 高度
											iconPath: that.iconpath3, //marker 图标路径
											latitude: item.lat.toString(), //marker  纬度
											longitude: item.lon.toString(), //marker 经度
											customCallout: {
												anchorX: 0,
												anchorY: 0,
												display: "BYCLICK"
											}
										})
									})
									that.markers = markers_new;
									this.type = "pick";
									//成功回调
								},
								fail: function(info) {
									//失败回调
									console.log(info)
								}
							})
						}
					})
				};
				//游
				if (item == 3) {
					this.markers = [];
					var that = this;
					var amapPluginInstance = new amap.AMapWX({
						key: this.key //该key 是在高德中申请的微信小程序key
					});
					getScienlist().then(res => {
						if (res.data.code == 200) {
							this.markers = res.data.data
							console.log(123)
							console.log(this.markers)
							amapPluginInstance.getPoiAround({
								success: function(data) {
									//成功回调
									var markers_new = [];
									that.markers.forEach(function(item, index) {
										markers_new.push({
											id: item.id, //marker 序号
											name: item.name,
											address: item.address,
											width: 28, //marker 宽度
											height: 28, //marker 高度
											iconPath: that.iconpath4, //marker 图标路径
											latitude: item.lat, //marker  纬度
											longitude: item.lon, //marker 经度
											customCallout: {
												anchorX: 0,
												anchorY: 0,
												display: "BYCLICK"
											}
										})
									})
									that.markers = markers_new;
									this.type = "scien";
									//成功回调
								},
								fail: function(info) {
									//失败回调
									console.log(info)
								}
							})
						}
					})
				}
			},
			async dogetHotelist() {
				await getHotelist().then(res => {
					if (res.data.code == 200) {
						this.markers = res.data.data
						console.log(res.data.data)
					}
				})
			},
			chooseVillage(item) {
				console.log('123OK')
				console.log(this.villagecolor)
				for (let i = 0; i < 3; i++) {
					if (i == item) {
						this.villagebgcolor[i] = '#079fe5';
						this.villagecolor[i] = '#fff';
						this.village1 += 1;
						this.village2 += 1;
						this.village3 += 1;
					} else {
						this.villagebgcolor[i] = '#fff';
						this.villagecolor[i] = '#333';
						this.village1 += 1;
						this.village2 += 1;
						this.village3 += 1;
					}
				}
				if (item == 0) {
					this.latitude = 30.101874
					this.longitude = 119.240659
				} else if (item == 1) {
					this.latitude = 30.118028
					this.longitude = 119.252617
				} else {
					this.latitude = 30.096852
					this.longitude = 119.250369
				}
			},
			//得到点击的marker的id，遍历markers数组，判断有没有相等的id
			//如果有的就能从this.poisdatas[i].address得到坐标位置（没有就提醒下）
			markertap: function(e) {
				for (var i = 0; i < this.markers.length; i++) {
					if (JSON.stringify(e).substring(18, 20) == this.markers[i].id) {
						console.log("markers" + this.markers[i].name + "   " + this.markers[i].address);
						uni.showToast({
							title: this.markers[i].name,
							mask: false,
							duration: 1500
						});
					}
				}

			}
		}

	}
</script>

<style>
	
	.markerBox {
		width: 400rpx;
		background-color: #fff;
		border: 1rpx solid #ccc;
		border-radius: 10rpx;
		margin-bottom: 30rpx;
		position: relative;
		padding: 10rpx;
	}

	.item_name {
		font-size: 28rpx;
		word-break: break-all;
		line-height: 2;
	}

	.item_address {
		font-size: 24rpx;
		word-break: break-all;
		width: 100%;
		line-height: 1.5;
		text-align: justify;
	}

	/* 三角 */
	.triangle {
		width: 0;
		height: 0;
		border-left: 14rpx solid transparent;
		border-right: 14rpx solid transparent;
		border-top: 20rpx solid #fff;
		transform: translateX(-50%);
		position: absolute;
		bottom: -16rpx;
		left: 49%;
	}

	.tabs {
		width: 100%;
		height: 50px;
		line-height: 50px;
	}

	.tabsli {
		float: left;
		width: 33.33%;
		border-right: 1rpx solid #ccc;
		text-align: center;
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

	.nav {
		position: fixed;
		top: 80px;
		left: 10px;
		width: 50px;
		height: auto;
		text-align: center;
		border-radius: 10rpx;
		overflow: hidden;
		z-index: 1;
	}
	/* .nav {
	                position: fixed;
	                top: 160px;
	                left: 10px;
	                width: 50px;
	                height: auto;
	                text-align: center;
	                border-radius: 10rpx;
	                overflow: hidden;
	                z-index: 1;
	        } */

	.navtab {
		width: 100%;
		height: 50px;
		display: table;
		background-color: #fff;
		/* vertical-align: middle; */
		/* line-height: 50px; */
		/* color: #fff; */
	}

	.navtab_curr {
		background-color: #079fe5;
	}

	.navtab u-icon {
		font-size: 22px;
	}
	@font-face {
	                font-family: 'icomoon';
	                src: url('../../static/fonts/icomoon.eot?1xlk7w');
	                src: url('../../static/fonts/icomoon.eot?1xlk7w#iefix') format('embedded-opentype'),
	                        url('../../static/fonts/icomoon.ttf?1xlk7w') format('truetype'),
	                        url('../../static/fonts/icomoon.woff?1xlk7w') format('woff'),
	                        url('../../static/fonts/icomoon.svg?1xlk7w#icomoon') format('svg');
	                font-weight: normal;
	                font-style: normal;
	                font-display: block;
	        }
</style>
