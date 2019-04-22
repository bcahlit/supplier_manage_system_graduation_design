import request from '@/plugin/axios'

export function getSchedules (data) {
  console.log(data)
  return request({
    url: '/schedules',
    method: 'get',
    params: data
  })
}
export function addSchedule (data) {
  return request({
    url: '/schedules',
    method: 'post',
    data
  })
}
export function deleteSchedule (data) {
  return request({
    url: `/schedules/${data.id}`,
    method: 'delete'
  })
}
