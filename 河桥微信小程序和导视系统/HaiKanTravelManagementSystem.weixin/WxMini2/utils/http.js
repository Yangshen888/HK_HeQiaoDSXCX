//const baseUrl = 'http://18069772305.qicp.vip:50547/';
// const baseUrl = 'http://218.75.96.78:28080/';
//const baseUrl = 'http://192.168.0.221:4401/';
//const baseUrl = 'https://ljfl.hztlcgj.com/';
 // const baseUrl = 'http://localhost:54321/';
const baseUrl = 'https://hqjsc.hzgx.info/';
//const baseUrl = 'https://msz-b.jiulong.yoruan.com/';
const httpRequest = (opts, data) => {
	let httpDefaultOpts = {
		url: baseUrl + opts.url,
		data: data,
		method: opts.method,
		header: opts.method == 'get' ? {
			'X-Requested-With': 'XMLHttpRequest',
			"Accept": "application/json",
			"Content-Type": "application/json; charset=UTF-8"
		} : {
			'X-Requested-With': 'XMLHttpRequest',
			'Content-Type': 'application/json; charset=UTF-8'
		},
		dataType: 'json',
	}
	let promise = new Promise(function(resolve, reject) {
		uni.request(httpDefaultOpts).then(
			(res) => {
				resolve(res[1])
			}
		).catch(
			(response) => {
				reject(response)
			}
		)
	})
	return promise
};
//带Token请求
const httpTokenRequest = (opts, data) => {
	let token = "";
	// uni.getStorage({
	// key: 'token',
	// success: function(ress) {
	// token = ress.data
	// }
	// });
	try {
		token = uni.getStorageSync('token');
	} catch (e) {
		//TODO handle the exception
	};
	//此token是登录成功后后台返回保存在storage中的
	let httpDefaultOpts = {
		url: baseUrl + opts.url,
		data: data,
		method: opts.method,
		header: opts.method == 'get' ? {
			'Authorization': 'Bearer ' + token,
			'X-Requested-With': 'XMLHttpRequest',
			"Accept": "application/json",
			"Content-Type": "application/json; charset=UTF-8"
		} : {
			'Authorization': 'Bearer ' + token,
			'X-Requested-With': 'XMLHttpRequest',
			'Content-Type': 'application/json; charset=UTF-8'
		},
		dataType: 'json',
	}
	let promise = new Promise(function(resolve, reject) {
		uni.request(httpDefaultOpts).then(
			(res) => {
				resolve(res[1])
			}
		).catch(
			(response) => {
				reject(response)
			}
		)
	})
	return promise
};

export default {
	baseUrl,
	httpRequest,
	httpTokenRequest
}
