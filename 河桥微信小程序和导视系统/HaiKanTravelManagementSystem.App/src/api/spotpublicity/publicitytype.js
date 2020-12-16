import axios from '@/libs/api.request'

export const getPublicitytypeList = (data) => {
  return axios.request({
    url: 'spotpublicity/publicitytype/list',
    method: 'post',
    data
  })
}
// createPublicitytype
export const createPublicitytype = (data) => {
  return axios.request({
    url: 'spotpublicity/publicitytype/create',
    method: 'post',
    data
  })
}

//loadPublicitytype
export const loadPublicitytype = (data) => {
  return axios.request({
    url: 'spotpublicity/publicitytype/edit/' + data.guid,
    method: 'get'
  })
}

// editPublicitytype
export const editPublicitytype = (data) => {
  return axios.request({
    url: 'spotpublicity/publicitytype/edit',
    method: 'post',
    data
  })
}
// delete user
export const deletePublicitytype = (ids) => {
  return axios.request({
    url: 'spotpublicity/publicitytype/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'spotpublicity/publicitytype/batch',
    method: 'get',
    params: data
  })
}

