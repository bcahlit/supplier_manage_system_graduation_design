import request from '@/plugin/axios'

export function getComments (data) {
  console.log(data)
  return request({
    url: '/comments',
    method: 'get',
    params: data
  })
}
export function addComment (data) {
  return request({
    url: '/comments',
    method: 'post',
    data
  })
}
export function deleteComment (data) {
  return request({
    url: `/comments/${data.id}`,
    method: 'delete'
  })
}
export function updateComment (data) {
  // let cId=data.id
  return request({
    url: `/comments/${data.id}`,
    method: 'PATCH',
    data
  })
}
