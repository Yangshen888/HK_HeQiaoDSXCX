import http from '@/utils/http.js'

export const GetPogoID = (data) => {
	return http.httpRequest({
		url: 'api/v1/Gereninfo/Gereninfo/conList?systemUserUuid=' + data.systemUserUuid,
		method: 'get'
	})
}

export const GetList = (data) => {
	return http.httpRequest({
		url: 'api/v1/Gereninfo/Gereninfo/GetList?systemUserUuid=' + data.systemUserUuid,
		method: 'get'
	})
}


export const GetClockList = (data) => {
	return http.httpRequest({
		url: 'api/v1/Gereninfo/Gereninfo/ParkingList',
		method: 'post'
	},data)
}

export const GetLiNew = (data) => {
	return http.httpRequest({
		url: 'api/v1/Gereninfo/Gereninfo/GetLiNew?systemUserUuid=' + data.systemUserUuid,
		method: 'get'
	})
}

export const GetLiNewAll = (data) => {
	return http.httpRequest({
		url: 'api/v1/Gereninfo/Gereninfo/GetLiNewAll',
		method: 'get'
	})
}

export const addlist = (data) => {
	return http.httpRequest({
		url: 'api/v1/Gereninfo/Gereninfo/addlist',
		method: 'post',
	}, data)
}

export const addliuyan = (data) => {
	return http.httpRequest({
		url: 'api/v1/Gereninfo/Gereninfo/addliuyan',
		method: 'post',
	}, data)
}

export const addgonglue = (data) => {
	return http.httpRequest({
		url: 'api/v1/Gereninfo/Gereninfo/addgonglue',
		method: 'post',
	}, data)
}

export const GetPrecious = (data) => {
	return http.httpRequest({
		url: 'api/v1/Treasurerecord/AppPrecious/List?guid='+data,
		method: 'get',
	})
}