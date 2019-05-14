import request from '@/plugin/axios'

export function getUsers (data) {
  return request({
    url: '/users',
    method: 'get',
    params: data
  })
}
export function addUser (data) {
  console.log(data)
  return request({
    url: '/users',
    method: 'post',
    data
  })
}
export function deleteUser (data) {
  return request({
    url: `/users/${data.id}`,
    method: 'delete'
  })
}
export function updateUser (data) {
  // let cId=data.id
  return request({
    url: `/users/${data.id}`,
    method: 'PATCH',
    data
  })
}
