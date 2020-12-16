<template>
	<view style="height: 100%;">
		<!-- <view class="tabs">
			<view class="tabsli" @click="chooseVillage(0)" :style="{backgroundColor:villagebgcolor[0],color:villagecolor[0]}"
			 :key='village1'>河桥村</view>
			<view class="tabsli" @click="chooseVillage(1)" :style="{backgroundColor:villagebgcolor[1],color:villagecolor[1]}"
			 :key='village2'>云浪村</view>
			<view class="tabsli" @click="chooseVillage(2)" :style="{backgroundColor:villagebgcolor[2],color:villagecolor[2]}"
			 style="border: 0;" :key='village3'>泥骆村</view>
		</view> -->
		<view style="height: 100%;" @touchstart="touchStart" @touchmove="touchEnd">
			<!-- @touchstart="test.touchstart" @touchmove="test.touchmove" -->
			<map id="map4select" style="height: 100%;width: 100%;" :latitude="latitude" :longitude="longitude" scale="16"
			 :markers="markers" :show-location="true" @markertap="markertap" subkey="F4TBZ-JOQHS-TWJOQ-6IZUL-3WB2F-UAFWL"
			 @regionchange="dialoghidden">
			</map>
		</view>
		<!-- 弹框 -->
		<view style="width: 240rpx;height: 240rpx;border-radius: 50%;background-color: #fff; padding: 10rpx;z-index: 1;position: fixed;top: 36%;left: 50%;transform: translate(-50%, -50%);"
		 v-if="markerBoxShow&&mkinfo.type!='gtoilet'" @click='toInfo'>
			<view style="overflow: hidden;text-align: center;border-radius: 50%;width: 100%;height: 100%;">
				<image :src="markerImage" style="width: 100%;height: 230rpx;"></image>
			</view>
			<view class="triangle"></view>
		</view>
		<view style="position: fixed;bottom: 20rpx;left: 50%;transform: translateX(-50%);width: 90%;padding: 20rpx;border-radius: 10rpx;background-color: #fff;z-index: 1;"
		 v-if="markerBoxShow">
			<view style="line-height: 60rpx;font-size: 28rpx;width: 80%;">{{mkinfo.name}}</view>
			<view style="line-height: 48rpx;">{{mkinfo.address}}</view>
			<view style="width: 100%;margin-top: 10rpx;">
				<view style="display: inline-block;text-align: center ;white-space: normal;" :style="{'width':ogwidth,}" @click='tozheli'>
					<image src="https://hqjsc.hzgx.info/wxapp/static/gohere.png" mode="widthFix" style="width: 56rpx;"></image>
				</view>
				<view style="display: inline-block; text-align: center;white-space: normal;" :style="{'width':ogwidth,}" @click='toInfo'
				 v-if="mkinfo.type!='gtoilet'">
					<!-- @click='toInfo' -->
					<image src="https://hqjsc.hzgx.info/wxapp/static/description.png" mode="widthFix" style="width: 56rpx;"></image>
				</view>
				<view style="display: inline-block; width: 33.333%;text-align: center;white-space: normal;" v-if="mkinfo.type=='scien'"
				 @click='todaka(mkinfo.userUuid,mkinfo.dakType,mkinfo.longitude,mkinfo.latitude)'>
					<image src="https://hqjsc.hzgx.info/wxapp/static/check.png" mode="widthFix" style="width: 56rpx;"></image>
				</view>
			</view>
			<view style="position: absolute;right: -10rpx;top: 0; width: 80px;height: 30px;line-height: 30px;text-align: center;border-radius: 0 10px 0 8px;background-image: linear-gradient(to top right, #fd62af, #fc4355);color: #fff;"
			 v-if="mkinfo.type=='scien' && mkinfo.dakType=='已打卡'">
				已打卡
			</view>
		</view>
		<!-- <view class="markerBox" v-if="markerBoxShow">
			<view class="item_name">{{mkinfo.name}}</view>
			<view class="item_address" v-if="mkinfo.type=='gtoilet'">{{mkinfo.address}}</view>
			<view style="text-align: center;" v-if="mkinfo.type!='gtoilet'">
				<image :src="mkinfo.picture" style="width: 256rpx;height: 172rpx; border-radius: 4rpx;"></image>
			</view>
			<view style="width: 100%;margin-top: 10rpx;">
				<view style="display: inline-block;text-align: center ;white-space: normal;" :style="{'width':ogwidth,}" @click='tozheli'>
					<image src="https://hqjsc.hzgx.info/wxapp/static/gohere.png" mode="widthFix" style="width: 48rpx;"></image>
				</view>
				<view style="display: inline-block; width: 50%;text-align: center;white-space: normal;" @click='toInfo' v-if="mkinfo.type!='gtoilet'">
					<image src="https://hqjsc.hzgx.info/wxapp/static/description.png" mode="widthFix" style="width: 48rpx;"></image>
				</view>
			</view>
			<view class="triangle"></view>
		</view> -->
		<!-- nav -->
		<view class="nav">
			<view class="navtab" @click="chooseItem(0)" :style="{backgroundColor: navbgc[0], color:navcolor[0]}" :key="menkey4">
				<view style="display: table-cell;vertical-align: middle;">
					<view style="font-family: 'icomoon';display: inline;font-size: 36rpx;"></view>
					<view style="font-size: 12px;">景点</view>
				</view>
			</view>

			<view class="navtab" @click="chooseItem(1)" :style="{backgroundColor: navbgc[1], color:navcolor[1]}" :key="menkey2">
				<view style="display: table-cell;vertical-align: middle;">
					<view style="font-family: 'icomoon';display: inline;font-size: 44rpx;"></view>
					<view style="font-size: 12px;">住宿</view>
				</view>
			</view>
			<view class="navtab" @click="chooseItem(2)" :style="{backgroundColor: navbgc[2], color:navcolor[2]}" :key="menkey3">
				<view style="display: table-cell;vertical-align: middle;">
					<view style="font-family: 'icomoon';display: inline;font-size: 44rpx;"></view>
					<view style="font-size: 12px;">停车</view>
				</view>
			</view>
			<view class="navtab" @click="chooseItem(3)" :style="{backgroundColor: navbgc[3], color:navcolor[3]}" :key="menkey1">
				<view style="display: table-cell;vertical-align: middle;">
					<view style="font-family: 'icomoon';display: inline;font-size: 36rpx;"></view>
					<view style="font-size: 12px;">美食</view>
				</view>
			</view>
			<view class="navtab" @click="chooseItem(4)" :style="{backgroundColor: navbgc[4], color:navcolor[4]}" :key="menkey5">
				<view style="display: table-cell;vertical-align: middle;">
					<view style="font-family: 'icomoon';display: inline;font-size: 36rpx;"></view>
					<view style="font-size: 12px;">公厕</view>
				</view>
			</view>
			<view class="navtab" @click="chooseItem(5)" :style="{backgroundColor: navbgc[5], color:navcolor[5]}" :key="menkey6">
				<view style="display: table-cell;vertical-align: middle;">
					<view style="font-family: 'icomoon';display: inline;font-size: 36rpx;"></view>
					<view style="font-size: 12px;">购物</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import amap from "../../global/amap-wx.js"
	import http from '@/utils/http.js';
	import {
		getHotelist,
		getFoodlist,
		getPicklist,
		getScienlist,
		getGtoiletlist,
		getFoodorList,
		addlist,
	} from '@/api/home/home.js'
	export default {
		data() {
			return {
				info: '',
				ogwidth: '33.333%',
				amapPlugin: null,
				key: '08425307365fa42fb24e97d3c160fffb',
				markers: [],
				poisdatas: [{}, {}, {}],
				title: 'map',
				latitude: 30.107638,
				longitude: 119.247314,
				dakaLon:0,
				dakaLat:0,
				iconpath: 'https://hqjsc.hzgx.info/wxapp/static/marker_s.png',
				iconpath2: 'https://hqjsc.hzgx.info/wxapp/static/marker_h.png',
				iconpath3: 'https://hqjsc.hzgx.info/wxapp/static/marker_p.png',
				iconpath4: 'https://hqjsc.hzgx.info/wxapp/static/marker_y.png',
				iconpath5: 'https://hqjsc.hzgx.info/wxapp/static/marker_t.png',
				iconpath6: 'https://hqjsc.hzgx.info/wxapp/static/marker_g.png',
				village1: 0,
				village2: 0,
				village3: 0,
				villagebgcolor: ['#079fe5', '#fff', '#fff'],
				villagecolor: ['#fff', '#333', '#333'],
				navbgc: ['#079fe5', '#fff', '#fff', '#fff', '#fff', '#fff'],
				navcolor: ['#fff', '#333', '#333', '#333', '#333', '#333'],
				current: 0,
				currentMarker: '',
				markerBoxShow: false,
				mkinfo: {},
				markerImage: ''
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
			let data = {
				// systemUserUuid: '423968DF-A15D-4B5F-9E25-005486496332'
				systemUserUuid: this.$store.state.userId
			};
			getScienlist(data).then(res => {
				if (res.data.code == 200) {
					this.markers = res.data.data
					console.log("后台获取景点全部信息")
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
									type: item.type,
									userUuid: item.userUuid,
									dakType: item.dakType,
									audioUrl: item.audio,
									shopId: item.shopId,
									width: 28, //marker 宽度
									height: 28, //marker 高度
									picture: item.picture,
									introduction: item.introduction,
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
							that.ogwidth = '33.333%';
							console.log(that.ogwidth)
							//成功回调
						},
						fail: function(info) {
							//失败回调
							console.log(info)
						}
					})
				}
			});

		},
		methods: {
			checkAuth() {
				if (this.$store.state.openid == '' || this.$store.state.openid == null) {
					return true;
				} else {
					return false;
				}
			},
			Rad(d){
				return d * Math.PI / 180.0;
			},
			getDistance(lat1,lng1,lat2,lng2){
				 //lat1,lng1 用户当前位置
				 //lat2,lng2 景点位置
				 var radLat1 = this.Rad(lat1);
				 var radLat2 = this.Rad(lat2);
				 var a = radLat1 - radLat2;
				 var b = this.Rad(lng1) - this.Rad(lng2);
				 var s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a/2),2) + Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(b/2),2)));
				 s = s * 6378.137;
				 s = Math.round(s * 10000) / 10000;
				 s = s.toFixed(1);	//保留两位小数
				 console.log('经纬度计算出距离:' + s)
				 return s
			},
			//获取当前经纬度并定位
			todaka(e, b,c,d) {
				if (this.checkAuth()) {
					console.log("未登录");
					uni.redirectTo({
						url: '/pages/index/index'
					});
				} else {
					if (b == '未打卡') {
						var that = this;
						uni.getLocation({
							type: 'gcj02 ', //返回可以用于uni.openLocation的经纬度
							geocode: true,
							success(res) {
								uni.hideLoading();
								that.dakaLat = res.latitude;
								that.dakaLon = res.longitude;
								console.log("获取当前位置经纬度坐标");
								console.log(that.dakaLat);
								console.log(that.dakaLon);
								let distance = that.getDistance(res.latitude,res.longitude,d,c);
								console.log(656);
								console.log(parseFloat(distance));
								if(parseFloat(distance) < 3.0){
									uni.redirectTo({
										url: '/pages/home/clock?ScenienUuid=' + e + '&lon=' + c + '&lat=' + d
									});
								}else{
									uni.showToast({
										title: '您位于此景点3公里以外,请到景点附近打卡!',
										icon: 'none',
										mask: true,
										duration: 3000
									});
								}

							},
							fail: err => {
								uni.hideLoading();
								uni.showToast({
									title: '无法获取定位，请在设置中打开定位后刷新页面！',
									icon: 'none',
									mask: true,
									duration: 3000
								});
							}
						});
					} else {
						uni.showToast({
							title: '该景点已打卡',
							icon: 'none'
						});
						return;
					}
				}
			},


			toInfo() {
				if (this.mkinfo.type == 'pick') {
					uni.navigateTo({
						url: '../parking/parkingInfo?uuid=' + this.mkinfo.carParkUuid
					});
				} else {
					uni.navigateTo({
						url: '../home/markerInfo?name=' + this.mkinfo.name +
							'&address=' + this.mkinfo.address + '&picture=' + this.mkinfo.picture + '&longitude=' +
							this.mkinfo.longitude + '&latitude=' + this.mkinfo.latitude + '&introduction=' + this.mkinfo.introduction +
							'&type=' + this.mkinfo.type + '&scenienUuid=' + this.mkinfo.userUuid + '&audioUrl=' + this.mkinfo.audioUrl
							+ '&shopId=' + this.mkinfo.shopId 
					});
				}
			},
			dialoghidden(e) {
				if (e.type == 'end' && (e.causedBy == 'scale' || e.causedBy == 'drag')) {
					console.log(e)
					var that = this;
					this.mapCtx = wx.createMapContext("map4select");
					this.mapCtx.getCenterLocation({
						type: 'gcj02',
						success: function(res) {
							console.log(res)
							that.latitude = res.latitude;
							that.longitude = res.longitude;
						}
					})
				}

				this.currentMarker = ''
			},
			tozheli() {
				let lon = parseFloat(this.mkinfo.longitude);
				let lat = parseFloat(this.mkinfo.latitude);
				uni.openLocation({
					latitude: lat,
					longitude: lon,
					name: this.mkinfo.name,
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
				for (let i = 0; i < 6; i++) {
					if (i == item) {
						this.navbgc[i] = '#079fe5';
						this.navcolor[i] = '#fff';
						this.menkey1 += 1;
						this.menkey2 += 1;
						this.menkey3 += 1;
						this.menkey4 += 1;
						this.menkey5 += 1;
						this.menkey6 += 1;
					} else {
						this.navbgc[i] = '#fff';
						this.navcolor[i] = '#333';
						this.menkey1 += 1;
						this.menkey2 += 1;
						this.menkey3 += 1;
						this.menkey4 += 1;
						this.menkey5 += 1;
						this.menkey6 += 1;
					}
				};
				//食
				if (item == 3) {
					this.markerBoxShow = false;
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
									console.log(that.iconpath)
									var markers_new = [];
									that.markers.forEach(function(item, index) {
										markers_new.push({
											id: item.id, //marker 序号
											name: item.name,
											address: item.address,
											width: 28, //marker 宽度
											height: 28, //marker 高度
											picture: item.picture,
											userUuid: '',
											shopId: '',
											type: item.type,
											audioUrl: '',
											introduction: item.introduction,
											iconPath: that.iconpath, //marker 图标路径
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
									this.type = "food";
									that.ogwidth = '50%';
									console.log(that.ogwidth)
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
					this.markerBoxShow = false;
					this.markers = [];
					var that = this;
					var amapPluginInstance = new amap.AMapWX({
						key: this.key //该key 是在高德中申请的微信小程序key
					});

					getHotelist().then(res => {
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
											type: item.type,
											shopId: item.shopId,
											audioUrl: '',
											userUuid: '',
											width: 28, //marker 宽度
											height: 28, //marker 高度
											picture: item.picture,
											introduction: item.introduction,
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
									that.ogwidth = '50%';
									console.log(that.A)
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
					this.markerBoxShow = false;
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
											carParkUuid: item.carParkUuid,
											type: item.type,
											userUuid: '',
											width: 28, //marker 宽度
											height: 28, //marker 高度
											picture: item.picture,
											introduction: item.introduction,
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
									that.ogwidth = '50%';
									console.log(that.ogwidth)

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
				if (item == 0) {
					this.markerBoxShow = false;
					this.markers = [];
					var that = this;
					var amapPluginInstance = new amap.AMapWX({
						key: this.key //该key 是在高德中申请的微信小程序key
					});
					let data = {
						// systemUserUuid: '423968DF-A15D-4B5F-9E25-005486496332'
						systemUserUuid: this.$store.state.userId
					};
					getScienlist(data).then(res => {
						if (res.data.code == 200) {
							this.markers = res.data.data
							console.log("后台获取景点全部信息")
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
											type: item.type,
											dakType: item.dakType,
											userUuid: item.userUuid,
											shopId: item.shopId,
											audioUrl: item.audio,
											width: 28, //marker 宽度
											height: 28, //marker 高度
											picture: item.picture,
											introduction: item.introduction,
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
									that.ogwidth = '33.333%';
									console.log(that.ogwidth)
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
				//公厕
				if (item == 4) {
					this.markerBoxShow = false;
					this.markers = [];
					var that = this;
					var amapPluginInstance = new amap.AMapWX({
						key: this.key //该key 是在高德中申请的微信小程序key
					});
					getGtoiletlist().then(res => {
						if (res.data.code == 200) {
							console.log("公厕信息")
							console.log(res)
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
											shopId: '',
											// picture: item.picture,
											type: item.type,
											audioUrl: '',
											width: 28, //marker 宽度
											height: 28, //marker 高度
											iconPath: that.iconpath5, //marker 图标路径
											latitude: item.lat, //marker  纬度
											longitude: item.lon, //marker 经度
											customCallout: {
												anchorX: 0,
												anchorY: 0,
												display: "BYCLICK"
											}
										})
									})
									that.ogwidth = '100%';
									that.markers = markers_new;
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
				//购物
				if (item == 5) {
					this.markerBoxShow = false;
					this.markers = [];
					var that = this;
					var amapPluginInstance = new amap.AMapWX({
						key: this.key //该key 是在高德中申请的微信小程序key
					});
					getFoodorList().then(res => {
						if (res.data.code == 200) {
							this.markers = res.data.data
							amapPluginInstance.getPoiAround({
								success: function(data) {
									//成功回调
									console.log(that.iconpath)
									var markers_new = [];
									that.markers.forEach(function(item, index) {
										markers_new.push({
											id: item.id, //marker 序号
											name: item.name,//后台店名加特产名字拼写
											address: item.address,
											width: 28, //marker 宽度
											height: 28, //marker 高度
											picture: item.picture,
											shopId: item.shopId,
											audioUrl: '',
											type: item.type,
											introduction: item.introduction,
											iconPath: that.iconpath6, //marker 图标路径
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
									this.type = "techan";
									that.ogwidth = '50%';
									console.log(that.ogwidth)
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

			},
			async dogetHotelist() {
				await getHotelist().then(res => {
					if (res.data.code == 200) {
						this.markers = res.data.data
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
				this.markerBoxShow = true;
				console.log(this.markerBoxShow);
				console.log(this.currentMarker);
				console.log(e)
				this.currentMarker = e.detail.markerId
				console.log(this.currentMarker)
				let mk = this.markers.find(x => x.id == this.currentMarker);
				let index = this.markers.findIndex(x => x.id == this.currentMarker);
				if (typeof(mk) != "undefined") {
					console.log("markers" + mk.name + "   " + mk.address);
					this.latitude = mk.latitude;
					this.longitude = mk.longitude;
					this.mkinfo = mk;
					console.log("mkinfo:")
					console.log(this.mkinfo)
					let imglist = []
					if (this.mkinfo.picture) {
						imglist = this.mkinfo.picture.split(',');
					}
					console.log(imglist)
					if (this.current == 3) {
						this.markerImage = http.baseUrl + 'UploadFiles/Food/' + imglist[0]
					} else if (this.current == 5) {
						this.markerImage = http.baseUrl + 'UploadFiles/Food/' + imglist[0]
					} else if (this.current == 1) {
						this.markerImage = http.baseUrl + 'UploadFiles/Hotel/' + imglist[0]
					} else if (this.current == 2) {
						this.markerImage = http.baseUrl + 'UploadFiles/CarPark/' + imglist[0]
					} else if (this.current == 0) {
						this.markerImage = http.baseUrl + 'UploadFiles/Scene/Picture/' + imglist[0]
					} else if (this.current == 4) {
						this.markers.forEach(item => {
							item.width = '28';
							item.height = '28';
						})
						console.log(this.markers)
						this.markers[index].width = '40';
						this.markers[index].height = '40';
						console.log(this.markers)
						// this.setData({
						// 	'this.mkinfo.width': 40,
						// 	'this.mkinfo.height': 40,
						// })
					}
				}
				// for (var i = 0; i < this.markers.length; i++) {
				// 	if (e.detail.markerId == this.markers[i].id) {
				// 		console.log("markers" + this.markers[i].name + "   " + this.markers[i].address);
				// 		console.log(this.markers[i]);
				// 		this.latitude = this.markers[i].latitude;
				// 		this.longitude = this.markers[i].longitude;
				// 		console.log(this.latitude);
				// 		console.log(this.longitude);
				// 		// uni.showToast({
				// 		// 	title: this.markers[i].name,
				// 		// 	mask: false,
				// 		// 	duration: 1500
				// 		// });
				// 	}
				// }


			},
			touchStart(e) {
				// console.log(5555555);
			},
			touchEnd(e) {
				// console.log(666666);
				this.markerBoxShow = false;
			},
		}

	}
</script>


<style>
	page {
		height: 100%;
	}

	.markerBox {
		position: fixed;
		top: 30%;
		left: 50%;
		transform: translate(-50%, -50%);
		z-index: 1;
		width: 400rpx;
		background-color: #fff;
		border: 1rpx solid #ccc;
		border-radius: 10rpx;
		margin-bottom: 30rpx;
		padding: 10rpx;
	}

	.item_name {
		font-size: 28rpx;
		word-break: break-all;
		line-height: 2;
		text-align: center;
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
		border-left: 20rpx solid transparent;
		border-right: 20rpx solid transparent;
		border-top: 20rpx solid #fff;
		transform: translateX(-50%);
		position: absolute;
		bottom: -16rpx;
		left: 49%;
	}

	.nav {
		position: fixed;
		top: 8%;
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
