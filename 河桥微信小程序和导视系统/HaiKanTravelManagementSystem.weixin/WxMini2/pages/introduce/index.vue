<template>
	<view class="wrap" style="padding-bottom: 20rpx;height: 100%;">
		<u-navbar :background="background" :back-text="'返回'" :immersive="true" :title="'景点介绍'"></u-navbar>
		<view
			class="csu-swiper-wrap"
			:style="{
				borderRadius: `${borderRadius}rpx`
			}"
			style="height: 78%; background-attachment: fixed;background-repeat: no-repeat;background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/background.png);background-size: 100%;"
			v-if="isshow"
		>
			<swiper
				@change="change"
				@animationfinish="animationfinish"
				:interval="interval"
				:circular="circular"
				:duration="duration"
				:autoplay="autoplay"
				:previous-margin="effect3d ? effect3dPreviousMargin + 'rpx' : '0'"
				:next-margin="effect3d ? effect3dPreviousMargin + 'rpx' : '0'"
				style="height: 100%;"
			>
				<swiper-item class="csu-swiper-item" v-for="(item, index) in contentlist" :key="index">
					<view
						class="csu-list-image-wrap"
						@tap.stop.prevent="listClick(index)"
						:class="[current != index ? 'csu-list-scale' : '']"
						:style="{
							borderRadius: `${borderRadius}rpx`,
							transform: effect3d && current != index ? 'scaleY(0.9)' : 'scaleY(1)',
							margin: effect3d && current != index ? '0 20rpx' : 0,
							backgroundColor: bgColor
						}"
						style="background-color: #F0EEEF;border: 1px solid #4F4F4F;"
					>	
						<view style="height: 100%;position: relative;">
							<scroll-view scroll-y style="height: 90%;width: 100%;overflow: auto;">
								<view
									class="csu-swiper-title u-line-1"
									:style="{
										'padding-bottom': titlePaddingBottom
									}"
									style="text-align: center;font-family: 华文行楷;font-size:50rpx;"
								>
									{{ item.title }}
								</view>
								<u-swiper :list="picturelist[index]" :autoplay="false" v-if="img[index][0].image != ''"></u-swiper>
								<view>
									<view style="margin-top: 20rpx;overflow: hidden;">
										<audio style="float: left;padding-top: 10rpx;">
											<u-icon name="volume-up" @click="reader(item.aduio)" v-if="isplay && item.aduio != ''" size="32"></u-icon>
											<u-icon name="volume-up-fill" @click="reader(item.aduio)" v-if="!isplay && item.aduio != ''" size="32"></u-icon>
										</audio>
										<!-- <view style="font-weight: 600;font-size: 32rpx;margin-left: 45%;">文章</view> -->
										<view style="display: inline-block; width: 84rpx;height: 8rpx;background-color:#b19f8b;border-radius: 50px;margin-left: 40%;margin-top: 10rpx;"></view>
									</view>
								</view>
								<u-parse
									:html="item.content"
									:style="{
										'padding-bottom': titlePaddingBottom
									}"
									style="font-family: 华文黑体;padding: 0 20rpx;text-indent: 2em;text-align: justify;"
								></u-parse>
							</scroll-view>
							<view style="background-color: #f3f4f6; text-align: center; position: absolute;bottom:0;width: 100%;height: 10%;padding-top: 5px;" @click="toOpenMap(item.lon,item.lat,item.address)">
								<image style="width: 20px;height: 20px;" src="https://hqjsc.hzgx.info/wxapp/static/images/parking/jt.png"></image>
								<view>{{ item.address }}</view>
							</view>
						</view>
					</view>
				</swiper-item>
			</swiper>
		</view>
		<view
			class="csu-swiper-indicator"
			:style="{
				justifyContent: justifyContent,
				padding: `0 ${effect3d ? '74rpx' : '24rpx'}`
			}"
		>
			<block v-if="mode == 'number'">
				<view class="csu-indicator-item-number">{{ current + 1 }}/{{ contentlist.length }}</view>
			</block>
		</view>
		<view style="margin-bottom: 40rpx;margin-top: 110rpx;">
			<p style="font-family: 华文行楷;font-size:50rpx;text-align: center;">
				河桥镇
				<br />
				<span style="font-size:24rpx;font-family: 华文黑体;">HeQiaoZhen</span>
			</p>
		</view>
	</view>
</template>

<script>
import http from '@/utils/http.js';
import {Getlist,Getlist2} from '@/api/introduce/introduce.js';

