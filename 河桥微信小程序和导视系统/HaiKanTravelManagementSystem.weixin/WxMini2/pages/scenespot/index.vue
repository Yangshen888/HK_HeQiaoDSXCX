<template>
	<view>
		<!-- <scroll-view scroll-y style="width: 100%;height: 100%;"
		  @scrolltolower="onreachBottom"> -->
		<!-- <view > -->
			<view v-for="(item, index) in scenelist" style="margin: 20rpx;font-size: 30rpx;" @click="clickshow(item.scenicSpotUuid)">
				<view>
					<view style="overflow: hidden;">
						<view style="padding: 5px;float: left;" v-show="showsrc1[index] == 1">
							<u-swiper :list="list1[index]" :circular="true" :autoplay="true" :height="180" style="width: 130px; float: right;"></u-swiper>
						</view>
						<view style="margin-left: 3px;margin-top: 6px;" :style="style[index]">
							<view class="u-line-1" style="font-size: 15px;font-weight: 600;">{{ item.name }}—</view>
							<view class="u-line-1" style="margin-top: 5px;font-weight: 600;margin-bottom: 10px;padding-left: 20px;">{{ item.spotContent }}</view>
							<view style="font-size: 10px;margin: 22px 0 0 0;color: #909399;float: right;">{{ renddate(item.createTime) }}</view>
						</view>
					</view>
				</view>
				<u-line color="rgb(204, 208, 216)" />
			</view>
			<!-- <view style="height: 135px;"></view> -->
		<!-- </view> -->
		<!-- </scroll-view> -->
	</view>
</template>
 
<script>
	import http from '@/utils/http.js';

	import {
		getSceneList
	} from '@/api/home/home.js';
	
	export default {
		data() {
			return {
				style1: '',
				style2: 'display:none',
				menushow: false,
				query: {
					totalCount: 0,
					pageSize: 10,
					currentPage: 1,
					kw: '',
					schoolUuid: '',
					sort: [{
						direct: 'DESC',
						field: 'ID'
					}]
				},
				list1: [],
				showsrc1: [],

				style: [],
				styles: [],
				url: http.baseUrl + 'UploadFiles/Scene/Picture/',
				scenelist: [],
				// postjobsappeal: [],
			};
		},
		//下拉刷新
		onPullDownRefresh() {
			this.query.currentPage = 1;
			this.query.totalCount= 0;
			this.dogetSceneList();
		},

		//触底加载更多
		onReachBottom(e) {
			console.log(this.query.totalCount)
			if (this.query.currentPage >= Math.ceil(this.query.totalCount / this.query.pageSize)) {
				this.$u.toast('没有更多了');
			} else {
				this.query.currentPage = this.query.currentPage + 1;
				this.dogetSceneListConcat();
			}
		},
		onLoad() {
			this.dogetSceneList();
		},
		methods: {
			onreachBottom(){
				if (this.query.currentPage >= Math.ceil(this.query.totalCount / this.query.pageSize)) {
					this.$u.toast('没有更多了');
				} else {
					this.query.currentPage = this.query.currentPage + 1;
					this.dogetSceneListConcat();
				}
			},
			renddate(date) {
				return this.utils.Time(date);
			},

			dogetSceneList() {
				getSceneList(this.query).then(res => {
					if (res.data.code == 200) {
						this.scenelist = res.data.data;
						this.query.totalCount = res.data.totalCount;
						if (res.data.data.length > 0) {
							for (let k = 0; k < res.data.data.length; k++) {
								let imgs = [];
								if (res.data.data[k].picture != '') {
									for (let j = 0; j < res.data.data[k].picture.split(',').length; j++) {
										let images = {
											image: (this.url + res.data.data[k].picture.split(',')[j]).toString()
										};
										imgs[j] = images;
									}
									this.showsrc1[k] = 1;
								} else {
									imgs = [];
									this.showsrc1[k] = 0;
									this.style[k] = 'width: 97%;';
								}
								this.list1[k] = imgs;
							}
						} else {
							this.list1 = [];
						}
					}
				})
			},
			dogetSceneListConcat() {
				let count = (this.query.currentPage-1)*this.query.pageSize;
				console.log(count)
				getSceneList(this.query).then(res => {
					if (res.data.code == 200) {
						this.scenelist = this.scenelist.concat(res.data.data);
						this.query.totalCount = res.data.totalCount;
						if (res.data.data.length > 0) {
							for (let k = count; k < count+res.data.data.length; k++) {
								let imgs = [];
								if (res.data.data[k-count].picture != '') {
									for (let j = 0; j < res.data.data[k-count].picture.split(',').length; j++) {
										let images = {
											image: (this.url + res.data.data[k-count].picture.split(',')[j]).toString()
										};
										imgs[j] = images;
									}
									this.showsrc1[k] = 1;
								} else {
									imgs = [];
									this.showsrc1[k] = 0;
									this.style[k] = 'width: 97%;';
								}
								this.list1[k] = imgs;
							}
						} else {
							this.list1 = [];
						}
					}
				})
			},
			clickshow(guid)
			{
				uni.navigateTo({
					url:"./spotdetail?guid="+guid
				})
			}
		}
	};
</script>

<style>
</style>
