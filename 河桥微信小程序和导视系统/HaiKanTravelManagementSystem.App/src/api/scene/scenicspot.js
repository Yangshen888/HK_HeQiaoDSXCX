import axios from '@/libs/api.request'

export const getScenicspotList = (data) => {
  return axios.request({
    url: 'scene/scenicspot/list',
    method: 'post',
    data
  })
}
// createScenicspot
export const createScenicspot = (data) => {
  return axios.request({
    url: 'scene/scenicspot/create',
    method: 'post',
    data
  })
}

//loadScenicspot
export const loadScenicspot = (data) => {
  return axios.request({
    url: 'scene/scenicspot/edit/' + data.guid,
    method: 'get'
  })
}

// editScenicspot
export const editScenicspot = (data) => {
  return axios.request({
    url: 'scene/scenicspot/edit',
    method: 'post',
    data
  })
}
// delete user
export const deleteScenicspot = (ids) => {
  return axios.request({
    url: 'scene/scenicspot/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'scene/scenicspot/batch',
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

export const getjingqu = () => {
  return axios.request({
    url: 'scene/scenicspot/jingqu',
    method: 'get'
  })
}