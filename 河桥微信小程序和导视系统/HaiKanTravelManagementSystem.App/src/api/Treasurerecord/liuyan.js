import axios from '@/libs/api.request'

//加载所有数据
export const onloadlist = (data) => {
  return axios.request({
    url: 'Leavemessage/Liuyan/list',
    method: 'post',
    data
  })
}



//批量操作
export const batchCommand = (data) => {
    return axios.request({
      url: 'Leavemessage/Liuyan/Batch',
      method: 'get',
      params: data
    })
  }
  
