import request from '@/plugin/axios'

export function getNotes (data) {
  console.log(data)
  return request({
    url: '/notes',
    method: 'get',
    params: data
  })
}
export function addNotes (data) {
  return request({
    url: '/notes',
    method: 'post',
    data
  })
}
export function deleteNote (data) {
  return request({
    url: `/notes/${data.id}`,
    method: 'delete'
  })
}
