import request from '@/plugin/axios'

export function getNotes (data) {
  return request({
    url: '/notes',
    method: 'get',
    data
  })
}
export function addNotes (data) {
  return request({
    url: '/notes',
    method: 'post',
    data
  })
}
