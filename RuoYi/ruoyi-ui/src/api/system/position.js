import request from '@/utils/request'

// 查询持仓数据列表
export function listPosition(query) {
  return request({
    url: '/system/position/list',
    method: 'get',
    params: query
  })
}

// 查询持仓数据详细
export function getPosition(id) {
  return request({
    url: '/system/position/' + id,
    method: 'get'
  })
}

// 新增持仓数据
export function addPosition(data) {
  return request({
    url: '/system/position',
    method: 'post',
    data: data
  })
}

// 修改持仓数据
export function updatePosition(data) {
  return request({
    url: '/system/position',
    method: 'put',
    data: data
  })
}

// 删除持仓数据
export function delPosition(id) {
  return request({
    url: '/system/position/' + id,
    method: 'delete'
  })
}
