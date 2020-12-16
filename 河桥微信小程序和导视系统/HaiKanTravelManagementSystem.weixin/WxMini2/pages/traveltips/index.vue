<template style="width: 100%;height: 100%;">
	<view style="background-color:#f2f2f2;width: 100%;height: 100%;padding-top: 30rpx;">
		<view style="padding: 0 30rpx;margin-bottom: 30rpx;">
			<u-search shape="round" placeholder="搜一下你喜欢的景点" v-model="query.kw" :clearabled="true" border-color="#c3b6a7"
			 :show-action="false" @search="dogetList"></u-search>
			<!-- <u-search placeholder="搜一下你喜欢的景点" :show-action="false" v-model="query.kw" @search="dogetList"></u-search> -->
		</view>
		<view style="background-color: #f2f2f2;">
			<view class="wrap">
				<view class="u-tabs-box" style="height: 6%;">
					<u-tabs-swiper activeColor="#b19f8b" ref="tabs" :list="list" :current="current" @change="change" :is-scroll="false"
					 swiperWidth="750"></u-tabs-swiper>
				</view>
				<swiper class="swiper-box" :current="swiperCurrent" @transition="transition" @animationfinish="animationfinish"
				 style="height: 94%;">
					<swiper-item class="swiper-item">
						<scroll-view scroll-y style="height: 100%;width: 100%;" @scrolltolower="reachBottom">
							<view class="page-box" style="padding: 20rpx 0;">
								<view class="order" v-for="(res, index) in orderList[0]" v-if=strategyshow>
									<view style="width: 45%;float: left;margin: 2.5%;border-radius: 10px;background-color: #fff;
									position: relative;"
									 @click="clickStrategy(res.strategyUuid)">
										<view style="width: 100%;">
											<view style="height: 150px;width: 100%;position: relative;">
												<u-image width="100%" height="100%" :src="dealwithphoto(purl,res.photoUrl)" mode="scaleToFill"
												 border-radius="10px 10px  0 0"></u-image>
												<!-- {{res.photoUrl}} -->
												<view style="font-size: 0.8em; position: absolute;bottom: 5px;right: 5px;color: #fff;">
													<!-- {{res.count}}{{"人已浏览"}} -->
													{{res.count}}次浏览
												</view>
											</view>
											<view style="margin: 7px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
												{{res.title}}
											</view>
											<!-- <view style="overflow: auto;padding-bottom: 10rpx;"> -->
											<!-- <view style="height: 20px;width: 20px;float: left;">
													<u-image width="100%" height="100%" :src="res.arturl" shape="circle"></u-image>
												</view>
												<view style="margin-left:10px;float:left;font-size: 1em;">
													{{res.addPeople}}
												</view> -->

											<!-- </view> -->
										</view>
									</view>
								</view>
								<u-loadmore :status="loadStatus[0]" bgColor="#f2f2f2" color="#ccc"></u-loadmore>
							</view>
						</scroll-view>
					</swiper-item>
					<swiper-item class="swiper-item">
						<scroll-view scroll-y style="height: 100%;width: 100%;" @scrolltolower="reachBottom">
							<view class="page-box" style="padding: 20rpx 0;">
								<view class="order" v-for="(res, index) in  orderList[1]" v-if="strategyroadshow">
									<view style="width: 45%;float: left;margin: 2.5%;border-radius: 10px;background-color: #fff;position: relative;"
									 @click="clickLuxian(res.luxianUuid)">
										<view style="width: 100%;">
											<view style="height: 150px;width: 100%;position: relative;">
												<u-image width="100%" height="100%" :src="dealwithphoto(purl3,res.photoUrl)" mode="scaleToFill"
												 border-radius="10px 10px  0 0"></u-image>
												<!-- {{res.photoUrl}} -->
												<view style="font-size: 0.8em;position: absolute;bottom: 5px;right: 5px;color: #fff;">
													<!-- {{res.count}}{{"人已浏览"}} -->
													{{res.count}}次浏览
												</view>
											</view>
											<view style="margin: 7px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
												{{res.title}}
											</view>
										</view>
									</view>
								</view>
								<u-loadmore :status="loadStatus[1]" bgColor="#f2f2f2" color="#ccc"></u-loadmore>
							</view>
						</scroll-view>
					</swiper-item>
					<!-- 民俗文化 -->
					<!-- <swiper-item class="swiper-item">
						<scroll-view scroll-y style="height: 100%;width: 100%;" @scrolltolower="reachBottom">
							<view class="order" v-for="(res, index) in  orderList[3]" style="padding: 20rpx 0;">
								<view style="width: 95%;margin: 20rpx auto; border-radius: 10px;background-color: #fff;position: relative;border: 2px solid #B19F8B;"
								 @click="clickminsuwenhua(res)">
									<view style="height: 100px;width: 35%;margin-top: -2.5px;margin-left: -2.5px;float: left;">
										<u-image width="100%" height="103px" :src="dealwithphoto(purl2,res.arturl)" mode="scaleToFill" border-radius="10px 0px 0px 10px"></u-image>
									</view>
									<view style="height: 100px;width: 60%;float: left;margin-left: 2%;">
										<p style="color: #B19F8B;font-size: 15px;text-align: center;">{{res.articleTitle}}</p>
										<view class="order_cont">{{res.articleName}}</view>
										<p style="color: #82848A; text-align: right;height: 35px;line-height: 35px;font-size: 8.5px;">{{res.count}}次浏览</p>
									</view>
									<view style="clear: both;"></view>
								</view>
							</view>
							<u-loadmore :status="loadStatus[2]" bgColor="#f2f2f2" color="#ccc"></u-loadmore>
						</scroll-view>
					</swiper-item> -->
				</swiper>
			</view>
		</view>
		<view>
			<!-- 			<view style="position: fixed;bottom:100upx;left: 50%;transform: translateX(-50%); ">
			<u-button type="warning" plain=true shape="circle">+ 发布</u-button>
			</view> -->
		</view>
	</view>