export default {
	name: 'csu-swiper',
	props: {
		// 轮播图的数据,格式如：[{image: 'xxxx', title: 'xxxx'}，{image: 'yyyy', title: 'yyyy'}]，其中title字段可选
		list: {
			type: Array,
			default() {
				return [
				];
			}
		},
		// 是否显示title标题
		title: {
			type: Boolean,
			default: false
		},
		// 用户自定义的指示器的样式
		indicator: {
			type: Object,
			default() {
				return {};
			}
		},
		// 圆角值
		borderRadius: {
			type: [Number, String],
			default: 80
		},
		// 隔多久自动切换
		interval: {
			type: [String, Number],
			default: 3000
		},
		// 指示器的模式，rect|dot|number|round
		mode: {
			type: String,
			default: 'number'
		},
		// // list的高度，单位rpx
		// height: {
		// 	type: [Number, String],
		// 	default: 1200
		// },
		// 指示器的位置，topLeft|topCenter|topRight|bottomLeft|bottomCenter|bottomRight
		indicatorPos: {
			type: String,
			default: 'bottomCenter'
		},
		// 是否开启缩放效果
		effect3d: {
			type: Boolean,
			default: true
		},
		// 3D模式的情况下，激活item与前后item之间的距离，单位rpx
		effect3dPreviousMargin: {
			type: [Number, String],
			default: 50
		},
		// 是否自动播放
		autoplay: {
			type: Boolean,
			default: false
		},
		// 自动轮播时间间隔，单位ms
		duration: {
			type: [Number, String],
			default: 500
		},
		// 是否衔接滑动，即到最后一张时接着滑动，是佛自动切换到第一张
		circular: {
			type: Boolean,
			default: true
		},
		// 图片的形式模式
		imgMode: {
			type: String,
			default: 'aspectFill'
		},
		// 从list数组中读取的图片的属性名
		name: {
			type: String,
			default: 'image'
		},
		// 背景颜色
		bgColor: {
			type: String,
			default: '#f3f4f6'
		}
	},
	watch: {
		// 如果外部的list发生变化，判断长度是否被修改，如果前后长度不一致，重置current值，避免溢出
		list(nVal, oVal) {
			if (nVal.length !== oVal.length) this.current = 0;
		}
	},
	data() {
		return {
			ytype:"1",
			playType:"",
			current: 0, // 当前活跃的swiper-item的index
			picturelist: [
			],
			contentlist:[
			],
			isshow:false,
			img:[],
			url: http.baseUrl + 'UploadFiles/Scene/Picture/',
			Audiourl: http.baseUrl + 'UploadFiles/Scene/Audio/',
			
			isplay:true,
			innerAudioContext:wx.createInnerAudioContext(),
			background: {
			}
		};
	},
	computed: {
		justifyContent() {
			if (this.indicatorPos == 'topLeft' || this.indicatorPos == 'bottomLeft') return 'flex-start';
			if (this.indicatorPos == 'topCenter' || this.indicatorPos == 'bottomCenter') return 'center';
			if (this.indicatorPos == 'topRight' || this.indicatorPos == 'bottomRight') return 'flex-end';
		},
		titlePaddingBottom() {
			let tmp = 0;
			if (this.mode == 'none') return '12rpx';
			if (['bottomLeft', 'bottomCenter', 'bottomRight'].indexOf(this.indicatorPos) >= 0 && this.mode == 'number') {
				tmp = '40rpx';
			} else if (['bottomLeft', 'bottomCenter', 'bottomRight'].indexOf(this.indicatorPos) >= 0 && this.mode != 'number') {
				tmp = '40rpx';
			} else {
				tmp = '12rpx';
			}
			return tmp;
		}
	},
	onLoad(opt) {
		this.playType = opt.playType;
		this.dolist(this.playType);
	},
	methods: {
		toOpenMap(a,b,c) {
			let lat = parseFloat(b);
			let lon = parseFloat(a);
			uni.openLocation({
				latitude: lat,
				longitude: lon,
				name: c,
				success: function() {
					console.log('success');
				},
				fail: function(err) {
					console.log(err);
				}
			});
		},
		reader(e) {
			this.innerAudioContext.src = encodeURI(this.Audiourl + e);
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
		},
		dolist(e) {
			if(e == "1"){
				Getlist().then(res => {
					console.log(res);
					let list = res.data.data;
					if (res.data.code == 200) {
						let content = [];
						let img = [];
						let img1 = [];
						for (let k = 0; k < list.length; k++) {
							let image = [];
							let image1 = [];
							content[k] = {
								title: list[k].name,
								content: list[k].spotContent,
								aduio: list[k].audio,
								lon: list[k].lon,
								lat: list[k].lat,
								address: list[k].address
							};
							this.contentlist[k] = content[k];
							if (list[k].picture.split(',').length > 0) {
								for (let i = 0; i < list[k].picture.split(',').length; i++) {
									image[i] = {
										image: this.url + list[k].picture.split(',')[i]
									};
									image1[i] = {
										image: list[k].picture.split(',')[i]
									};
								}
								img[k] = image;
								img1[k] = image1;
							} else {
								img[k] = image;
								img1[k] = image1;
							}
							this.picturelist[k]=img[k];
							this.img[k]=img1[k];
						}
						this.isshow=true;
					}
				});
			};
			if(e== "2"){
				Getlist2().then(res => {
					console.log(852369);
					console.log(res);
					let list = res.data.data;
					if (res.data.code == 200) {
						let content = [];
						let img = [];
						let img1 = [];
						for (let k = 0; k < list.length; k++) {
							let image = [];
							let image1 = [];
							content[k] = {
								title: list[k].name,
								content: list[k].spotContent,
								aduio: list[k].audio,
								lon: list[k].lon,
								lat: list[k].lat,
								address: list[k].address
							};
							this.contentlist[k] = content[k];
							if (list[k].picture.split(',').length > 0) {
								for (let i = 0; i < list[k].picture.split(',').length; i++) {
									image[i] = {
										image: this.url + list[k].picture.split(',')[i]
									};
									image1[i] = {
										image: list[k].picture.split(',')[i]
									};
								}
								img[k] = image;
								img1[k] = image1;
							} else {
								img[k] = image;
								img1[k] = image1;
							}
							this.picturelist[k]=img[k];
							this.img[k]=img1[k];
						}
						this.isshow=true;
					}
				});
			};
		},
		listClick(index) {
			this.$emit('click', index);
		},
		change(e) {
			if(!this.isplay){
				this.innerAudioContext.pause();
				  this.isplay=true;
			}
			let current = e.detail.current;
			this.current = current;
			// 发出change事件，表示当前自动切换的index，从0开始
			this.$emit('change', current);
		},
		// 头条小程序不支持animationfinish事件，改由change事件
		// 暂不监听此事件，因为不再给swiper绑定current属性
		animationfinish(e) {
			// #ifndef MP-TOUTIAO
			// this.current = e.detail.current;
			// #endif
		}
	},
	mounted() {},
	destroyed() {
		console.log("我已经离开了！");
		this.innerAudioContext.stop();
	}
};
</script>

