import axios from '@/libs/api.request'

export const getVideoMarkList = (data) => {
  return axios.request({
    url: 'intelligentguide/videomark/list',
    method: 'post',
    data
  })
}
// createVideoMark
export const createVideoMark = (data) => {
  return axios.request({
    url: 'intelligentguide/videomark/create',
    method: 'post',
    data
  })
}

//loadVideoMark
export const loadVideoMark = (data) => {
  return axios.request({
    url: 'intelligentguide/videomark/edit/' + data.guid,
    method: 'get'
  })
}

// editVideoMark
export const editVideoMark = (data) => {
  return axios.request({
    url: 'intelligentguide/videomark/edit',
    method: 'post',
    data
  })
}
// delete user
export const deleteVideoMark = (ids) => {
  return axios.request({
    url: 'intelligentguide/videomark/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'intelligentguide/videomark/batch',
    method: 'get',
    params: data
  })
}

