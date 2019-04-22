import request from '@/plugin/axios'

export function getSchedules (data) {
  console.log(data)
  return request({
    url: '/schedule',
    method: 'get',
    params: data
  })
}
export function addSchedule (data) {
  return request({
    url: '/schedule',
    method: 'post',
    data
  })
}
export function deleteSchedule (data) {
  return request({
    url: `/schedule/${data.id}`,
    method: 'delete'
  })
}
