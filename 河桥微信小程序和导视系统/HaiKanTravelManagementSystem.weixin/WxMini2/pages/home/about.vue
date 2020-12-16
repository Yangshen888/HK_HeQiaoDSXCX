<template>
	<!-- 推荐模块 -->
	<view class="suggest" style="padding: 0 30rpx;margin-top: 20rpx;">
		<view class="sug_title" style="font-weight: 600;line-height: 2;font-size: 32rpx;font-family: '华文仿宋';">发现河桥</view>
		<view class="sug_con" style="overflow: auto;">
			<!-- 镇歌 -->
			<view class="sur_item" :key="index">
				<view class="item_top" style="line-height: 2;">
					<view class="item_title1" style="font-size:30rpx;font-family: '华文仿宋';">河桥 • 镇歌</view>
					<view class="splendidBox" style="font-family: '华文仿宋';">精彩推荐</view>
				</view>
				<view class="item_con">
					<video src="https://hqjsc.hzgx.info/wxapp/static/heqiaozhenge.mp4" :controls="true" style="width: 100%; border-radius: 10rpx;"
					 :enable-auto-rotation="true" poster="https://hqjsc.hzgx.info/wxapp/static/heqiaozhenge_poster.png"></video>
				</view>
			</view>
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
			<!-- <view class="waterfall">
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
			</view> -->
		</view>
		<!-- <u-loadmore :status="status" color="#b6b6b6" /> -->
	</view>
</template>

<script>
	import http from '@/utils/http.js';
	import {
		getRecommend,
		getDiscovery
	} from '@/api/home/home.js';
	export default {
		data() {
			return {
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
				status: 'loadmore',
				evlist: [], //偶
				oddlist: [], //奇
			}
		},
		onLoad() {
			this.loadInformation();
		},
		methods: {
			toarticledefault(type, uuid) {
				if (type == 'video') {
					return;
				}
				uni.navigateTo({
					url: '/pages/home/articledefault?uuid=' + uuid + '&type=' + type
				});
			},
			onReachBottom() {
				this.status = 'loading';
				this.query.currentPage++;
				getDiscovery(this.query).then(res => {
					console.log(111111);
					console.log(989989);
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
							if (i % 2 == 0) {
								this.oddlist.push(d);
							} else {
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
							if (i % 2 == 0) {
								this.oddlist.push(d);
							} else {
								this.evlist.push(d);
							}
							// this.dList.push(d);
						}
					}
				})
			},
		}
	}
</script>

<style>
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
	.right_waterfall {
		width: 50%;
		padding: 0 1px;
		float: left;
	}

	.item_top {
		margin-bottom: 10rpx;
		height: 60rpx;
		line-height: 60rpx;
		width: 103%;
		position: relative;
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
	}

	.item_con {
		text-align: center;
	}

	.splendidBox {
		width:180rpx;
		height: 108rpx;
		line-height: 120rpx;
		text-align: center;
		border-radius: 0 10px 0 8px;
		background: url(https://hqjsc.hzgx.info/wxapp/static/tagsbg.png) no-repeat;
		background-size: 100% 100%;
		color: #fff;
		position: absolute;
		top: -24rpx;
		right: 0;
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
