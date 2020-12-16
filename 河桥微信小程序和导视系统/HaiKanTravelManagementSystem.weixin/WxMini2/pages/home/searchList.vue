<template>
	<list>
		<!-- 注意事项: 不能使用 index 作为 key 的唯一标识 -->
		<cell v-for="(item, index) in dataList" :key="item.guid">
			<view @click="tiaozhuan(item.url)" style="height: 80rpx;line-height: 80rpx; width: 80%;margin: 30rpx auto;box-shadow: 0 0 0 2px rgba(0,0,0,0.2);border-radius: 10rpx;padding: 0 20rpx;">
				<text>{{item.text}}</text>
				<view style="float: right;">详情&nbsp;>></view>
			</view>
		</cell>
	</list>

</template>

<script>
	import {
		getSearchList
	} from '@/api/home/home.js';
	export default {
	    data () {
	      return {
	        dataList: [],

	      }
	    },
		onLoad(option) {
			this.loadlist(option.text);
		},
		methods:{
			loadlist(text) {
				getSearchList({kw:text}).then(res=>{
					if (res.data.code == 200) {
						if (res.data.data.length>0) {
							this.dataList=res.data.data;
						} else{
							console.log("空");
						}
						
						
					} else{
						uni.showModal({
							title: res.data.message,
							showCancel: false
						});
					}
				});
			},
			tiaozhuan(url){
				uni.navigateTo({
					url: url
				})
			}
			
		}
	  }
</script>

<style>
</style>
