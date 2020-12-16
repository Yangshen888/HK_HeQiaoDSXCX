import axios from '@/libs/api.request'

export const getPromotionalvideoList = (data) => {
  return axios.request({
    url: 'spotpublicity/promotionalvideo/list',
    method: 'post',
    data
  })
}
// createPromotionalvideo
export const createPromotionalvideo = (data) => {
  return axios.request({
    url: 'spotpublicity/promotionalvideo/create',
    method: 'post',
    data
  })
}

//loadPromotionalvideo
export const loadPromotionalvideo = (data) => {
  return axios.request({
    url: 'spotpublicity/promotionalvideo/edit/' + data.guid,
    method: 'get'
  })
}

// editPromotionalvideo
export const editPromotionalvideo = (data) => {
  return axios.request({
    url: 'spotpublicity/promotionalvideo/edit',
    method: 'post',
    data
  })
}
// delete user
export const deletePromotionalvideo = (ids) => {
  return axios.request({
    url: 'spotpublicity/promotionalvideo/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'spotpublicity/promotionalvideo/batch',
    method: 'get',
    params: data
  })
}

