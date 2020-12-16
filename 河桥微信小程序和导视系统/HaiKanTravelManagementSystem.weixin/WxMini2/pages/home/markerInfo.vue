<template>
	<view style="padding: 0px 20px;">
		<view>
			<u-swiper :list="picture" height="350"></u-swiper>
		</view>
		<view>
			<view style="float: left;">
				<view style="font-size: 15px;font-weight: bold;height: 40px;line-height: 40px;overflow: hidden;">
					<view style="float: left;">{{name}}</view>
					<view style="float: right;margin-right: 20px;margin-top: 4px;">
						<audio style="float: left;padding-top: 16rpx;">
							<u-icon name="volume-up" @click="reader(audioUrl,introduction)" v-if="isplay" size="44"></u-icon>
							<u-icon name="volume-up-fill" @click="reader(audioUrl,introduction)" v-if="!isplay" size="44"></u-icon>
						</audio>
					</view>
				</view>
				<p style="color: #000000;margin-left: 15px;height: 30px;">{{address}}</p>
				<p style="color: #000000;margin-left: 15px;text-indent: 2em;">{{introduction}}</p>
			</view>
			<view style="clear: both;"></view>
		</view>
		<view style="margin: 20rpx 0;overflow: hidden;text-align: center;" v-if="type=='scien'||type=='hotel'">
			<view style="float: left; border-radius: 10rpx; background-color: #0081FF;color: white;height: 35px;line-height: 35px;width: 45%;"
			 @click="toOPenYuYue">立即购票</view>
			<view style="float: right; border-radius: 10rpx; background-color: #0081FF;color: white;height: 35px;line-height: 35px;width: 45%;"
			 @click="toOpenMap">前往此处</view>
		</view>
		<view style="margin: 20rpx 0;overflow: hidden;text-align: center;" v-if="type=='techan'">
			<view style="float: left; border-radius: 10rpx; background-color: #0081FF;color: white;height: 35px;line-height: 35px;width: 45%;"
			 @click="toOPenYuYue">立即选购</view>
			<view style="float: right; border-radius: 10rpx; background-color: #0081FF;color: white;height: 35px;line-height: 35px;width: 45%;"
			 @click="toOpenMap">前往此处</view>
		</view>
		<view style="margin: 20rpx 0;text-align: center;" v-if="!(type=='scien'||type=='hotel'||type=='techan')">
			<view style="display: inline-block; border-radius: 10rpx; background-color: #0081FF;color: white;height: 35px;line-height: 35px;width: 80%;"
			 @click="toOpenMap">前往此处</view>
		</view>
		<!-- 评论区 -->
		<view class="commentSection" style="margin-bottom: 40rpx;margin-top: 30rpx;" v-for="(item, index) in liaotianList"
		 v-if="liaotianList.length > 0">
			<view class="commentBox" style="border-bottom: 1px solid #ccc;">
				<view class="user" style="position: relative;">
					<view style="width: 60rpx;height: 60rpx;border-radius: 50%;position: absolute;top: 50%;left: 0;transform: translateY(-50%); overflow: hidden;">
						<image src="https://hqjsc.hzgx.info/wxapp/static/user.png" mode="widthFix" style="width: 100%;"></image>
						<!-- <u-icon name="account" size="46" style="color: #fff;margin: 8rpx 6rpx;"></u-icon> -->
					</view>
					<view style="height: 60rpx;line-height: 60rpx;display: inline-block;margin-left: 80rpx;">{{item.userName}}</view>
				</view>
				<view class="comment" style="margin-left: 80rpx;">
					<view style="line-height: 1.5;">{{item.evaluate}}</view>
					<view style="font-size: 0;">
						<image :src="imgUrl + item.picture" v-if="item.picture != ''" mode="widthFix" style="width: 100%;border-radius: 10rpx;"></image>
					</view>
				</view>
				<view style="margin-left: 80rpx;overflow: hidden;height: 60rpx;line-height: 60rpx;font-size: 24rpx;color: #9a9a9a;">
					<view style="float: left;">{{item.addTime}}</view>
					<!-- 					<view style="float: right;">
						<view style="float: right;">888</view>
						<u-icon name="thumb-up" style="float: right;margin-top: 10rpx;margin-right: 10rpx;" size="36"></u-icon>
					</view> -->
				</view>
			</view>
		</view>
		<u-loadmore :status="status" color="#b6b6b6" v-if="type==scien" />		
	</view>
</template>

