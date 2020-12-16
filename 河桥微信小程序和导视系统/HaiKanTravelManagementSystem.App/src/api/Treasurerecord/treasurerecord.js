import axios from '@/libs/api.request'

//加载所有数据
export const onloadlist = (data) => {
  return axios.request({
    url: 'Treasurerecord/Baozang/list',
    method: 'post',
    data
  })
}





// // delete user
// export const deletePublicity = (ids) => {
//   return axios.request({
//     url: 'spotpublicity/publicity/delete/' + ids,
//     method: 'get'
//   })
// }




