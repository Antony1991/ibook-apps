/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-24 09:55:26
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-25 18:23:02
 * @FilePath: /ibook-apps/ibooks-admin/src/pages/member-manager/member-list/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import BookProTable from '@/components/proTable'
import ProTable from '@/components/proTable'
import { SearchForm } from '@/components/proTable/typing'
import { Card } from 'antd'
import { ColumnProps } from 'antd/es/table'
import React, { useMemo } from 'react'

const MemberList = () => {
  const columns = useMemo(
    (): ColumnProps<any>[] => [
      {
        key: 'index',
        dataIndex: 'index',
        title: '序号',
        render(value, record, index) {
          return index + 1
        },
      },
      {
        key: 'name',
        dataIndex: 'name',
        title: '名称',
      },
    ],
    []
  )
  const request = async () => {
    const items = Array.from({ length: 4 }).map((_, i) => ({
      id: i + 1,
      name: `chenwen-${i}`,
    }))
    return {
      data: items,
      success: true,
      total: items.length,
    }
  }
  const searchFields = (): SearchForm[] => {
    return [
      {
        name: 'name',
        label: '会员名称',
        type: 'input',
      },
      {
        name: 'status',
        label: '会员状态',
        type: 'input',
      },
      {
        name: 'status1',
        label: '会员状态',
        type: 'select',
        payload: {
          options: [],
        },
      },
    ]
  }
  return (
    <div>
      <BookProTable
        bordered
        columns={columns}
        request={request}
        searchFields={searchFields}
        rowKey={(record) => record.id}
      />
    </div>
  )
}
export default MemberList