<style>
page{
	height: 100%;
}
.csu-swiper-wrap {
	position: relative;
	overflow: hidden;
	transform: translateY(0);
	padding-top: 200rpx;
	
}

.csu-swiper-image {
	width: 100%;
	will-change: transform;
	height: 18%;
	display: block;
	/* #ifdef H5 */
	pointer-events: none;
	/* #endif */
}

.csu-swiper-indicator {
	padding: 0 24rpx;
	position: absolute;
	display: flex;
	width: 100%;
	z-index: 1;
	margin-top: 30rpx;
}

.csu-indicator-item-rect {
	width: 26rpx;
	height: 8rpx;
	margin: 0 6rpx;
	transition: all 0.5s;
	background-color: rgba(0, 0, 0, 0.3);
}

.csu-indicator-item-rect-active {
	background-color: rgba(255, 255, 255, 0.8);
}

.csu-indicator-item-dot {
	width: 14rpx;
	height: 14rpx;
	margin: 0 6rpx;
	border-radius: 20rpx;
	transition: all 0.5s;
	background-color: rgba(0, 0, 0, 0.3);
}

.csu-indicator-item-dot-active {
	background-color: rgba(255, 255, 255, 0.8);
}

.csu-indicator-item-round {
	width: 14rpx;
	height: 14rpx;
	margin: 0 6rpx;
	border-radius: 20rpx;
	transition: all 0.5s;
	background-color: rgba(0, 0, 0, 0.3);
}

.csu-indicator-item-round-active {
	width: 34rpx;
	background-color: rgba(255, 255, 255, 0.8);
}

.csu-indicator-item-number {
	padding: 6rpx 16rpx;
	line-height: 1;
	background-color: rgba(0, 0, 0, 0.3);
	border-radius: 100rpx;
	font-size: 26rpx;
	color: rgba(255, 255, 255, 0.8);
}

.csu-list-scale {
	transform-origin: center center;
}

.csu-list-image-wrap {
	padding: 30rpx;
	width: 100%;
	height: 90%;
	flex: 1;
	transition: all 0.5s;
	overflow: hidden;
	box-sizing: content-box;
	position: relative;
}

.csu-swiper-title {
	/* position: absolute;
	background-color: rgba(0, 0, 0, 0.3); */
	bottom: 0;
	left: 0;
	width: 100%;
	font-size: 28rpx;
	padding: 12rpx 24rpx;
	/* color: rgba(255, 255, 255, 0.9); */
}

.csu-swiper-item {
	/* background-image: url(https://hqjsc.hzgx.info/wxapp/static/images/zx207.png);
	background-size: 100% 102.5%; */
	display: flex;
	overflow: hidden;
	align-items: center;
}
</style>
