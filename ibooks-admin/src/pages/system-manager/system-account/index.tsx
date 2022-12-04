import BookProTable from '@/components/proTable'
import {
  RowAction,
  SearchForm,
  SearchParam,
} from '@/components/proTable/typing'
import {
  useRoleAccountListMutation,
  useCreateAccountMutation,
  useUpdateAccountMutation,
  useDeleteAccountMutation,
} from '@/services/roles/rolesApi'
import { Button, Space, Switch } from 'antd'
import { ColumnProps } from 'antd/es/table'
import EditModal, { type SyAccountDrawerParam } from './components/EditModal'
import React, { useMemo, useRef, useCallback, useState } from 'react'
import { confirmModal } from '@/utils'

const SystemAccount = () => {
  const [roleAccountList] = useRoleAccountListMutation()
  const [createAccount] = useCreateAccountMutation()
  const [updateAccount] = useUpdateAccountMutation()
  const [deleteAccount] = useDeleteAccountMutation()
  const tableRef = useRef<any>()
  const [dataRecord, setdataRecord] = useState({})
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
        render: (status) => (
          <Switch
            checked={status}
            unCheckedChildren="停用"
            checkedChildren="启用"
          />
        ),
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
  // 新增账号
  const addAccount = useCallback(() => {
    modalRef.current?.acceptDrawer({
      title: '新增账号',
      formApi: createAccount,
      onUpdate: () => {
        tableRef.current?.fetch(1)
      },
    })
  }, [createAccount])
  const updateItemAccount = useCallback(
    (record: any) => {
      modalRef?.current?.acceptDrawer({
        title: '编辑账号',
        formApi: updateAccount,
        onUpdate: () => {
          tableRef.current?.fetch(1)
        },
      })
      setdataRecord(record)
    },
    [updateAccount]
  )
  const toolBarRender = () => {
    return (
      <Space>
        <Button type="primary" onClick={addAccount}>
          新增账号
        </Button>
      </Space>
    )
  }
  const rowActions = useMemo(
    (): RowAction[] => [
      {
        label: '编辑',
        action: (record: any) => {
          updateItemAccount(record)
        },
      },
      {
        label: <span className="text-danger">删除</span>,
        action: (record: any) => {
          confirmModal({
            title: '删除角色账号',
            content: '删除后不可恢复，确认要删除吗？',
            onOk: async () => {
              await deleteAccount({ id: record.id })
              tableRef.current?.fetch(1)
            },
          })
        },
      },
    ],
    []
  )
  return (
    <div>
      <BookProTable
        ref={tableRef}
        rowKey={(record) => record.id}
        bordered
        columns={columns}
        rowActions={rowActions}
        searchFields={searchFields}
        request={request}
        toolBarRender={toolBarRender}
      />
      <EditModal ref={modalRef} record={dataRecord} />
    </div>
  )
}

export default SystemAccount
