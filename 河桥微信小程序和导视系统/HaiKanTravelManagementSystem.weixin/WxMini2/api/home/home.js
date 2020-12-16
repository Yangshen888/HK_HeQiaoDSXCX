import http from '@/utils/http.js'

export const getSceneList = (data) => {
	return http.httpRequest({
		url: 'api/v1/wx/home/home/list',
		method: 'post'
	},data)
}

export const getRecommend = (data) => {
	return http.httpRequest({
		url: 'api/v1/wx/home/home/Recommend',
		method: 'post'
	},data)
}

export const getDiscovery = (data) => {
	return http.httpRequest({
		url: 'api/v1/wx/home/home/Discovery',
		method: 'post'
	},data)
}
export const infolist = (data) => {
	return http.httpRequest({
		url: 'api/v1/wx/home/home/infolist1',
		method: 'post'
	},data)
}

export const infolist2 = (data) => {
	return http.httpRequest({
		url: 'api/v1/wx/home/home/infolist2',
		method: 'post'
	},data)
}
export const getInfo = (data) => {
	return http.httpRequest({
		url: 'api/v1/wx/home/home/Info?type='+data.type+'&uuid='+data.uuid,
		method: 'get'
	})
}

export const getSearchList = (data) => {
	return http.httpRequest({
		url: 'api/v1/wx/home/home/list2',
		method: 'post'
	},data)
}

export const getHotelist = () => {
	return http.httpRequest({
		url: 'api/v1/wx/home/home/hotellist',
		method: 'post'
	})
}

export const getFoodorList = () => {
	return http.httpRequest({
		url: 'api/v1/wx/home/home/foodorList',
		method: 'post'
	})
}

export const getFoodlist = () => {
	return http.httpRequest({
		url: 'api/v1/wx/home/home/foodlist',
		method: 'post'
	})
}
export const getPicklist = () => {
	return http.httpRequest({
		url: 'api/v1/wx/home/home/picklist',
		method: 'post'
	})
}

export const getScienlist = (data) => {
	return http.httpRequest({
		url: 'api/v1/wx/home/home/scienlist?UserUuid=' + data.systemUserUuid,
		method: 'get'
	})
}


export const getGtoiletlist = () => {
	return http.httpRequest({
		url: 'api/v1/wx/home/home/gtoiletlist',
		method: 'post'
	})
}
//打卡
export const addlist = (data) => {
	return http.httpRequest({
		url: 'api/v1/wx/home/home/addlist',
		method: 'post',
	}, data)
}


export const gtoiletlist = () => {
	return http.httpRequest({
		url: 'api/v1/wx/home/home/ggggtoiletlist',
		method: 'post'
	})
}
export const hospitallist = () => {
	return http.httpRequest({
		url: 'api/v1/wx/home/home/hospitallist',
		method: 'post'
	})
}
export const banklist = () => {
	return http.httpRequest({
		url: 'api/v1/wx/home/home/banklist',
		method: 'post'
	})
}