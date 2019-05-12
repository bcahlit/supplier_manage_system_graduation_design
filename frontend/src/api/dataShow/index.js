import request from '@/plugin/axios'

export function getOrderNumberBySypplier (data = {}) {
  return request({
    url: '/get_number_by_supplier',
    method: 'get',
    data
  })
}
export function getOrderNumberByTime (data = {}) {
  return request({
    url: '/get_order_number_by_time',
    method: 'get',
    data
  })
}
