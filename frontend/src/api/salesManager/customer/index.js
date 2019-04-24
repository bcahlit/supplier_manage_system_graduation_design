import request from '@/plugin/axios'

export function getCustomers (data) {
  console.log(data)
  return request({
    url: '/customers',
    method: 'get',
    params: data
  })
}
export function addCustomer (data) {
  return request({
    url: '/customers',
    method: 'post',
    data
  })
}
export function deleteCustomer (data) {
  return request({
    url: `/customers/${data.id}`,
    method: 'delete'
  })
}
export function updateCustomer (data) {
  // let cId=data.id
  return request({
    url: `/customers/${data.id}`,
    method: 'PATCH',
    data
  })
}
