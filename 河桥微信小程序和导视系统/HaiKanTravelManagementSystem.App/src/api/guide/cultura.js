import axios from '@/libs/api.request'

export const getCulturalIntroducList = (data) => {
  return axios.request({
    url: 'Guide/CulturalIntroduc/list',
    method: 'post',
    data
  })
}
// createCulturalIntroduc
export const createCulturalIntroduc = (data) => {
  return axios.request({
    url: 'Guide/CulturalIntroduc/create',
    method: 'post',
    data
  })
}

//loadCulturalIntroduc
export const loadCulturalIntroduc = (data) => {
  return axios.request({
    url: 'Guide/CulturalIntroduc/load/' + data.guid,
    method: 'get'
  })
}

// editCulturalIntroduc
export const editCulturalIntroduc = (data) => {
  return axios.request({
    url: 'Guide/CulturalIntroduc/edit',
    method: 'post',
    data
  })
}
// delete user
export const deleteCulturalIntroduc = (ids) => {
  return axios.request({
    url: 'Guide/CulturalIntroduc/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'Guide/CulturalIntroduc/batch',
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
