import request from '@/plugin/axios'

export function getComments (data) {
  console.log(data)
  return request({
    url: '/supplier_products',
    method: 'get',
    params: data
  })
}
export function addProduct (data) {
  return request({
    url: '/supplier_products',
    method: 'post',
    data
  })
}
export function deleteProduct (data) {
  return request({
    url: `/supplier_products/${data.id}`,
    method: 'delete'
  })
}
export function updateProduct (data) {
  // let cId=data.id
  return request({
    url: `/supplier_products/${data.id}`,
    method: 'PATCH',
    data
  })
}