<script>
	import http from '@/utils/http.js';
	import {
		infolist,
		infolist2,
	} from '@/api/home/home.js';

	export default {
		data() {
			return {
				audioSrc: "",//文字转语音
				grant_type: "client_credentials",
				client_id: "DSgEAp5KYjMXEGa9ctGNTzPB",
				client_secret: "qk4fYCQDwa0mYzmG5LlPraGKVzgVp2rP",
				access_token: "", //文字转语音token
				name: "", //名称
				address: "", //地址
				picture: [], //图片
				latitude: "",
				longitude: "",
				audioUrl: "",
				introduction: "",
				shopId: "",
				liaotianList: [],
				imgUrl: http.baseUrl,
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
				isplay: true,
				innerAudioContext: wx.createInnerAudioContext(),
				status: 'loadmore',
				type: '',
			};
		},
		computed: {},
		onLoad(option) {
			let that = this;
			that.scenienUuid = option.scenienUuid;
			that.query.kw = option.scenienUuid;
			that.longitude = option.longitude;
			that.introduction = option.introduction;
			that.latitude = option.latitude;
			that.name = option.name;
			that.type = option.type;
			that.audioUrl = option.audioUrl;
			that.address = option.address;
			that.shopId = option.shopId;
			console.log("商品编号")
			console.log(that.shopId)
			console.log(that.audioUrl)
			if (that.type == 'food') {
				let imglist = option.picture.split(',');
				for (let i = 0; i < imglist.length; i++) {
					that.picture.push({
						image: http.baseUrl + 'UploadFiles/Food/' + imglist[i]
					});
				}
			} else if (that.type == 'techan') {
				let imglist = option.picture.split(',');
				for (let i = 0; i < imglist.length; i++) {
					that.picture.push({
						image: http.baseUrl + 'UploadFiles/Food/' + imglist[i]
					});
				}
			} else if (that.type == 'hotel') {
				let imglist = option.picture.split(',');
				for (let i = 0; i < imglist.length; i++) {
					that.picture.push({
						image: http.baseUrl + 'UploadFiles/Hotel/' + imglist[i]
					});
				}
			} else if (that.type == 'scien') {
				let imglist = option.picture.split(',');
				for (let i = 0; i < imglist.length; i++) {
					that.picture.push({
						image: http.baseUrl + 'UploadFiles/Scene/Picture/' + imglist[i]
					});
				};
				if (that.scenienUuid != '') {
					that.loadinfolist();
				}
			}
		},
		methods: {
			toOPenYuYue() {
				let that = this;
				console.log("商品编号")
				console.log(that.shopId)
				wx.navigateToMiniProgram({
					//appId: 'wxde8ac0a21135c07d',		//美团APPID
					appId: 'wx52d250a5d4957ade', //需要跳转的APPID
					path: 'pages/good/index?id=' + that.shopId, //打开跳转的小程序具体页面路径
					extraData: {},
					envVersion: 'release', //正式版
					//envVersion: 'develop',		//开发板
					//envVersion: 'trial',			//体验版
					success(res) {
						// 
						console.log("打开成功")
					}
				})
			},
			reader(e, introduction) {
				//若有语音则播放语音 否则在线转换
				if(e.indexOf(".mp3")!=-1)
				{
					this.innerAudioContext.src = encodeURI(e);
					if (this.isplay) {
						this.innerAudioContext.play();
						this.isplay=false;
						this.innerAudioContext.onEnded(()=>{
							this.isplay=true;
						})
					}else{
						this.innerAudioContext.pause();
						this.isplay=true;
					}
					this.innerAudioContext.onError((res) => {
					  console.log(res.errMsg);
					  console.log(res.errCode);
					});
				}
				else
				{
					if (this.isplay) {
						this.btts(introduction);
						this.isplay=false;
						this.innerAudioContext.onEnded(()=>{
							this.isplay=true;
						})
					}else{
						this.innerAudioContext.pause();
						this.isplay=true;
					}
					
					
				}

			},
			//文字转语音
			btts(text) {
				let that =this;
				uni.request({
					url: "https://openapi.baidu.com/oauth/2.0/token?grant_type=" + this.grant_type + "&client_id=" + this.client_id +
						"&client_secret=" + this.client_secret,
					method: 'get',
					dataType: 'json',
					success(res) {
						console.log(res)
						if (res.statusCode == 200) {
							let access_token = res.data.access_token;
							var param = {
								tex: encodeURIComponent(text),
								tok: access_token,
								spd: 5,
								pit: 5,
								vol: 5,
								per: 1,
								lan: "zh",
								cuid: access_token,
								ctp: 1
							};
							var p = param || {};
							// 创建form参数
							var data = {};
							for (var p in param) {
								data[p] = param[p]
							}
							// 赋值预定义参数
							data.cuid = data.cuid || data.tok;
							data.ctp = 1;
							data.lan = data.lan || 'zh';
							// 序列化参数列表
							var fd = [];
							for (var k in data) {
								fd.push(k + '=' + encodeURIComponent(data[k]));
							}
							var fdstr = fd.join('&');
							console.log(fdstr)
							var url = 'https://tsn.baidu.com/text2audio?' + fdstr;	
							that.playurl(url);	
						}
					}
				})
			},
			playurl(url){
				this.innerAudioContext.src= url; //选择播放的音频
				this.innerAudioContext.play(); //执行播放
			},


			loadinfolist() {
				infolist(this.query).then(res => {
					if (res.data.code == 200) {
						this.liaotianList = res.data.data;
						console.log("南卡罗开发男法")
						console.log(this.liaotianList)

					}
				});
			},
			onReachBottom() {
				this.status = 'loading';
				this.query.currentPage++;
				infolist2(this.query).then(res => {
					console.log(111111);
					console.log(989989);
					console.log(res);
					let data = res.data.data;
					if (data.length > 0) {
						this.status = 'loadmore';
					} else {
						this.query.currentPage--;
						this.status = 'nomore';
					}
				});
			},
			toOpenMap() {
				let lon = parseFloat(this.lon);
				let lat = parseFloat(this.lat);
				uni.openLocation({
					latitude: lat,
					longitude: lon,
					name: this.name,
					success: function() {
						console.log('success');
					},
					fail: function(err) {
						console.log(err);
					}
				});
			}
		},
		destroyed() {
			console.log("我已经离开了！");
			this.innerAudioContext.stop();
		},
		// onHide: function () {
		//     this.innerAudioContext.stop();
		//     this.innerAudioContext.destroy();
		//   },
		//   /**
		//    * 生命周期函数--监听页面卸载
		//    */
		//   onUnload: function () {
		//     this.innerAudioContext.stop();
		//     this.innerAudioContext.destroy();
		//   },
	};
</script>

<style>

</style>
