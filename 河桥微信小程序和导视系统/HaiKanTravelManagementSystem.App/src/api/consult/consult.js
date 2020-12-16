import axios from '@/libs/api.request'

export const getList = (data) => {
  return axios.request({
    url: 'Consult/Consult/List',
    method: 'post',
    data
  })
}
  
export const GetCreate = (data) => {
    return axios.request({
      url: 'Consult/Consult/Create',
      method: 'post',
      data
    })
  }
  
  export const GetEdit = (data) => {
    return axios.request({
      url: 'Consult/Consult/Edit',
      method: 'post',
      data
    })
  }
  
  export const GetShow = (data) => {
    return axios.request({
      url: 'Consult/Consult/Show?guid=' + data,
      method: 'get',
    })
  }
  
  // delete department
  export const deleteDepartment = (ids) => {
    return axios.request({
      url: 'Consult/Consult/delete/' + ids,
      method: 'get'
    })
  }
  
  // batch command
  export const batchCommand = (data) => {
    return axios.request({
      url: 'Consult/Consult/batch',
      method: 'get',
      params: data
    })
  }