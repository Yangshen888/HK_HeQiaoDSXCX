import axios from '@/libs/api.request'

export const getArticleList = (data) => {
  return axios.request({
    url: 'ArticleManagement/Article/list',
    method: 'post',
    data
  })
}
// createPublicity
export const createArticle = (data) => {
  console.log("ccccccc")
  return axios.request({
    url: 'ArticleManagement/Article/create',
    method: 'post',
    data
  })
}

//loadPublicity
export const loadArticle = (data) => {
  return axios.request({
    url: 'ArticleManagement/Article/edit/' + data.guid,
    method: 'get'
  })
}

// editPublicity
export const editArticle = (data) => {
  return axios.request({
    url: 'ArticleManagement/Article/edit',
    method: 'post',
    data
  })
}
// delete user
export const deleteArticle = (ids) => {
  return axios.request({
    url: 'ArticleManagement/Article/delete/' + ids,
    method: 'get'
  })
}

// batch command
export const batchCommand = (data) => {
  return axios.request({
    url: 'ArticleManagement/Article/batch',
    method: 'get',
    params: data
  })
}
// export const deletetoFile = (data) => {
//   return axios.request({
//     url: 'common/common/DeleteFile',
//     method: 'post',
//     data
//   })
// }
export const Articletypelist = () => {
  return axios.request({
    url: 'ArticleManagement/Article/Articletypelist',
    method: 'get'
  })
}
