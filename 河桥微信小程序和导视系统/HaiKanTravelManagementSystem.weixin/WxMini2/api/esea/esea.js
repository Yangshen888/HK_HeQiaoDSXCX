import http from '@/utils/http.js'


//美食推荐
export const getFoodShow = () => {
	return http.httpRequest({
		url: 'api/v1/intelligentguide/food/ShowList',
		method: 'post'
	})
}
export const getHotleFish = () => {
	return http.httpRequest({
		url: 'api/v1/intelligentguide/food/ShowList2',
		method: 'post'
	})
}

//特产
export const gettechanShow = () => {
	return http.httpRequest({
		url: 'api/v1/intelligentguide/food/ShowtcList',
		method: 'post'
	})
}
//特产
export const gettechanShow2 = () => {
	return http.httpRequest({
		url: 'api/v1/intelligentguide/food/ShowtcList2',
		method: 'post'
	})
}

export const gettechanShow3 = () => {
	return http.httpRequest({
		url: 'api/v1/intelligentguide/food/ShowtcList3',
		method: 'post'
	})
}

export const getPickShow = () => {
	return http.httpRequest({
		url: 'api/v1/pick/pick/ShowList',
		method: 'post'
	})
}
export const getPickShow2 = () => {
	return http.httpRequest({
		url: 'api/v1/pick/pick/ShowList2',
		method: 'post'
	})
}
export const getPickShow3 = () => {
	return http.httpRequest({
		url: 'api/v1/pick/pick/ShowList3',
		method: 'post'
	})
}

export const getHotelShow = () => {
	return http.httpRequest({
		url: 'api/v1/pick/hotel/ShowList',
		method: 'post'
	})
}
export const getHotelShow2 = () => {
	return http.httpRequest({
		url: 'api/v1/pick/hotel/ShowList2',
		method: 'post'
	})
}