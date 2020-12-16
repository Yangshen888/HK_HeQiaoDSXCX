import axios from '@/libs/api.request'

export const getPublicityList = (data) => {
  return axios.request({
    url: 'spotpublicity/publicity/list',
    method: 'post',
    data
  })
}
// createPublicity
export const createPublicity = (data) => {
  return axios.request({
    url: 'spotpublicity/publicity/create',
    method: 'post',
    data
  })
}

//loadPublicity
export const loadPublicity = (data) => {
  return axios.request({
    url: 'spotpublicity/publicity/edit/' + data.guid,
    method: 'get'
  })
}

// editPublicity
export const editPublicity = (data) => {
  return axios.request({
    url: 'spotpublicity/publicity/edit',
    method: 'post',
    data
  })
}
// delete user
export const deletePublicity = (ids) => {
  return axios.request({
    url: 'spotpublicity/publicity/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'spotpublicity/publicity/batch',
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
export const Publicitytypelist = () => {
  return axios.request({
    url: 'spotpublicity/publicity/Publicitytypelist',
    method: 'get'
  })
}
