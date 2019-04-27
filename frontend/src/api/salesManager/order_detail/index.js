import request from '@/plugin/axios'

export function getOrderItemDetails (data) {
  console.log(data)
  return request({
    url: '/order_details',
    method: 'get',
    params: data
  })
}
export function addOrderItem (data) {
  return request({
    url: '/order_details',
    method: 'post',
    data
  })
}
export function deleteOrderItem (data) {
  return request({
    url: `/order_details/${data.id}`,
    method: 'delete'
  })
}
export function updateOrderItem (data) {
  // let cId=data.id
  return request({
    url: `/order_details/${data.id}`,
    method: 'PATCH',
    data
  })
}
