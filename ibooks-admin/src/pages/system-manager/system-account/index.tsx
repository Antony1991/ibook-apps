import BookProTable from '@/components/proTable'
import { SearchForm, SearchParam } from '@/components/proTable/typing'
import { useRoleAccountListMutation, useCreateAccountMutation } from '@/services/roles/rolesApi'
import { Button, Select, Space, Switch } from 'antd'
import { ColumnProps } from 'antd/es/table'
import EditModal, { type SyAccountDrawerParam } from './components/EditModal'
import React, { useMemo, useRef, useCallback } from 'react'

const SystemAccount = () => {
  const [roleAccountList] = useRoleAccountListMutation()
  const [createAccount, { isLoading }] = useCreateAccountMutation()
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
        render: (status) => <Switch checked={status} unCheckedChildren="停用" checkedChildren="启用" />
      },
    ]
  }, [])
  const modalRef = useRef<{
    acceptDrawer(param: Partial<SyAccountDrawerParam>): void
  }>()
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
  const addAccount = useCallback(
    () => {
      modalRef.current?.acceptDrawer({
        title: '新增账号',
        formApi: createAccount,
        onUpdate: () => {

        }
      })
    },
    [],
  )

  const toolBarRender = () => {
    return (
      <Space>
        <Button type="primary" onClick={addAccount}>新增账号</Button>
      </Space>
    )
  }
  return (
    <div>
      <BookProTable
        rowKey={record => record.id}
        bordered
        columns={columns}
        searchFields={searchFields}
        request={request}
        toolBarRender={toolBarRender}
      />
      <EditModal ref={modalRef} loading={isLoading} />
    </div>
  )
}

export default SystemAccount
