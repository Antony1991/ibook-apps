/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-27 20:18:54
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-27 22:15:55
 * @FilePath: /ibook-apps/ibooks-admin/src/pages/system-manager/role-privige/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { RootState } from '@/redux/store'
import { DeleteOutlined, EditOutlined, PlusOutlined } from '@ant-design/icons'
import { Button, Card, Col, Row, Space, Tree } from 'antd'
import React, { useMemo } from 'react'
import { useSelector } from 'react-redux'
import styles from './index.module.less'

const RolePrivige = () => {
  const accessList = useSelector((state: RootState) => state.roles.accessList)
  const treeData = useMemo(() => {
    console.log(
      '-----items',
      JSON.parse(
        JSON.stringify(accessList)
          .replaceAll('key', 'id')
          .replaceAll('name', 'title')
      )
    )
    return JSON.parse(
      JSON.stringify(accessList)
        .replaceAll('key', 'id')
        .replaceAll('name', 'title')
    )
  }, [accessList])
  return (
    <div className={styles.rolePrivige}>
      <Row className={styles.actionGroup}>
        <Space>
          <Button type="primary" icon={<PlusOutlined />}>
            新增
          </Button>
          <Button type="primary" danger icon={<DeleteOutlined />}>
            删除
          </Button>
          <Button type="primary" icon={<EditOutlined />}>
            编辑
          </Button>
        </Space>
      </Row>
      <div className={styles.roleContent}>
        <div className={styles.roleTree}>
          <Card bordered style={{ height: '100%', overflowY: 'auto' }}>
            <Tree treeData={treeData} defaultExpandAll />
          </Card>
        </div>
        <div className={styles.formContent}>
          <Card></Card>
        </div>
      </div>
    </div>
  )
}
export default RolePrivige
