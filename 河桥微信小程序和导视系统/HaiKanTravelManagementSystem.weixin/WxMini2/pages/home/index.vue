<template>
	<view style="margin-bottom: 40rpx;">
		<view class="main" style="padding: 0 30rpx;padding-top: 152rpx;padding-bottom: 10rpx;border-radius: 0 0 20px 20px; background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/bgmain.png);background-size: 100%;">
			<!-- 页面顶部 -->
			<view class="pageTop" style="height: 92rpx;line-height: 92rpx;">
				<view style="width: 50%;color: #333;float: left;font-weight: 600;">
					<image :src="weathericonurl" style="width: 40px;height: 40px; background-color: transparent;float: left;margin-top: 10rpx;"
					 mode="widthFix"></image>
					<view style="float: left;margin-left: 30rpx;">
						<view style="float: left;">{{ type }}</view>
						<view style="float: right;margin-left: 20rpx;">{{ wendu }}</view>
					</view>
				</view>
				<uni-search-bar :radius="100" @confirm="search" style="margin-top: 4rpx;"></uni-search-bar>
			</view>
			<!-- 页面主体 -->
			<view class="content" style="clear: both;">
				<!-- 轮播 -->
				<view style="position: relative;margin-bottom: 20rpx;">
					<u-swiper :list="bannerlist" height="300"></u-swiper>
				</view>
				<!-- 菜单栏 -->
				<view style="">
					<u-grid :col="4" :border="false">
						<u-grid-item @click="toESES">
							<image src="https://hqjsc.hzgx.info/wxapp/static/images/fish.png" style="width: 150rpx;height: 150rpx;padding-top: 4rpx;"></image>
							<view style="font-size: 24rpx;font-weight: 600;margin-top: -4rpx;">食</view>
						</u-grid-item>
						<u-grid-item @click="toLive">
							<image src="https://hqjsc.hzgx.info/wxapp/static/images/6.png" style="width: 150rpx;height: 150rpx;"></image>
							<view style="font-size: 24rpx;font-weight: 600;">住</view>
						</u-grid-item>
						<!-- <u-grid-item @click="toTraveltips">
							<image src="https://hqjsc.hzgx.info/wxapp/static/images/glzn.png" style="width: 150rpx;height: 150rpx;"></image>
							<view style="font-size: 24rpx;font-weight: 600;">攻略指南</view>
						</u-grid-item> -->
						<u-grid-item @click="toParking">
							<image src="https://hqjsc.hzgx.info/wxapp/static/images/5.png" style="width: 150rpx;height: 150rpx;"></image>
							<view style="font-size: 24rpx;font-weight: 600;">行</view>
						</u-grid-item>
						<!-- <u-grid-item @click="toGuide">地图 -->
						<u-grid-item @click="toTour">
							<image src="https://hqjsc.hzgx.info/wxapp/static/images/8.png" style="width: 150rpx;height: 150rpx;"></image>
							<view style="font-size: 24rpx;font-weight: 600;">游</view>
						</u-grid-item>
					</u-grid>
					<!-- <u-grid :col="4" :border="false">
						<u-grid-item @click="toSceneSpot">
							<image src="https://hqjsc.hzgx.info/wxapp/static/images/dtjs.png" style="width: 150rpx;height: 150rpx;"></image>
							<view style="font-size: 24rpx;font-weight: 600;">答题竞赛</view>
						</u-grid-item>
						
						<u-grid-item @click="toKefu">
							<image src="https://hqjsc.hzgx.info/wxapp/static/images/4.png" style="width: 150rpx;height: 150rpx;"></image>
							<view style="font-size: 24rpx;font-weight: 600;">留言建议</view>
						</u-grid-item>
						<u-grid-item @click="toGerenInfo">
							<image src="https://hqjsc.hzgx.info/wxapp/static/images/3.png" style="width: 150rpx;height: 150rpx;"></image>
							<view style="font-size: 24rpx;font-weight: 600;">个人中心</view>
						</u-grid-item>
					</u-grid> -->
				</view>
				<!-- 轮播视频 -->
				<!-- <swiper style="height: 225px;">
					<swiper-item>
						<video :controls="true" :enable-auto-rotation="true" :src="psrc" style="width: 100%;"></video>
					</swiper-item>
					<swiper-item>
						<video :controls="true" :enable-auto-rotation="true" :src="psrc" style="width: 100%;"></video>
					</swiper-item>
				</swiper> -->
			</view>
		</view>
		<!-- 推荐模块 -->
		<view class="suggest" style="padding: 0 30rpx;margin-top: 20rpx;">
			<view class="sug_title" style="font-weight: 600;line-height: 2;font-size: 32rpx;font-family: '华文仿宋';">发现河桥</view>
			<view class="sug_con" style="overflow: auto;">
				<!-- 精彩推荐 -->
				<view class="sur_item" v-for="(item, index) in rList" :key="index" @click="toarticledefault(item.type, item.uuid)">
					<view class="item_top" style="line-height: 2;">
						<view class="item_title1" style="font-size:30rpx;font-family: '华文仿宋';">{{ item.title }}</view>
						<view class="splendidBox" style="font-family: '华文仿宋';">精彩推荐</view>
					</view>
					<view class="item_con">
						<video v-if="item.type == 'video'" :src="item.vurl" :controls="true" style="width: 100%; border-radius: 10rpx;"
						 :enable-auto-rotation="true" @click="toarticledefault(item.type, item.uuid)"></video>
						<u-swiper v-if="item.type == 'simg' || item.type == 'aimg'" :list="item.purl" height="500" @click="toarticledefault(item.type, item.uuid)"></u-swiper>
					</view>
				</view>
				<!-- 普通文章 -->
				<!-- <u-waterfall v-model="flowList">
					<template v-slot:left="{leftList}">
						<view v-for="(item, index) in leftList" :key="index"> -->
							<!-- 这里编写您的内容，item为您传递给v-model的数组元素 -->
						<!-- </view>
					</template>
					<template v-slot:right="{rightList}">
						<view v-for="(item, index) in rightList" :key="index"> -->
							<!-- 这里编写您的内容，item为您传递给v-model的数组元素 -->
						<!-- </view>
					</template>
				</u-waterfall> -->
				<view class="waterfall">
					<view class="left_waterfall">
						<view v-for="(item, index) in oddlist" class="sur_item_waterfall" @click="toarticledefault(item.type, item.uuid)">
							<view class="item_con">
								<u-swiper v-if="item.type == 'simg' || item.type == 'aimg'" :list="item.purl" @click="toarticledefault(item.type, item.uuid)"></u-swiper>
							</view>
							<view style="overflow: hidden;">
								<view class="item_title2" style="font-size:0.8em;font-family: '华文仿宋';width: 100%;word-break: break-all;font-size: 600;">{{item.title}}</view>
								<view class="item_desc" style="text-indent: 2em; float: left; word-break: break-all;font-size: 0.8em;width: 100%;">{{item.content}}...</view>
							</view>
						</view>
					</view>
					<view class="right_waterfall">
						<view v-for="(item, index) in evlist" class="sur_item_waterfall" @click="toarticledefault(item.type, item.uuid)">
							<view class="item_con">
								<u-swiper v-if="item.type == 'simg' || item.type == 'aimg'" :list="item.purl" @click="toarticledefault(item.type, item.uuid)"></u-swiper>
							</view>
							<view style="overflow: hidden;">
								<view class="item_title2" style="font-size:0.8em;font-family: '华文仿宋';width: 100%;word-break: break-all;font-size: 600;">{{item.title}}</view>
								<view class="item_desc" style="text-indent: 2em; float: left; word-break: break-all;font-size: 0.8em;width: 100%;">{{item.content}}...</view>
							</view>
						</view>
					</view>
				</view>
			</view>
			<u-loadmore :status="status" color="#ccc" />
		</view>
		<!-- 底部tabs -->
		<view class="bottomTab" style="width: 100%;position: fixed;bottom: 0;background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/tabbg.png); z-index: 99;background-size: 100%;">
			<view class="tabItem">
				<!-- <image style="width: 100%;height: 30px;"></image> -->
				<u-icon name="home" color="#079fe5"></u-icon>
				<view>主页</view>
			</view>
			<view class="tabItem" @click="tohandsmap">
				<!-- <image style="width: 100%;height: 30px;"></image> -->
				<u-icon name="map"></u-icon>
				<view>虚拟导览</view>
			</view>
			<view class="tabItem" @click="toGerenInfo">
				<!-- <image style="width: 100%;height: 30px;"></image> -->
				<u-icon name="account"></u-icon>
				<view>我的</view>
			</view>
		</view>
	</view>
