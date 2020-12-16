<template>
	<view>
		<view >
			<u-swiper :list="imglist" :height="340" ></u-swiper>
		</view>
		<view>
			{{'景点名称: '}}{{spotdetail.name}}
		</view>
		<view>
			{{'介绍: '}}{{spotdetail.spotContent}}
		</view>
		<view>
			{{'地址: '}}{{spotdetail.address}}
		</view>
	</view>
</template>

<script>
	import http from '@/utils/http.js';
	import {
		getSceneSpot
	} from '@/api/scene/scene.js';
	export default{
		data(){
			return{
				spotdetail:{
					
				},
				imglist:[],
				audiolist:[],
				videolist:[],
				purl: http.baseUrl + 'UploadFiles/Scene/Picture/',
				aurl: http.baseUrl + 'UploadFiles/Scene/Picture/',
				vurl: http.baseUrl + 'UploadFiles/Scene/Picture/',
			}
		},
		onLoad(opt) {
			if(opt.guid!="")
			{
				this.dogetSceneSpot(opt.guid);
			}
		},
		methods:{
			dogetSceneSpot(guid){
				getSceneSpot(guid).then(res=>{
					if(res.data.code==200)
					{
						this.spotdetail=res.data.data;
						let imgs = [];
						if (res.data.data.picture != '') {
							for (let j = 0; j < res.data.data.picture.split(',').length; j++) {
								let images = {
									image: (this.purl + res.data.data.picture.split(',')[j]).toString()
								};
								imgs[j] = images;
							}
						}
						this.imglist = imgs;
						
						
						let video = [];
						if (res.data.data.video != '') {
							for (let j = 0; j < res.data.data.video.split(',').length; j++) {
								let videos = {
									video: (this.vurl + res.data.data.video.split(',')[j]).toString()
								};
								video[j] = videos;
							}
						}
						this.videolist = video;
						
						
						let audio = [];
						if (res.data.data.audio != '') {
							for (let j = 0; j < res.data.data.audio.split(',').length; j++) {
								let audios = {
									image: (this.aurl + res.data.data.audio.split(',')[j]).toString()
								};
								audio[j] = audios;
							}
						}
						this.audiolist = audio;
					}
					else
					{
						this.$u.toast(res.data.message);
					}
				})
			}
		}
	}
</script>

<style>
</style>
