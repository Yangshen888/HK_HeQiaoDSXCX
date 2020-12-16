<template>
	<view class="center">
		<view style="width: 90%;margin-top: 70rpx;margin-left: 5%;">
			<view>
				<u-form :model="mobile" :rules="rules" ref="uForm" :errorType="errorType">
					<view style="width: 90%;margin-left: 5%;margin-bottom: 20rpx;">
						<u-form-item :label-position="labelPosition" prop="tipsType" label-width="150">
							<u-radio-group v-model="radio" @change="radioGroupChange" :width="radioCheckWidth" :wrap="radioCheckWrap">
								<u-radio shape="circle" v-model="item.checked" v-for="(item, index) in radioList" :key="index" :name="item.name">{{ item.name }}</u-radio>
							</u-radio-group>
						</u-form-item>
					</view>
					<view style="width: 90%;margin-left: 5%;margin-bottom: 20rpx;">
						<view style="height: 100rpx; border: solid 6rpx #b19f8b; border-radius: 36rpx;">
							<input v-model="mobile.title" class="uni-input" style="height:60rpx ; padding: 14rpx; font-size: 26rpx;"
							 maxlength="30" placeholder="请输入标题,不超过30个字符" />
						</view>
					</view>
					<view style="width: 90%;margin-left: 5%;margin-bottom: 20rpx;">
						<view style="height: 600rpx; border: solid 6rpx #b19f8b; border-radius: 36rpx;">
							<textarea v-model="mobile.strategyContent" name="input" style="height:560rpx ; padding: 20rpx; font-size: 30rpx;width: 560rpx;"
							 maxlength="500" placeholder="请输入内容,不超过500个字符"></textarea>
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
		addgonglue,
	} from '@/api/gereninfo/gereninfo.js';
	export default {
		data() {
			let that = this;
			return {
				mobile: {
					title: "",
					strategyContent: "",
					photoUrl: '',
					tipsType: '古镇游',
				},
				rules: {},
				border: false,
				check: false,
				selectStatus: 'close',
				radioList: [{
						name: '古镇游',
						checked: true,
						disabled: false
					},
					{
						name: '周边游',
						checked: false,
						disabled: false
					}
				],
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
		onLoad() {
			// this.uplist = [];
			// this.imageList = [];
		},
		methods: {
			successImage(e) {
				//console.log(e);
			},
			// radio选择发生变化
			radioGroupChange(e) {
				console.log("单选框的值");
				console.log(e);
				this.mobile.tipsType = e;
			},
			async doUpload() {
				if (this.mobile.title == undefined || this.mobile.title == '' || this.mobile.title == null) {
					uni.showToast({
						icon: 'none',
						title: '标题不能为空'
					});
					return;
				}
				let imgs = [];
				let list = this.$refs.eupcf.uploadImages;
				console.log("查看攻略集合");
				console.log(list);
				if (list.length == 0) {
					uni.showToast({
						icon: 'none',
						title: '请至少上传一张图片'
					});
					return;
				}
				let data = {
					Title: this.mobile.title,
					StrategyContent: this.mobile.strategyContent,
					Ytype: this.mobile.tipsType,
					//TipsType: '游玩攻略',
					Accessory: list.join(','),
					// SystemUserUuid: '423968DF-A15D-4B5F-9E25-005486496332',
					SystemUserUuid: this.$store.state.userId,

				};
				console.log(333);
				console.log(data);
				addgonglue(data).then(res => {
					console.log(res);
					if (res.data.code == 200) {
						// uni.redirectTo({
						// 	url: '/pages/gereninfo/strategy'
						// });
						wx.navigateBack({
							delta: 1
						})
						uni.showModal({
							title: '提交成功,攻略已转至后台审核,感谢您的分享!',
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
