import axios from '@/libs/api.request'

export const getStrategyList = (data) => {
  return axios.request({
    url: 'Strategy/Strategy/list',
    method: 'post',
    data
  })
}
// createStrategy
export const createStrategy = (data) => {
  return axios.request({
    url: 'Strategy/Strategy/create',
    method: 'post',
    data
  })
}

//loadStrategy
export const loadStrategy = (data) => {
  return axios.request({
    url: 'Strategy/Strategy/edit/' + data.guid,
    method: 'get'
  })
}

// editStrategy
export const editggboy = (data) => {
  return axios.request({
    url: 'Strategy/Strategy/editggboy',
    method: 'post',
    data
  })
}
// delete user
export const deleteStrategy = (ids) => {
  return axios.request({
    url: 'Strategy/Strategy/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'Strategy/Strategy/batch',
    method: 'get',
    params: data
  })
}
export const deletetoFile = (data) => {
  return axios.request({
    url: 'common/common/DeleteFile',
    method: 'post',
    data
  })
}


export const loadRelationships = () => {
  return axios.request({
    url: 'Strategy/Strategy/listvideo',
    method: 'get'
  })
}


export const createRelationships = (data) => {
  return axios.request({
    url: 'Strategy/Strategy/createvideo',
    method: 'post',
    data
  })
}