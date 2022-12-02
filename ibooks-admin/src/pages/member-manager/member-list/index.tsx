/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-24 09:55:26
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-29 19:53:53
 * @FilePath: /ibook-apps/ibooks-admin/src/pages/member-manager/member-list/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import BookProTable from '@/components/proTable'
import { SearchForm } from '@/components/proTable/typing'
import { PlusOutlined } from '@ant-design/icons'
import { Button, Card, Modal, Row, Space } from 'antd'
import { ColumnProps } from 'antd/es/table'
import React, { useEffect, useMemo, useRef } from 'react'
import EditModal from './components/EditModal'

const MemberList: React.FC = () => {
  const modalRef = useRef<{
    acceptDrawer?: (param: any) => void
  }>()
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
        title: '会员名称',
      },
      {
        key: 'realName',
        dataIndex: 'realName',
        title: '会员姓名',
      },
      {
        key: 'status',
        dataIndex: 'status',
        title: '状态',
      },
      {
        key: 'loginIp',
        dataIndex: 'loginIp',
        title: '最近登录IP',
      },
    ],
    []
  )
  useEffect(() => {
    console.log('member list')
  }, [])

  const request: any = async () => {
    const items = Array.from({ length: 21 }).map((_, i) => ({
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
        payload: {
          currentProps: {
            placeholder: '请输入会员名称',
          },
        },
      },
      {
        name: 'realName',
        label: '会员姓名',
        type: 'input',
        payload: {
          currentProps: {
            placeholder: '请输入会员名称',
          },
        },
      },
      {
        name: 'status',
        label: '状态',
        type: 'select',
        initValue: '',
        payload: {
          options: [
            {
              key: '',
              label: '全部',
              value: '',
            },
            {
              key: '1',
              label: '是',
              value: '1',
            },
            {
              key: '0',
              label: '否',
              value: '0',
            },
          ],
        },
      },
      {
        name: 'loginIp',
        label: '最近登录IP',
        type: 'input',
        payload: {
          currentProps: {
            placeholder: '请输入登录IP',
          },
        },
      },
    ]
  }
  const handleClick = () => {
    EditModal({
      title: '新建',
    })
  }
  const toolBarRender = () => {
    return (
      <Row>
        <Space>
          <Button
            type="primary"
            icon={<PlusOutlined />}
            onClick={() => {
              modalRef.current?.acceptDrawer?.({
                title: '新增用户',
              })
            }}
          >
            新增
          </Button>
        </Space>
      </Row>
    )
  }
  return (
    <div>
      <BookProTable
        bordered
        columns={columns}
        request={request}
        searchFields={searchFields}
        toolBarRender={toolBarRender}
        rowKey={(record) => record.id}
      />
      <EditModal ref={modalRef} />
    </div>
  )
}
export default MemberList
