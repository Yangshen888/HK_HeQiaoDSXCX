import axios from '@/libs/api.request'

export const getFoodList = (data) => {
  return axios.request({
    url: 'Walk/BusInfo/list',
    method: 'post',
    data
  })
}
// createFood
export const createFood = (data) => {
  return axios.request({
    url: 'Walk/BusInfo/create',
    method: 'post',
    data
  })
}

//loadFood
export const loadFood = (data) => {
  return axios.request({
    url: 'Walk/BusInfo/edit/' + data.guid,
    method: 'get'
  })
}

// editFood
export const editFood = (data) => {
  return axios.request({
    url: 'Walk/BusInfo/edit',
    method: 'post',
    data
  })
}
// delete user
export const deleteFood = (ids) => {
  return axios.request({
    url: 'Walk/BusInfo/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'Walk/BusInfo/batch',
    method: 'get',
    params: data
  })
}

