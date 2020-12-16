import Vue from 'vue'
import App from './App'

Vue.config.productionTip = false

App.mpType = 'app'

// 引入全局uView
import uView from 'uview-ui'
Vue.use(uView);


// 此处为演示vuex使用，非uView的功能部分
import store from '@/store'

// 引入uView提供的对vuex的简写法文件
let vuexStore = require('@/store/$u.mixin.js')
Vue.mixin(vuexStore)

// 引入uView对小程序分享的mixin封装
let mpShare = require('uview-ui/libs/mixin/mpShare.js');
Vue.mixin(mpShare)

//全局函数
import utils from '@/global/unitmethod.js'
Vue.prototype.utils=utils;



// i18n部分的配置
// 引入语言包，注意路径
// import Chinese from '@/common/locales/zh.js';
// import English from '@/common/locales/en.js';

// // VueI18n
// import VueI18n from 'vue-i18n'

// // VueI18n
// Vue.use(VueI18n)

// const i18n = new VueI18n({
// 	// 默认语言
// 	locale: 'zh',
// 	// 引入语言文件
// 	messages: {
// 		'zh': Chinese,
// 		'en': English,
// 	}
// })

// // 由于微信小程序的运行机制问题，需声明如下一行，H5和APP非必填
// Vue.prototype._i18n = i18n

const app = new Vue({
	// i18n,
	store,
    ...App
})
app.$mount()
