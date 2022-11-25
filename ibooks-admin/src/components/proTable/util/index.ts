/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-24 19:35:32
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-24 20:38:04
 * @FilePath: /ibook-apps/ibooks-admin/src/components/proTable/util/index.ts
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { TableProps } from 'antd'
import type { ProColumnGroupType, ProColumns } from '../typing'
/**
 * 根据key和dataIndex 生成唯一 id
 * @param key 用户设置的 key
 * @param dataIndex 在对象中的数据
 * @param index 序列号，理论唯一
 */
export const getColumnKey = (key?: any, index?: number | string): string => {
  if (key) {
    return Array.isArray(key) ? key.join('-') : key.toString()
  }
  return `${index}`
}
