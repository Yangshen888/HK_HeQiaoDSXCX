import http from '@/utils/http.js'
//攻略列表
export const Getlist = () => {
	return http.httpRequest({
		url: 'api/v1/Introduce/AppIntroduce/List',
		method: 'get'
	})
}
export const Getlist2 = () => {
	return http.httpRequest({
		url: 'api/v1/Introduce/AppIntroduce/List2',
		method: 'get'
	})
}