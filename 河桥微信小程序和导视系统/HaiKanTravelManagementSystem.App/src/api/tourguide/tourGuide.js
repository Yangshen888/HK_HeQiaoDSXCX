import axios from '@/libs/api.request'

export const getList = (data) => {
  return axios.request({
    url: 'TourGuide/TourGuide/List',
    method: 'post',
    data
  })
}
  
export const GetCreate = (data) => {
    return axios.request({
      url: 'TourGuide/TourGuide/Create',
      method: 'post',
      data
    })
  }
  
  export const GetEdit = (data) => {
    return axios.request({
      url: 'TourGuide/TourGuide/Edit',
      method: 'post',
      data
    })
  }
  
  export const GetShow = (data) => {
    return axios.request({
      url: 'TourGuide/TourGuide/Show?guid=' + data,
      method: 'get',
    })
  }
  
  // delete department
  export const deleteDepartment = (ids) => {
    return axios.request({
      url: 'TourGuide/TourGuide/delete/' + ids,
      method: 'get'
    })
  }
  
  // batch command
  export const batchCommand = (data) => {
    return axios.request({
      url: 'TourGuide/TourGuide/batch',
      method: 'get',
      params: data
    })
  }