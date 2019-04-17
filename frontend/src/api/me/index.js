import request from '@/plugin/axios'

export function UserInfo (data) {
  return request({
    url: '/me',
    method: 'get',
    data
  })
}
