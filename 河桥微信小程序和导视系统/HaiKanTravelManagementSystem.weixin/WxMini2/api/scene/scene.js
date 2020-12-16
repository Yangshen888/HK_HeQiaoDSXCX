import http from '@/utils/http.js'

export const getSceneSpot = (guid) => {
	return http.httpRequest({
		url: 'api/v1/wx/scene/scene/getscenespot/'+guid,
		method: 'get'
	})
}