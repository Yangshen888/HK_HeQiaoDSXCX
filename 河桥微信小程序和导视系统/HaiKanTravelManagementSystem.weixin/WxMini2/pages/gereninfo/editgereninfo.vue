<template>
	<view class="center">
		<view style="width: 90%;margin-top: 70rpx;margin-left: 5%;">
			<view>
				<u-form :model="mobile" :rules="rules" ref="uForm" :errorType="errorType">
					<u-form-item :label-position="labelPosition" label="姓名" prop="nickname">
						<u-input :border="border" placeholder="请输入姓名" v-model="mobile.nickname" type="text" input-align="right"></u-input>
					</u-form-item>
					<u-form-item :label-position="labelPosition" label="身份证号" prop="userIdCard" label-width="150">
						<u-input :border="border" placeholder="请输入身份证号" v-model="mobile.userIdCard" type="text" input-align="right"></u-input>
					</u-form-item>
					<u-form-item  :label-position="phone" label="手机号码" prop="phone" label-width="150">
						<u-input :border="border" placeholder="请输入手机号" v-model="mobile.phone" type="number" input-align="right"></u-input>
					</u-form-item>
					<u-form-item :label-position="labelPosition" label="年龄" prop="age" label-width="150">
						<u-input :border="border" placeholder="请输入年龄" v-model="mobile.age" type="number" input-align="right"></u-input>
					</u-form-item>
					<u-form-item :label-position="labelPosition" label="性别" prop="sex">
						<u-input :border="border" type="select" :select-open="actionSheetShow" v-model="mobile.sex" placeholder="请选择性别"
						 @click="actionSheetShow = true" input-align="right"></u-input>
					</u-form-item>
					<u-form-item :label-position="labelPosition" label="所在地区" prop="placeofresidence" label-width="150">
						<u-input :border="border" type="select" :select-open="pickerShow" v-model="mobile.placeofresidence" placeholder="请选择地区"
						 @click="pickerShow = true" input-align="right"></u-input>
					</u-form-item>
					<!-- 					<u-form-item :label-position="labelPosition" label="上传图片" prop="photo" label-width="150">
						<u-upload width="160"></u-upload>
					</u-form-item> -->
				</u-form>
				<u-picker mode="region" v-model="pickerShow" @confirm="regionConfirm"></u-picker>
				<u-action-sheet :list="actionSheetList" v-model="actionSheetShow" @click="actionSheetCallback"></u-action-sheet>
			</view>
		</view>
		<button class="dlbutton" hover-class="dlbutton-hover" type="default" @click="submit">保存</button>
	</view>
</template>

<script>
	import {
		GetList,
		addlist,
	} from '@/api/gereninfo/gereninfo.js';
	export default {
		data() {
			let that = this;
			return {
				mobile: {
					nickname: "",
					userIdCard: "",
					phone: "",
					sex: "",
					placeofresidence: "",
					photo: '',
					tipsType: '',
					age: '',
				},
				rules: {},
				border: false,
				check: false,
				selectStatus: 'close',
				radioList: [{
						name: '游玩攻略',
						checked: true,
						disabled: false
					},
					{
						name: '路线推荐',
						checked: false,
						disabled: false
					}
				],
				radio: '游玩攻略',
				actionSheetList: [{
						text: '男'
					},
					{
						text: '女'
					}
				],
				actionSheetShow: false,
				pickerShow: false,
				selectShow: false,
				radioCheckWidth: 'auto',
				radioCheckWrap: false,
				labelPosition: 'left',
				codeTips: '',
				errorType: ['message'],
			};
		},
		onLoad() {
			let data = {
				// systemUserUuid: '423968DF-A15D-4B5F-9E25-005486496332'
				systemUserUuid: this.$store.state.userId
			};
			GetList(data).then(res => {
				console.log(res);
				if (res.data.data.listData == '') {
					uni.showToast({
						title: '未获取到信息',
						icon: 'none'
					});
					return;
				} else {
					this.mobile = res.data.data[0]
					console.log(this.mobile);
				}
			});
		},
		methods: {
			// 点击actionSheet回调
			actionSheetCallback(index) {
				uni.hideKeyboard();
				this.mobile.sex = this.actionSheetList[index].text;
			},
			// 选择地区回调
			regionConfirm(e) {
				console.log();
				this.mobile.placeofresidence = e.province.label + '-' + e.city.label + '-' + e.area.label;
			},

			submit() {
				//console.log(1);
				if (this.mobile.nickname != undefined && this.mobile.nickname != '' && this.mobile.nickname != null) {
					var regn = /^[a-zA-Z\u4e00-\u9fa5]+$/;
					if (!regn.test(this.mobile.nickname)) {
						uni.showToast({
							icon: 'none',
							title: '姓名不符合规范'
						});
						return;
					}
				}
				if (this.mobile.userIdCard != undefined && this.mobile.userIdCard != '' && this.mobile.userIdCard != null) {
					var regn = /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
					if (!regn.test(this.mobile.userIdCard)) {
						uni.showToast({
							icon: 'none',
							title: '身份证号不符合规范'
						});
						return;
					}
				}
				if (this.mobile.phone != undefined && this.mobile.phone != '' && this.mobile.phone != null) {
					var regn = /^[1][3,4,5,7,8][0-9]{9}$/;
					if (!regn.test(this.mobile.phone)) {
						uni.showToast({
							icon: 'none',
							title: '手机号码不符合规范'
						});
						return;
					}
				}
				if (this.mobile.age != undefined && this.mobile.age != '' && this.mobile.age != null) {
					var regn = /^\+?[1-9]\d*$/;
					if (!regn.test(this.mobile.age)) {
						uni.showToast({
							icon: 'none',
							title: '年龄不符合规范'
						});
						return;
					}
				}
				let data = {
					nickname: this.mobile.nickname,
					userIdCard: this.mobile.userIdCard,
					phone: this.mobile.phone,
					sex: this.mobile.sex,
					placeofresidence: this.mobile.placeofresidence,
					age: this.mobile.age,
					//SystemUserUuid: '423968DF-A15D-4B5F-9E25-005486496332',
					SystemUserUuid: this.$store.state.userId,
					
				};
				//console.log(data);
				addlist(data).then(res => {
					// console.log(res);
					this.info = res.data.message;
					// this.modalName = 'show';
					if (this.info == '成功') {
						uni.showToast({
							title: '修改成功',
							icon: 'none'
						});
						uni.redirectTo({
							url: '/pages/gereninfo/gereninfo'
						});
						// wx.navigateBack({
						//   delta: 1
						// });
						// uni.showModal({
						// 	title: '修改成功!',
						// 	showCancel: false
						// });
					} else {
						uni.showToast({
							title: '修改失败,请检查信息填写是否有误',
							icon: 'none'
						});
						return;
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
