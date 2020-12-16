import axios from '@/libs/api.request'

export const getFoodList = (data) => {
  return axios.request({
    url: 'Walk/Sharing/list',
    method: 'post',
    data
  })
}
// createFood
export const createFood = (data) => {
  return axios.request({
    url: 'Walk/Sharing/create',
    method: 'post',
    data
  })
}

//loadFood
export const loadFood = (data) => {
  return axios.request({
    url: 'Walk/Sharing/edit/' + data.guid,
    method: 'get'
  })
}

// editFood
export const editFood = (data) => {
  return axios.request({
    url: 'Walk/Sharing/edit',
    method: 'post',
    data
  })
}
// delete user
export const deleteFood = (ids) => {
  return axios.request({
    url: 'Walk/Sharing/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'Walk/Sharing/batch',
    method: 'get',
    params: data
  })
}

