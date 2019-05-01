import request from '@/plugin/axios'

export function getSuppliers (data) {
  console.log(data)
  return request({
    url: '/suppliers',
    method: 'get',
    params: data
  })
}
export function addSupplier (data) {
  return request({
    url: '/suppliers',
    method: 'post',
    data
  })
}
export function deleteSupplier (data) {
  return request({
    url: `/suppliers/${data.id}`,
    method: 'delete'
  })
}
export function updateSupplier (data) {
  // let cId=data.id
  return request({
    url: `/suppliers/${data.id}`,
    method: 'PATCH',
    data
  })
}
