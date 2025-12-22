import request from '@/utils/request'

// 查询Dify智能体配置列表
export function listDifyconfig(query) {
  return request({
    url: '/system/difyconfig/list',
    method: 'get',
    params: query
  })
}

// 查询Dify智能体配置详细
export function getDifyconfig(id) {
  return request({
    url: '/system/difyconfig/' + id,
    method: 'get'
  })
}

// 新增Dify智能体配置
export function addDifyconfig(data) {
  return request({
    url: '/system/difyconfig',
    method: 'post',
    data: data
  })
}

// 修改Dify智能体配置
export function updateDifyconfig(data) {
  return request({
    url: '/system/difyconfig',
    method: 'put',
    data: data
  })
}

// 删除Dify智能体配置
export function delDifyconfig(id) {
  return request({
    url: '/system/difyconfig/' + id,
    method: 'delete'
  })
}
