import axios from '@/libs/api.request'

export const getSpecialPickList = (data) => {
  return axios.request({
    url: 'Strategy/TjLuxian/list',
    method: 'post',
    data
  })
}
// createSpecialPick
export const createSpecialPick = (data) => {
  return axios.request({
    url: 'Strategy/TjLuxian/create',
    method: 'post',
    data
  })
}

//loadSpecialPick
export const loadSpecialPick = (data) => {
  return axios.request({
    url: 'Strategy/TjLuxian/edit/' + data.guid,
    method: 'get'
  })
}

// editSpecialPick
export const editSpecialPick = (data) => {
  return axios.request({
    url: 'Strategy/TjLuxian/edit',
    method: 'post',
    data
  })
}
// delete user
export const deleteSpecialPick = (ids) => {
  return axios.request({
    url: 'Strategy/TjLuxian/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'Strategy/TjLuxian/batch',
    method: 'get',
    params: data
  })
}

