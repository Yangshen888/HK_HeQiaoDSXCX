import http from '@/utils/http.js'

export const getParkingList = (data) => {
	return http.httpRequest({
		url: 'api/v1/Parking/ParkingLot/ParkingList',
		method: 'post'
	},data)
}

export const getParkingInfo = (data) => {
	return http.httpRequest({
		url: 'api/v1/Parking/ParkingLot/ParkingInfo?uuid='+data,
		method: 'get',
	})
}
export const getBusinfoList = (data) => {
        return http.httpRequest({
                url: 'api/v1/Parking/ParkingLot/Businfo?uuid='+data,
                method: 'get',
        })
}