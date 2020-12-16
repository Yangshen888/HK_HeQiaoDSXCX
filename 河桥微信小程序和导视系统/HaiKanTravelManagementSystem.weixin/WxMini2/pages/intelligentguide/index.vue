<template>
	<view class="wrap">
		<view class="list-wrap">
			<u-cell-group title-bg-color="rgb(243, 244, 246)" >
				<u-cell-item  :title="list[0].name" @click="openPage(list[0].path)">
				<image slot="icon" class="u-cell-icon" src="https://hqjsc.hzgx.info/wxapp/static/image/videomark.png" mode="widthFix"></image>
				</u-cell-item>
			</u-cell-group>
			<u-cell-group title-bg-color="rgb(243, 244, 246)" >
				<u-cell-item  :title="list[1].name" @click="openPage(list[1].path)" >
				<image slot="icon" class="u-cell-icon" src="https://hqjsc.hzgx.info/wxapp/static/image/food.png" mode="widthFix"></image>
				</u-cell-item>
			</u-cell-group>
			<u-cell-group title-bg-color="rgb(243, 244, 246)" >
				<u-cell-item  :title="list[2].name" @click="openPage(list[2].path)" >
				<image slot="icon" class="u-cell-icon" src="https://hqjsc.hzgx.info/wxapp/static/image/hotel.png" mode="widthFix"></image>
				</u-cell-item>
			</u-cell-group>
			<u-cell-group title-bg-color="rgb(243, 244, 246)" >
				<u-cell-item  :title="list[3].name" @click="openPage(list[3].path)" >
				<image slot="icon" class="u-cell-icon" src="https://hqjsc.hzgx.info/wxapp/static/image/specialpick.png" mode="widthFix"></image>
				</u-cell-item>
			</u-cell-group>
			<u-cell-group title-bg-color="rgb(243, 244, 246)" >
				<u-cell-item  :title="list[4].name" @click="openPage(list[4].path)" >
				<image slot="icon" class="u-cell-icon" src="https://hqjsc.hzgx.info/wxapp/static/image/carpark.png" mode="widthFix"></image>
				</u-cell-item>
			</u-cell-group>
		</view>
	</view>
</template>

<script>
	export default {
		data(){
			return{
				list:[
					{name:"语音导览",path:"./"},
					{name:"美食特产",path:"./"},
					{name:"酒店民宿",path:"./"},
					{name:"特色采摘",path:"./"},
					{name:"停车场",path:"./"}
				]
			}
			
		},
		computed: {
			
		},
		methods: {
			openPage(path) {
				uni.navigateTo({
					url:path
				})
			}
		}
	}
</script>

<style>
	.u-cell-icon {
		width: 36rpx;
		height: 36rpx;
		margin-right: 8rpx;
	}
	.wrap{
		padding: 10rpx;
			/* padding: 24rpx; */
		/* box-sizing: border-box;
		display: block;
		width: 100%; */
	}
	.list-wrap{
		position: relative;
		    /* display: -webkit-box;
		    display: -webkit-flex; */
		    /* display: flex; */
		    box-sizing: border-box;
		    width: 100%;
		    /* padding: 10px 17px; */
		    font-size: 14px;
		    line-height: 25px;
		    color: #606266;
		    background-color: #fff;
		    text-align: left;
	}
</style>
<style lang="scss" scoped>
	.u-cell-icon {
		width: 44rpx;
		height: 44rpx;
		margin-right: 8rpx;
	}
</style>