import http from '@/utils/http.js'

// export const GetWechat = (data) => {
// 	return http.httpRequest({
// 		url: 'api/v1/wxopenid/wxinfo/GetWechat',
// 		method: 'post'
// 	},data)
// }

// export const getWXOpenAuth = (data) => {
// 	return http.httpRequest({
// 		url: 'api/oauth/WXOpenAuth?openid=' + data,
// 		method: 'get'
// 	})
// }

// export const WXAuth = (data) => {
// 	return http.httpRequest({
// 		url: 'api/oauth/WXAuth',
// 		method: 'post'
// 	},data)
// }

export const GetWechat = (data) => {
	return http.httpRequest({
		url: 'api/v1/wxopenid/wxinfo/GetWechat',
		method: 'post'
	},data)
}

export const getWXOpenAuth = (data) => {
	return http.httpRequest({
		url: 'api/Oauth/WXOpenAuth?openid=' + data,
		method: 'get'
	})
}

export const WXAuth = (data) => {
	return http.httpRequest({
		url: 'api/oauth/WXAuth',
		method: 'post'
	},data)
}

export const WXPhone = (data) => {
	return http.httpRequest({
		url: 'api/oauth/WXPhone',
		method: 'post'
	},data)
}