</template>

<script>
	import {
		getStrategyList,
		getStrategyRoadList,
		getStrategyList2,
		getStrategyRoadList2,
		getminsuList
	} from '@/api/traveltips/strategy.js';
	import http from '@/utils/http.js';
	export default {
		data() {
			return {
				ytype: "1",
				playType: "",
				strategyshow: false,
				strategyroadshow: false,
				orderList: [
					[],
					[],
					[]
				],
				list: [{
						name: '旅游攻略'
					},
					{
						name: '游玩路线'
					}
				],
				current: 0,
				swiperCurrent: 0,
				tabsHeight: 0,
				dx: 0,
				loadStatus: ['loadmore', 'loadmore', 'loadmore'],
				query: {
					totalCount: 0,
					pageSize: 5,
					currentPage: 1,
					kw: '',
					sort: [{
						direct: 'DESC',
						field: 'ID'
					}]
				},
				queryroad: {
					totalCount: 0,
					pageSize: 5,
					currentPage: 1,
					kw: '',
					sort: [{
						direct: 'DESC',
						field: 'ID'
					}]
				},
				purl: http.baseUrl + 'UploadFiles/Traveltips/Strategy/',
				purl2: http.baseUrl + 'UploadFiles/Article/',
				purl3: http.baseUrl + 'UploadFiles/SpecialPick/',
			}
		},
		onLoad(opt) {
			this.playType = opt.playType;
			console.log();
			this.dogetStrategyList();
			this.dogetStrategyRoadList();
			this.dominsuwenhualist();
		},
		methods: {
			dogetList() {
				this.dogetStrategyList();
				this.dogetStrategyRoadList();
				this.dominsuwenhualist();
			},
			dealwithphoto(base, photourl) {
				if (photourl != null) {
					return base + photourl.split(',')[0];
				} else {
					return base + photourl;
				}
			},
			dogetStrategyList() {
				this.queryroad.kw = this.query.kw;
				this.query.currentPage = 1;
				if (this.playType == "1") {
					getStrategyList(this.query).then(res => {
						if (res.data.code == 200) {
							this.orderList[0] = res.data.data;
							this.query.totalCount = res.data.totalCount;
							this.strategyshow = true;
						}
					});
				};
				if (this.playType == "2") {
					getStrategyList2(this.query).then(res => {
						if (res.data.code == 200) {
							this.orderList[0] = res.data.data;
							this.query.totalCount = res.data.totalCount;
							this.strategyshow = true;
						}
					});
				};
			},
			dogetStrategyListMore() {
				if (this.query.currentPage >= Math.ceil(this.query.totalCount / this.query.pageSize)) {
					this.$u.toast('没有更多了');
				} else {
					this.query.currentPage = this.query.currentPage + 1;
					this.dogetStrategyListMoreConcat();
				}
			},
			dogetStrategyListMoreConcat() {
				this.queryroad.kw = this.query.kw;
				if (this.playType == "1") {
					getStrategyList(this.query).then(res => {
						if (res.data.code == 200) {
							this.orderList[0] = this.orderList[0].concat(res.data.data);
							this.query.totalCount = res.data.totalCount;
							this.$forceUpdate();
						}
					});
				};
				if (this.playType == "2") {
					getStrategyList2(this.query).then(res => {
						if (res.data.code == 200) {
							this.orderList[0] = this.orderList[0].concat(res.data.data);
							this.query.totalCount = res.data.totalCount;
							this.$forceUpdate();
						}
					});
				};

			},

			dogetStrategyRoadList() {
				this.queryroad.currentPage = 1;
				if (this.playType == "1") {
					getStrategyRoadList(this.queryroad).then(res => {
						if (res.data.code == 200) {
							this.orderList[1] = res.data.data;
							this.queryroad.totalCount = res.data.totalCount;
							this.strategyroadshow = true;
						}
					});
				};
				if (this.playType == "2") {
					getStrategyRoadList2(this.queryroad).then(res => {
						if (res.data.code == 200) {
							this.orderList[1] = res.data.data;
							this.queryroad.totalCount = res.data.totalCount;
							this.strategyroadshow = true;
						}
					});
				};
			},
			dogetStrategyRoadListMore() {
				if (this.queryroad.currentPage >= Math.ceil(this.queryroad.totalCount / this.queryroad.pageSize)) {
					this.$u.toast('没有更多了');
				} else {
					this.queryroad.currentPage = this.queryroad.currentPage + 1;
					this.dogetStrategyRoadListMoreConcat();
				}
			},
			dogetStrategyRoadListMoreConcat() {
				if (this.playType == "1") {
					getStrategyRoadList(this.queryroad).then(res => {
						if (res.data.code == 200) {
							this.orderList[1] = this.orderList[1].concat(res.data.data);
							this.queryroad.totalCount = res.data.totalCount;
							this.$forceUpdate();
						}
					});
				};
				if (this.playType == "2") {
					getStrategyRoadList2(this.queryroad).then(res => {
						if (res.data.code == 200) {
							this.orderList[1] = this.orderList[1].concat(res.data.data);
							this.queryroad.totalCount = res.data.totalCount;
							this.$forceUpdate();
						}
					});
				};

			},


			//民俗文化
			dominsuwenhualist() {
				this.queryroad.currentPage = 1;
				getminsuList(this.queryroad).then(res => {
					if (res.data.code == 200) {
						this.orderList[3] = res.data.data;
						this.queryroad.totalCount = res.data.totalCount;
						this.$forceUpdate();
					}
				})
			},
			dominsuwenhuaMorelist() {
				if (this.queryroad.currentPage >= Math.ceil(this.queryroad.totalCount / this.queryroad.pageSize)) {
					this.$u.toast('没有更多了');
				} else {
					this.queryroad.currentPage = this.queryroad.currentPage + 1;
					this.dominsuwenhuaMoreConcat();
				}
			},

			dominsuwenhuaMoreConcat() {
				getminsuList(this.queryroad).then(res => {
					if (res.data.code == 200) {
						this.orderList[3] = this.orderList[3].concat(res.data.data);
						this.queryroad.totalCount = res.data.totalCount;
						this.$forceUpdate();
					}

				})
			},


			clickminsuwenhua(data) {
				// uni.navigateTo({
				// 	url:"./minsuwenhuashow?articleTitle="+data.articleTitle+"&articleName="+data.articleName+"&arturl="+data.arturl+"&uuid="+data.articleUuid
				// })
				uni.navigateTo({
					url: "./minsuwenhuashow?guid=" + data.articleUuid
				})
			},

			clickLuxian(guid) {
				uni.navigateTo({
					url: "./strategy44?guid=" + guid
				})
			},


			clickStrategy(guid) {
				uni.navigateTo({
					url: "./strategy?guid=" + guid
				})
			},
			reachBottom() {
				if (this.current == 0) {
					this.dogetStrategyListMore();
				} else if (this.current == 1) {
					this.dogetStrategyRoadListMore();
				} else if (this.current == 2) {
					this.dominsuwenhuaMorelist();
				}
			},
			// tab栏切换
			change(index) {
				this.swiperCurrent = index;
				//this.getOrderList();
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
				this.swiperCurrent = current;
				this.current = current;
			}
		}
	}
</script>

<style>
	.wrap {
		display: flex;
		flex-direction: column;
		height: calc(94vh);
		width: 100%;
	}

	.order_cont {
		text-indent: 2em;
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 3;
		-webkit-box-orient: vertical;
		margin-top: 5px;
		height: 45px;
		font-size: 11px;
	}
</style>
