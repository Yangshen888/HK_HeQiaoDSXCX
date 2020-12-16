import axios from '@/libs/api.request'

export const getPublicityPictureList = (data) => {
  return axios.request({
    url: 'Guide/PublicityPicture/list',
    method: 'post',
    data
  })
}
// createPublicityPicture
export const createPublicityPicture = (data) => {
  return axios.request({
    url: 'Guide/PublicityPicture/create',
    method: 'post',
    data
  })
}

//loadPublicityPicture
export const loadPublicityPicture = (data) => {
  return axios.request({
    url: 'Guide/PublicityPicture/load/' + data.guid,
    method: 'get'
  })
}

// editPublicityPicture
export const editPublicityPicture = (data) => {
  return axios.request({
    url: 'Guide/PublicityPicture/edit',
    method: 'post',
    data
  })
}
// delete user
export const deletePublicityPicture = (ids) => {
  return axios.request({
    url: 'Guide/PublicityPicture/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'Guide/PublicityPicture/batch',
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
// export const PublicityPicturetypelist = () => {
//   return axios.request({
//     url: 'Guide/PublicityPicture/PublicityPicturetypelist',
//     method: 'get'
//   })
// }
