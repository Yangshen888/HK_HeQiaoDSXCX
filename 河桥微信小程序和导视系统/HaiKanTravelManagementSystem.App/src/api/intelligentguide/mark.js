import axios from '@/libs/api.request'

export const getMarkList = (data) => {
  return axios.request({
    url: 'intelligentguide/mark/list',
    method: 'post',
    data
  })
}
// createMark
export const createMark = (data) => {
  return axios.request({
    url: 'intelligentguide/mark/create',
    method: 'post',
    data
  })
}

//loadMark
export const loadMark = (data) => {
  return axios.request({
    url: 'intelligentguide/mark/edit/' + data.guid,
    method: 'get'
  })
}

// editMark
export const editMark = (data) => {
  return axios.request({
    url: 'intelligentguide/mark/edit',
    method: 'post',
    data
  })
}
// delete user
export const deleteMark = (ids) => {
  return axios.request({
    url: 'intelligentguide/mark/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'intelligentguide/mark/batch',
    method: 'get',
    params: data
  })
}

