import axios from '@/libs/api.request'

export const getParkinglotList = (data) => {
  return axios.request({
    url: 'intelligenttravel/parkinglot/list',
    method: 'post',
    data
  })
}
// createParkinglot
export const createParkinglot = (data) => {
  return axios.request({
    url: 'intelligenttravel/parkinglot/create',
    method: 'post',
    data
  })
}

//loadParkinglot
export const loadParkinglot = (data) => {
  return axios.request({
    url: 'intelligenttravel/parkinglot/edit/' + data.guid,
    method: 'get'
  })
}

// editParkinglot
export const editParkinglot = (data) => {
  return axios.request({
    url: 'intelligenttravel/parkinglot/edit',
    method: 'post',
    data
  })
}
// delete
export const deleteParkinglot = (ids) => {
  return axios.request({
    url: 'intelligenttravel/parkinglot/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'intelligenttravel/parkinglot/batch',
    method: 'get',
    params: data
  })
}
//导入
export const ParkinglotImport = (data) => {
  return axios.request({
    url: 'intelligenttravel/parkinglot/parkinglotimport',
    method: 'post',
    data
  })
}

//导出
export const ParkinglotExport = (ids) => {
  return axios.request({
    url: 'intelligenttravel/parkinglot/parkinglotexport?ids=' + ids,
    method: 'get'
  })
}
