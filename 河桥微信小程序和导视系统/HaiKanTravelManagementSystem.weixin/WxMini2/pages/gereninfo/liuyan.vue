<template>
	<view class="center">
<!-- 		<view style="text-align: center;">
			<textarea maxlength="-1"  style="height: 800rpx; "> </textarea>
		</view> -->
		<view style="margin-top: 50rpx;">
			<view  style="height: 600rpx;width: 90%; border: solid 6rpx #b19f8b; border-radius: 48rpx;margin-left: 5%;">
				<textarea name="input" style="height:560rpx ; padding: 20rpx; font-size: 30rpx;"  maxlength="-1" v-model="mobile.neirong"></textarea>
			</view>
		</view>
		<button class="dlbutton" hover-class="dlbutton-hover" type="default"  @click="submit">提交建议</button>

	</view>
</template>

<script>
	import {
		addliuyan,
	} from '@/api/gereninfo/gereninfo.js';
	export default {
		data() {
			return {
				mobile: {
					neirong: "",
					systemUserUuid:"",
				},
			}
		},
		methods: {
			submit() {
				if(this.mobile.neirong == '')
				{
					uni.showToast({
						title: '请填写内容！',
						icon: 'none',
						mask: true,
						duration: 1000
					});
					return;
				}
				let data = {
					Neirong: this.mobile.neirong,
					SystemUserUuid: this.$store.state.userId,
				};
				//console.log(data);
				addliuyan(data).then(res => {
					// console.log(res);
					this.info = res.data.message;
					// this.modalName = 'show';
					if (this.info == '成功') {
						// uni.redirectTo({
						// 	url: '/pages/home/index'
						// });
						wx.navigateBack({
						  delta: 1
						})
						uni.showModal({
							title: '留言提交成功,感谢您的反馈!',
							icon: 'none'
						});

					} else {
						uni.showModal({
							title: '提交失败,请检查信息填写是否有误',
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
</style>
