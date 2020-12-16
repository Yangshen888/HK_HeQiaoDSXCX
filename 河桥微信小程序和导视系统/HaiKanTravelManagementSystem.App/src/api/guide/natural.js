import axios from '@/libs/api.request'

export const getNaturalResourcesList = (data) => {
  return axios.request({
    url: 'Guide/NaturalResources/list',
    method: 'post',
    data
  })
}
// createNaturalResources
export const createNaturalResources = (data) => {
  return axios.request({
    url: 'Guide/NaturalResources/create',
    method: 'post',
    data
  })
}

//loadNaturalResources
export const loadNaturalResources = (data) => {
  return axios.request({
    url: 'Guide/NaturalResources/load/' + data.guid,
    method: 'get'
  })
}

// editNaturalResources
export const editNaturalResources = (data) => {
  return axios.request({
    url: 'Guide/NaturalResources/edit',
    method: 'post',
    data
  })
}
// delete user
export const deleteNaturalResources = (ids) => {
  return axios.request({
    url: 'Guide/NaturalResources/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'Guide/NaturalResources/batch',
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
// export const NaturalResourcestypelist = () => {
//   return axios.request({
//     url: 'Guide/NaturalResources/NaturalResourcestypelist',
//     method: 'get'
//   })
// }