</template>

<script>
	import uniSearchBar from '@/components/uni-search-bar/uni-search-bar.vue'
	import http from '@/utils/http.js';
	import {
		getRecommend,
		getDiscovery
	} from '@/api/home/home.js';
	export default {
		components: {
			uniSearchBar
		},
		data() {
			return {
				status: 'loadmore',
				menushow: false,
				bannerlist: [{
						image: 'https://hqjsc.hzgx.info/wxapp/static/images/banner/banner1.jpg'
					},
					{
						image: 'https://hqjsc.hzgx.info/wxapp/static/images/banner/banner2.jpg'
					},
					{
						image: 'https://hqjsc.hzgx.info/wxapp/static/images/banner/banner3.jpg'
					},
					{
						image: 'https://hqjsc.hzgx.info/wxapp/static/images/banner/banner4.jpg'
					}
				],
				type: '',
				wendu: '',
				latitude: '',
				longitude: '',
				weatherurl: '',
				weatherlis: [{
					name: '阴',
					value: 'overcast.png'
				}, {
					name: '多云',
					value: 'cludy.png'
				}, {
					name: '大雨',
					value: 'heavyrain.png'
				}, {
					name: '小雨',
					value: 'lightrain.png'
				}, {
					name: '冰雹',
					value: 'hail.png'
				}, {
					name: '雪',
					value: 'snow.png'
				}, {
					name: '晴',
					value: 'sunny.png'
				}, {
					name: '雷阵雨',
					value: 'thundershower.png'
				}],
				weathericonurl: '',
				query: {
					totalCount: 0,
					pageSize: 10,
					currentPage: 1,
					kw: '',
					sort: [{
						direct: 'DESC',
						field: 'ID'
					}]
				},
				rList: [],
				dList: [],
				evlist: [], //偶
				oddlist: [], //奇
				psrc: http.baseUrl + 'UploadFiles/PromotionalVideo/Video/' + '柳溪江畔的千年古镇河桥.mp4'
			};
		},
		onLoad() {
			this.getLocation();
			this.doGetweekmenu();
			this.loadInformation();
			// this.query.currentPage=0;
			// this.onReachBottom();
		},
		methods: {
			search(e) {
				const text = e.value;
				if (text != "") {
					uni.navigateTo({
						url: '/pages/home/searchList?text=' + text
					})
				}
			},
			toarticledefault(type, uuid) {
				if (type == 'video') {
					return;
				}
				uni.navigateTo({
					url: '/pages/home/articledefault?uuid=' + uuid + '&type=' + type
				});
			},
			tohandsmap() {
				uni.navigateTo({
					url: '/pages/home/handsmap'
				});
			},
			onReachBottom() {
				this.status = 'loading';
				this.query.currentPage++;
				getDiscovery(this.query).then(res => {
					console.log(111111);
					console.log(res);
					let data = res.data.data;
					if (data.length > 0) {
						for (let i = 0; i < data.length; i++) {
							if (data[i].type == 'video') {
								continue;
							}
							let d = {
								uuid: data[i].uuid,
								type: data[i].type,
								time: data[i].time,
								title: data[i].title,
								content: data[i].content,
								purl: [],
								vurl: ''
							};
							if (data[i].type == 'simg') {
								let imgs = data[i].url.split(',');
								imgs.forEach(function(element) {
									console.log(element);
									element = http.baseUrl + 'UploadFiles/Scene/Picture/' + element;
									d.purl.push({
										image: element
									});
								});
								console.log(imgs);
								//d.purl = imgs;
							} else if (data[i].type = 'aimg') {
								let imgs = data[i].url.split(',');
								imgs.forEach(function(element) {
									console.log(element);
									element = http.baseUrl + 'UploadFiles/Article/' + element;
									d.purl.push({
										image: element
									});
								});
								console.log(imgs);
								//d.purl = imgs;
							}
							if(i%2==0){
								this.oddlist.push(d);
							}else{
								this.evlist.push(d);
							}
							// this.dList.push(d);
						}
						this.status = 'loadmore';
					} else {
						this.query.currentPage--;
						this.status = 'nomore';
					}
				});
			},
			loadweather() {
				console.log(123);
				console.log(this.type);
				var len = this.weatherlis.length;
				console.log(len);
				for (var i = 0; i < len; i++) {
					console.log(this.weatherlis[i].name);
					if (this.weatherlis[i].name == this.type) {
						console.log(this.type);
						this.weathericonurl = 'https://hqjsc.hzgx.info/wxapp/static/images/weather/' + this.weatherlis[i].value;
						console.log(this.weathericonurl);
						return;
					}
				}
			},
			loadInformation() {
				getRecommend(this.query).then(res => {
					console.log(111111);
					console.log(res);
					let data = res.data.data;
					if (data.length > 0) {
						for (let i = 0; i < data.length; i++) {
							let r = {
								uuid: data[i].uuid,
								type: data[i].type,
								time: data[i].time,
								title: data[i].title,
								purl: [],
								vurl: ''
							};
							if (data[i].type == 'simg') {
								let imgs = data[i].url.split(',');
								imgs.forEach(function(element) {
									element = http.baseUrl + 'UploadFiles/Scene/Picture/' + element;
									console.log(element);
									r.purl.push({
										image: element
									});
								});
								console.log(r.purl);
								//r.purl = imgs;
							} else if (data[i].type == 'video') {
								console.log(23569999);
								console.log(data[i].url.split(',')[0]);
								r.vurl = http.baseUrl + 'UploadFiles/PromotionalVideo/Video/' + data[i].url.split(',')[0];
							} else if ((data[i].type = 'aimg')) {
								let imgs = data[i].url.split(',');
								imgs.forEach(function(element) {
									element = http.baseUrl + 'UploadFiles/Article/' + element;
									console.log(element);
									r.purl.push({
										image: element
									});
								});
								console.log(r.purl);
								//r.purl = imgs;
							}
							
							this.rList.push(r);
						}

					}
				});
				getDiscovery(this.query).then(res => {
					console.log(111111)
					console.log(res);
					let data = res.data.data;
					if (data.length > 0) {
						for (let i = 0; i < data.length; i++) {
							if (data[i].type == 'video') {
								continue;
							}
							let d = {
								uuid: data[i].uuid,
								type: data[i].type,
								time: data[i].time,
								title: data[i].title,
								content: data[i].content,
								purl: [],
								vurl: "",
							}
							if (data[i].type == "simg") {
								let imgs = data[i].url.split(',');
								imgs.forEach(function(element) {
									console.log(element);
									element = http.baseUrl + 'UploadFiles/Scene/Picture/' + element;
									d.purl.push({
										image: element
									})
								});
								console.log(d.purl);
								//d.purl = imgs;
							} else if (data[i].type = "aimg") {
								let imgs = data[i].url.split(',');
								imgs.forEach(function(element) {
									console.log(element);
									element = http.baseUrl + 'UploadFiles/Article/' + element;
									d.purl.push({
										image: element
									})
								});
								console.log(d.purl);
								//d.purl = imgs;
							}
							if(i%2==0){
								this.oddlist.push(d);
							}else{
								this.evlist.push(d);
							}
							// this.dList.push(d);
						}
					}
				})
			},
			tosuggestInfo() {
				uni.navigateTo({
					url: '/pages/home/suggestInfo'
				})
			},
			toIntroduce() {
				uni.navigateTo({
					url: '../introduce/index'
				});
			},

			toGuide() {
				uni.navigateTo({
					url: '../guide/guide'
				});
			},
			toIntelligentGuide() {
				uni.navigateTo({
					url: '../intelligentguide/index'
				});
			},
			toLive(){
				uni.navigateTo({
					url: '/pages/home/live'
				});
			},
			toTour(){
				uni.navigateTo({
					url: '/pages/home/tour'
				});
			},
			toTraveltips() {
				uni.navigateTo({
					url: '../traveltips/index'
				});
			},

			toESES() {
				uni.navigateTo({
					url: '/packageA/ESEA/ESEA'
				})
			},
			toGerenInfo() {
				if (this.checkAuth()) {
					console.log("登陆失败");
					uni.redirectTo({
						url: '/pages/index/index'
					});
				} else {
					console.log("已经登录成功");
					uni.navigateTo({
						url: '/pages/gereninfo/gereninfo'
					})
				}
				// appid: 'wx71a9025f448231c3',
				// secret: '0e85aa98e4854fc34aee28924c8937e8'

			},
			doGetweekmenu() {
				if (this.menushow == false) {
					this.menushow = true;
				} else {
					this.menushow = true;
				}
			},
			toParking() {
				uni.navigateTo({
					url: '/pages/parking/parkingLot'
				});
			},
			checkAuth() {
				console.log(11111);
				console.log(this.$store.state);
				if (this.$store.state.openid == '' || this.$store.state.openid == null) {
					return true;
				} else {
					return false;
				}
			},
			onPullDownRefresh: function() {
				var that = this;
				wx.showNavigationBarLoading(); //在标题栏中显示加载
				//模拟加载
				setTimeout(function() {
					// complete
					wx.hideNavigationBarLoading(); //完成停止加载
					wx.stopPullDownRefresh(); //停止下拉刷新
					that.getLocation();
				}, 1500);
			},
			// 获取当前位置
			getLocation() {
				var that = this;
				uni.getLocation({
					type: 'gcj02 ', //返回可以用于uni.openLocation的经纬度
					geocode: true,
					success(res) {
						uni.hideLoading();
						that.latitude = res.latitude;
						that.longitude = res.longitude;
						uni.request({
							url: 'https://apis.map.qq.com/ws/geocoder/v1/?location=' + that.latitude + ',' + that.longitude +
								'&key=VEEBZ-HJL34-U3LUY-XUBOX-NSUF7-E4BRF',
							data: {},
							success: res => {
								console.log(res);
								if (res.data.result.address_component.district != '') {
									that.weatherurl = 'https://www.amap.com/service/weather/?adcode=' + res.data.result.ad_info.adcode;
									// that.weatherurl = 'https://www.amap.com/service/weather/?adcode=330112';
									uni.request({
										url: that.weatherurl,
										data: {},
										success: res => {
											console.log(res);
											console.log(res.data.data.data[0]);
											that.type = res.data.data.data[0].live.weather_name;
											that.wendu = res.data.data.data[0].live.temperature + '°C';
											console.log(that.type);
											that.loadweather();
										}
									});
								}
							}
						});
					},
					fail: err => {
						uni.hideLoading();
						uni.showToast({
							title: '无法获取天气信息，请在设置中打开定位后下拉刷新！',
							icon: 'none',
							mask: true,
							duration: 3000
						});
					}
				});
			}
		}
	};
