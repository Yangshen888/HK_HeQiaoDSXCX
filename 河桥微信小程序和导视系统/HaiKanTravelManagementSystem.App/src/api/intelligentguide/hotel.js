import axios from '@/libs/api.request'

export const getHotelList = (data) => {
  return axios.request({
    url: 'intelligentguide/hotel/list',
    method: 'post',
    data
  })
}
// createHotel
export const createHotel = (data) => {
  return axios.request({
    url: 'intelligentguide/hotel/create',
    method: 'post',
    data
  })
}

//loadHotel
export const loadHotel = (data) => {
  return axios.request({
    url: 'intelligentguide/hotel/edit/' + data.guid,
    method: 'get'
  })
}

// editHotel
export const editHotel = (data) => {
  return axios.request({
    url: 'intelligentguide/hotel/edit',
    method: 'post',
    data
  })
}
// delete user
export const deleteHotel = (ids) => {
  return axios.request({
    url: 'intelligentguide/hotel/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'intelligentguide/hotel/batch',
    method: 'get',
    params: data
  })
}


export const getDecompInfoList = (data) => {
  return axios.request({
    url: 'intelligentguide/hotel/DecompInfo',
    method: 'post',
    data
  })
}


// createhotel
export const createDecompInfo = (data) => {
return axios.request({
  url: 'intelligentguide/hotel/InfoCreate',
  method: 'post',
  data
})
}


export const loadDecompInfo = (data) => {
return axios.request({
  url: 'intelligentguide/hotel/InfoLoad?guid=' + data,
  method: 'get'
})
}


export const editDecompInfo = (data) => {
return axios.request({
  url: 'intelligentguide/hotel/InfoEdit',
  method: 'post',
  data
})
}
// delete user
export const deleteDecompInfo = (ids) => {
return axios.request({
  url: 'intelligentguide/hotel/InfoDelete/' + ids,
  method: 'get'
})
}

// batch command
export const batchDecompInfoCommand = (data) => {
return axios.request({
  url: 'intelligentguide/hotel/InfoBatch',
  method: 'get',
  params: data
})
}
