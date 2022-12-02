import BookProTable from '@/components/proTable'
import { SearchForm, SearchParam } from '@/components/proTable/typing'
import { useRoleAccountListMutation } from '@/services/roles/rolesApi'
import { Button, Select, Space } from 'antd'
import { ColumnProps } from 'antd/es/table'
import React, { useMemo } from 'react'

const SystemAccount = () => {
  const [roleAccountList] = useRoleAccountListMutation()
  const request = async (info: SearchParam) => {
    const { values = {}, current, pageSize } = info
    const { data }: any = await roleAccountList({
      ...values,
      current,
      pageSize,
    })
    return {
      data: data?.rows || [],
      total: data?.count || 0,
    }
  }
  const columns = useMemo((): ColumnProps<any>[] => {
    return [
      {
        title: '序号',
        dataIndex: 'index',
        render: (_, _record, i) => i + 1,
      },
      {
        title: '账号',
        dataIndex: 'username',
      },
      {
        title: '角色',
        dataIndex: 'role_name',
      },
      {
        title: '创建时间',
        dataIndex: 'created_at',
      },
      {
        title: '最后登录时间',
        dataIndex: 'updated_at',
      },
      {
        title: '状态',
        dataIndex: 'status',
      },
    ]
  }, [])
  const searchFields = (): SearchForm[] => {
    return [
      {
        label: '账号',
        name: 'username',
        type: 'input',
        payload: {
          currentProps: {
            placeholder: '请输入账号',
          },
        },
      },
      {
        label: '状态',
        name: 'status',
        type: 'select',
        initValue: -1,
        payload: {
          options: [
            { key: '-1', value: -1, label: '全部' },
            { key: '1', value: 1, label: '是' },
            { key: '0', value: 0, label: '否' },
          ],
        },
      },
    ]
  }
  const toolBarRender = () => {
    return (
      <Space>
        <Button type="primary">新增账号</Button>
      </Space>
    )
  }
  return (
    <div>
      <BookProTable
        bordered
        columns={columns}
        searchFields={searchFields}
        request={request}
        toolBarRender={toolBarRender}
      />
    </div>
  )
}

export default SystemAccount
