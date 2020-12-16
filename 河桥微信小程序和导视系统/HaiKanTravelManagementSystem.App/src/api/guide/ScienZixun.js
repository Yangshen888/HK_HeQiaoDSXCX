import axios from '@/libs/api.request'

export const getCulturalIntroducList = (data) => {
  return axios.request({
    url: 'Guide/ScienZixun/list',
    method: 'post',
    data
  })
}
// createCulturalIntroduc
export const createCulturalIntroduc = (data) => {
  return axios.request({
    url: 'Guide/ScienZixun/create',
    method: 'post',
    data
  })
}

//loadCulturalIntroduc
export const loadCulturalIntroduc = (data) => {
  return axios.request({
    url: 'Guide/ScienZixun/load/' + data.guid,
    method: 'get'
  })
}

// editCulturalIntroduc
export const editCulturalIntroduc = (data) => {
  return axios.request({
    url: 'Guide/ScienZixun/edit',
    method: 'post',
    data
  })
}
// delete user
export const deleteCulturalIntroduc = (ids) => {
  return axios.request({
    url: 'Guide/ScienZixun/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'Guide/ScienZixun/batch',
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
// export const CulturalIntroductypelist = () => {
//   return axios.request({
//     url: 'Guide/CulturalIntroduc/CulturalIntroductypelist',
//     method: 'get'
//   })
// }