</script>

<style>
	/* @import 'uview-ui/index.scss'; */
	page {
		padding-bottom: 64px;
	}

	.suggest {
		width: 100%;
	}

	.sur_item {
		width: 98%;
		padding: 5px;
		border-radius: 5px;
		box-shadow: 0 0 2px rgba(0, 0, 0, 0.2);
		margin: 20rpx auto;
	}

	/* .waterfall{
		column-count: 2;
		column-gap: 1em;
	} */
	.sur_item_waterfall {

		/* 两列布局（从上到下）
		padding: 1em;
		margin: 0 0 1em 0;
		break-inside: avoid;
		box-shadow: 0 0 2px rgba(0, 0, 0, 0.2); */

		/* 浮动布局 */
		display: inline-block;
		padding: 6px;
		border-radius: 5px;
		box-shadow: 0 0 2px rgba(0, 0, 0, 0.2);
		width: 98%;
		margin: 20rpx 1%;
		float: left;
	}
	.left_waterfall,
	.right_waterfall{
		width: 50%;
		padding: 0 1px;
		float: left;
	}
	/* .sur_item_waterfall:nth-child(even) {
		float: left;
	}

	.sur_item_waterfall:nth-child(odd) {
		float: right;
	} */

	.item_top {
		margin-bottom: 10rpx;
		height: 60rpx;
		line-height: 60rpx;
		width: 103%;
	}

	.item_title1 {
		font-weight: 600;
		float: left;
		padding: 10rpx 0;
	}

	.item_title2 {
		font-weight: 600;
		float: left;
		padding: 10rpx 0;
		display: inline-block;
		white-space: nowrap;
		width: 100%;
		overflow: hidden;
		text-overflow: ellipsis;
		/* height: 25px;
		line-height: 25px;
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 1;
		-webkit-box-orient: vertical; */
	}

	.item_con {
		text-align: center;
	}

	.splendidBox {
		width: 160rpx;
		height: 100%;
		background-image: linear-gradient(to top right, #fd62af, #fc4355);
		float: right;
		border-radius: 30rpx 0 18rpx 0;
		text-align: center;
		line-height: 60rpx;
		color: #fff;
	}

	.tabItem {
		width: 33.333333%;
		height: 100%;
		float: left;
		text-align: center;
		padding: 10rpx 0;
	}

	.tabItem u-icon {
		font-size: 24px;
	}
</style>
