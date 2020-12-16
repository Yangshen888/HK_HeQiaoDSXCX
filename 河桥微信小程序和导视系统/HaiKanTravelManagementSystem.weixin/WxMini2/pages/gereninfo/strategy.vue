<template>
	<view style="padding: 0 30rpx;">
		<view class="top"></view>
		<view>
			<view class="cu-card article" v-for="(item, index) in kw" v-if="kw.length > 0" :key="index">
				<view class="cu-item shadow"  @click="clickStrategy(item.strategyUuid)">
					<view class="content">
						<view style="width: 45%;">
							<!-- <u-image width="100%" height="100%" :src="dealwithphoto(purl,item.photoUrl)" mode="scaleToFill" border-radius="10rpx"></u-image> -->
							<image :src="dealwithphoto(purl,item.photoUrl)" style="border-radius: 10rpx;width: 100%;height: 160rpx;"></image>
						</view>
						<view class="desc" style="position: relative;">
							<view class="title" style="display: flex;">
								<view class="text-cut" style="flex: 1;">{{ item.title }}</view>
								<u-tag :text="showState(item.auditStaues,item.throughStaues)" :type="stateType(item.auditStaues,item.throughStaues)" size="mini" />
							</view>
							<view class="text-content">{{ item.strategyContent }}</view>
							<view style="font-size: 10px;margin-top: 4px;position: absolute;left: 0;bottom: 0;">发布时间：{{ item.addTime }}</view>
						</view>
					</view>
				</view>
			</view>
			<view style="position: fixed;bottom: 30px;right: 30px;" @click="geturl">
				<!-- <view style="font-size: 60rpx;display: inline;color: #FFFFFF;">+</view> -->
				<u-icon name="plus-circle" style="transition: all 0.2s;font-size: 100rpx;"></u-icon>
			</view>
		</view>
	</view>
</template>

<script>
	import {
		GetLiNew,
	} from '@/api/gereninfo/gereninfo.js';
	import http from '@/utils/http.js';
	export default {
		data() {
			return {
				menushow: false,
				mobile: {
					title: "",
					strategyContent: "",
					photoUrl: "",
					addTime: "",
					placeofresidence: "",
					systemUserUuid: '',
				},
				kw: [],
				purl: http.baseUrl + 'UploadFiles/Traveltips/Strategy/',
			}
		},
		onLoad() {
			let data = {
				systemUserUuid: this.$store.state.userId
			};
			GetLiNew(data).then(res => {
				console.log("获取当前账号已发布的攻略");
				console.log(res);
				if (res.data.data.length == 0) {
					uni.showToast({
						title: '未获取到信息',
						icon: 'none'
					});
					return;
				} else {
					this.kw = res.data.data
					console.log(this.kw);
				}
			});
		},
		methods: {
			showState(auditStaues,throughStaues){
				if(auditStaues==0){
					return "未审核";
				}else{
					if(throughStaues==0){
						return "已通过";
					}
					if(throughStaues==1){
						return "不通过"
					}
				}
				
			},
			stateType(auditStaues,throughStaues){
				if(auditStaues==0){
					return "primary";
				}else{
					if(throughStaues==0){
						return "success";
					}
					if(throughStaues==1){
						return "error"
					}
				}
			},
			geturl() {
				uni.navigateTo({
					url: '/pages/gereninfo/gonglue'
				})
			},
			clickStrategy(guid) {
				uni.navigateTo({
					url: "./StrategyInfo?guid=" + guid
				})
			},
			dealwithphoto(base, photourl) {
				if (photourl != null) {
					console.log(base + photourl.split(',')[0])
					return base + photourl.split(',')[0];
				} else {
					return base + photourl;
				}
			},
			tostrategy() {
				uni.navigateTo({
					url: '/pages/gereninfo/strategy'
				})
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




		},
	}
</script>

<style>
	.cu-card {
		display: block;
		overflow: hidden;
		padding-top: 20rpx;
		margin: 20rpx 0;
		box-shadow: 0 0 2px rgba(0, 0, 0, 0.2);
		border-radius: 10rpx;
	}

	.cu-card .article {
		display: block;
	}

	.cu-item {
		display: block;
		background-color: #ffffff;
		overflow: hidden;
		border-radius: 5px;
		margin: 0 10px;
	}

	.title {
		font-size: 14px;
		font-weight: 900;
		color: #333333;
		line-height: 60rpx;
	}

	.text-cut {
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
	}

	.content {
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
	}

	.text-content {
		font-size: 12px;
		text-indent: 2em;
		/* text-align: justify; */
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
	}

	.desc {
		margin-left: 20rpx;
		width: 50%;
	}

	.text-bottom {
		font-size: 12px;
		line-height: 30px;
	}
</style>
