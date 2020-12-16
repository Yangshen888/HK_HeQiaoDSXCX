import axios from '@/libs/api.request'

export const getPublicitytypeList = (data) => {
  return axios.request({
    url: 'ArticleManagement/ArticleType/list',
    method: 'post',
    data
  })
}
// createPublicitytype
export const createPublicitytype = (data) => {
  return axios.request({
    url: 'ArticleManagement/ArticleType/create',
    method: 'post',
    data
  })
}

//loadPublicitytype
export const loadPublicitytype = (data) => {
  return axios.request({
    url: 'ArticleManagement/ArticleType/edit/' + data.guid,
    method: 'get'
  })
}

// editPublicitytype
export const editPublicitytype = (data) => {
  return axios.request({
    url: 'ArticleManagement/ArticleType/edit',
    method: 'post',
    data
  })
}
// delete user
export const deletePublicitytype = (ids) => {
  return axios.request({
    url: 'ArticleManagement/ArticleType/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'ArticleManagement/ArticleType/batch',
    method: 'get',
    params: data
  })
}

