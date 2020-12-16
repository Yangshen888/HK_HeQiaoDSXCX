import axios from '@/libs/api.request'

export const getMapmarkList = (data) => {
  return axios.request({
    url: 'intelligentguide/mapmark/list',
    method: 'post',
    data
  })
}

export const getMarkList = () => {
  return axios.request({
    url: 'intelligentguide/mapmark/marklist',
    method: 'get'
  })
}

// createMapmark
export const createMapmark = (data) => {
  return axios.request({
    url: 'intelligentguide/mapmark/create',
    method: 'post',
    data
  })
}

//loadMapmark
export const loadMapmark = (data) => {
  return axios.request({
    url: 'intelligentguide/mapmark/edit/' + data.guid,
    method: 'get'
  })
}

// editMapmark
export const editMapmark = (data) => {
  return axios.request({
    url: 'intelligentguide/mapmark/edit',
    method: 'post',
    data
  })
}
// delete user
export const deleteMapmark = (ids) => {
  return axios.request({
    url: 'intelligentguide/mapmark/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'intelligentguide/mapmark/batch',
    method: 'get',
    params: data
  })
}

