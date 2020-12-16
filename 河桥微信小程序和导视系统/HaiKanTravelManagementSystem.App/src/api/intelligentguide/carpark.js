import axios from '@/libs/api.request'

export const getCarParkList = (data) => {
  return axios.request({
    url: 'intelligentguide/carpark/list',
    method: 'post',
    data
  })
}
// createCarPark
export const createCarPark = (data) => {
  return axios.request({
    url: 'intelligentguide/carpark/create',
    method: 'post',
    data
  })
}

//loadCarPark
export const loadCarPark = (data) => {
  return axios.request({
    url: 'intelligentguide/carpark/edit/' + data.guid,
    method: 'get'
  })
}

// editCarPark
export const editCarPark = (data) => {
  return axios.request({
    url: 'intelligentguide/carpark/edit',
    method: 'post',
    data
  })
}
// delete user
export const deleteCarPark = (ids) => {
  return axios.request({
    url: 'intelligentguide/carpark/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'intelligentguide/carpark/batch',
    method: 'get',
    params: data
  })
}

