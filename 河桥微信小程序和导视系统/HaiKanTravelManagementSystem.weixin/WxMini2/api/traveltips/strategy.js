import http from '@/utils/http.js'
//攻略列表
export const getStrategyList = (data) => {
	return http.httpRequest({
		url: 'api/v1/wx/traveltips/strategy/list',
		method: 'post'
	},data)
}
export const getStrategyList2 = (data) => {
	return http.httpRequest({
		url: 'api/v1/wx/traveltips/strategy/list2',
		method: 'post'
	},data)
}
//自驾路线列表
export const getStrategyRoadList = (data) => {
	return http.httpRequest({
		url: 'api/v1/wx/traveltips/strategy/roadlist',
		method: 'post'
	},data)
}
export const getStrategyRoadList2 = (data) => {
	return http.httpRequest({
		url: 'api/v1/wx/traveltips/strategy/roadlist2',
		method: 'post'
	},data)
}
//民俗文化列表
export const getminsuList = (data) => {
	return http.httpRequest({
		url: 'api/v1/wx/traveltips/mswh/minsuList',
		method: 'post'
	},data)
}

//民俗文化浏览量
export const misuliulan = (guid) => {
	return http.httpRequest({
		url: 'api/v1/wx/traveltips/mswh/liulan/'+guid,
		method: 'get'
	})
}
//游玩攻略浏览量
export const misuliulan1 = (guid) => {
	return http.httpRequest({
		url: 'api/v1/wx/traveltips/strategy/youwan/'+guid,
		method: 'get'
	})
}
//路线推荐浏览量
export const misuliulan2 = (guid) => {
	return http.httpRequest({
		url: 'api/v1/wx/traveltips/strategy/liulan/'+guid,
		method: 'get'
	})
}



//详情
export const getStrategyDetail = (guid) => {
	return http.httpRequest({
		url: 'api/v1/wx/traveltips/strategy/strategydetail/'+guid,
		method: 'get'
	})
}

//路线详情
export const getluxuan = (guid) => {
	return http.httpRequest({
		url: 'api/v1/wx/traveltips/strategy/getluxuan/'+guid,
		method: 'get'
	})
}

//民俗文化详情
export const getfff = (guid) => {
	return http.httpRequest({
		url: 'api/v1/wx/traveltips/strategy/getfff/'+guid,
		method: 'get'
	})
}

