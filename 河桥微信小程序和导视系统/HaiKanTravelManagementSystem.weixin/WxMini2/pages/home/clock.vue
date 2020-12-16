<template>
	<view class="center">
		<view style="width: 90%;margin-top: 70rpx;margin-left: 5%;">
			<view>
				<u-form :model="mobile" :rules="rules" ref="uForm" :errorType="errorType">

					<view style="width: 90%;margin-left: 5%;margin-bottom: 20rpx;">
						<view style="height: 600rpx; border: solid 6rpx #b19f8b; border-radius: 36rpx;">
							<textarea v-model="mobile.title" name="input" style="height:560rpx ; padding: 20rpx; font-size: 30rpx;width: 560rpx;"
							 maxlength="500" placeholder="不超过500个字符"></textarea>
						</view>
					</view>
					<view style="width: 90%;margin-left: 5%;margin-bottom: 20rpx;">
						<!-- 						<u-form-item :label-position="labelPosition" prop="PhotoUrl" label-width="150">
							<u-upload width="160" :action="action" :file-list="fileList"></u-upload>
						</u-form-item> -->
						<easy-upload ref="eupcf" :dataList="imageList" :uploadUrl="action" :types="'image'" :deleteUrl="actiondelete"
						 :uploadCount="6" @successImage="successImage" :upload_max="5" :uploadList="uplist"></easy-upload><!-- :header="header" -->

					</view>
				</u-form>
			</view>
		</view>
		<button style="margin-bottom: 100rpx;" class="dlbutton" hover-class="dlbutton-hover" type="default" @click="doUpload()">提交</button>
	</view>
</template>

<script>
	import http from '@/utils/http.js';
	import {
		addlist,
	} from '@/api/home/home.js';
	export default {
		data() {
			let that = this;
			return {
				mobile: {
					title: "",
					strategyContent: "",
					photoUrl: '',
				},
				ScenienUuid: '',
				rules: {},
				border: false,
				check: false,
				lon:0,
				lat:0,
				selectStatus: 'close',
				radio: '古镇游',
				actionSheetShow: false,
				pickerShow: false,
				selectShow: false,
				radioCheckWidth: 'auto',
				radioCheckWrap: false,
				labelPosition: 'left',
				codeTips: '',
				errorType: ['message'],

				action: http.baseUrl + 'api/v1/Gereninfo/Gereninfo/UpLoad',
				actiondelete: http.baseUrl + 'api/v1/Gereninfo/Gereninfo/DeleteFile',
				// header: { Authorization: 'Bearer ' + uni.getStorageSync('token') },
				uplist: [],
				imageList: [],
			};
		},
		onLoad(opt) {
			this.ScenienUuid = opt.ScenienUuid;
			this.lon = opt.lon;
			this.lat = opt.lat;
			// this.uplist = [];
			// this.imageList = [];
		},
		methods: {
			successImage(e) {
				//console.log(e);
			},
			async doUpload() {
				let imgs = [];
				let list = this.$refs.eupcf.uploadImages;
				if (list.length > 1) {
					uni.showToast({
						icon: 'none',
						title: '请只上传一张图片'
					});
					return;
				}
				if (this.mobile.title == '') {
					uni.showToast({
						icon: 'none',
						title: '内容不能为空'
					});
					return;
				}
				let data = {
					Evaluate: this.mobile.title,
					ScenienUuid: this.ScenienUuid,
					//TipsType: '游玩攻略',
					Picture: list.join(','),
					// SystemUserUuid: '423968DF-A15D-4B5F-9E25-005486496332',
					SystemUserUuid: this.$store.state.userId,

				};
				addlist(data).then(res => {
					if (res.data.code == 200) {
						// wx.navigateBack({
						// 	delta: 1
						// })
						uni.redirectTo({
							url: '/pages/home/mapview?longitude=' +this.lon + '&latitude=' + this.lat
						});
						uni.showModal({
							title: '打卡成功!',
							showCancel: false
						});
					} else {
						uni.showModal({
							title: res.data.message,
							showCancel: false
						});
					}
				});
			},

		}
	}
</script>

<style>
	.dlbutton {
		color: #ffffff;
		font-size: 34upx;
		width: 500upx;
		height: 100upx;
		background: linear-gradient(-90deg, rgba(177, 159, 139, 1.0), rgba(177, 159, 139, 1.0));
		box-shadow: 0upx 0upx 13upx 0upx rgba(177, 159, 139, 1.0);
		border-radius: 50upx;
		line-height: 100upx;
		text-align: center;
		margin-left: auto;
		margin-right: auto;
		margin-top: 40upx;
	}

	.dlbutton-hover {
		background: linear-gradient(-90deg, rgba(63, 205, 235, 0.9), rgba(188, 226, 158, 0.9));
	}

	.center {
		height: 100%;
	}

	.cu-form-group {
		height: 90rpx;
	}

	.cu-form-group .title {
		min-width: calc(4em + 15px);
	}

	.cu-form-group uni-picker::after {
		line-height: 80rpx;
	}
</style>
