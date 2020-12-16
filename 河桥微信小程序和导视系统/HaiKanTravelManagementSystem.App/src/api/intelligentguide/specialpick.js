import axios from '@/libs/api.request'

export const getSpecialPickList = (data) => {
  return axios.request({
    url: 'intelligentguide/specialpick/list',
    method: 'post',
    data
  })
}
// createSpecialPick
export const createSpecialPick = (data) => {
  return axios.request({
    url: 'intelligentguide/specialpick/create',
    method: 'post',
    data
  })
}

//loadSpecialPick
export const loadSpecialPick = (data) => {
  return axios.request({
    url: 'intelligentguide/specialpick/edit/' + data.guid,
    method: 'get'
  })
}

// editSpecialPick
export const editSpecialPick = (data) => {
  return axios.request({
    url: 'intelligentguide/specialpick/edit',
    method: 'post',
    data
  })
}
// delete user
export const deleteSpecialPick = (ids) => {
  return axios.request({
    url: 'intelligentguide/specialpick/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'intelligentguide/specialpick/batch',
    method: 'get',
    params: data
  })
}

