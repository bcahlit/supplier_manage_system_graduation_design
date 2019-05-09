import request from '@/plugin/axios'

export function getOrders (data) {
  return request({
    url: '/order_forms',
    method: 'get',
    params: data
  })
}
export function addOrder (data) {
  return request({
    url: '/order_forms',
    method: 'post',
    data
  })
}
export function deleteOrder (data) {
  return request({
    url: `/order_forms/${data.id}`,
    method: 'delete'
  })
}
export function updateOrder (data) {
  // let cId=data.id
  return request({
    url: `/order_forms/${data.id}`,
    method: 'PATCH',
    data
  })
}
export function getSuppliers (data) {
  return request({
    url: '/product_supplier',
    method: 'get',
    params: data
  })
}
export function getSupplierProductDetail (data) {
  return request({
    url: '/supplier_product_detail',
    method: 'get',
    params: data
  })
}
