import axios from '@/libs/api.request'

export const getFoodList = (data) => {
  return axios.request({
    url: 'intelligenttravel/bank/list',
    method: 'post',
    data
  })
}
// createGtoilet
export const createFood = (data) => {
  return axios.request({
    url: 'intelligenttravel/bank/create',
    method: 'post',
    data
  })
}

//loadGtoilet
export const loadFood = (data) => {
  return axios.request({
    url: 'intelligenttravel/bank/edit/' + data.guid,
    method: 'get'
  })
}

// editGtoilet
export const editFood = (data) => {
  return axios.request({
    url: 'intelligenttravel/bank/edit',
    method: 'post',
    data
  })
}
// delete
export const deleteFood = (ids) => {
  return axios.request({
    url: 'intelligenttravel/bank/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'intelligenttravel/bank/batch',
    method: 'get',
    params: data
  })
}
//导入
export const GtoiletImport = (data) => {
  return axios.request({
    url: 'intelligenttravel/gtoilet/gtoiletimport',
    method: 'post',
    data
  })
}

//导出
export const GtoiletExport = (ids) => {
  return axios.request({
    url: 'intelligenttravel/gtoilet/gtoiletexport?ids=' + ids,
    method: 'get'
  })
}
