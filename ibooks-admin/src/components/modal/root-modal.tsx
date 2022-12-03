/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-28 14:39:19
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-28 19:03:20
 * @FilePath: /ibook-apps/ibooks-admin/src/components/modal/root-modal.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { Button, Drawer, DrawerProps, Space } from 'antd'
import React from 'react'

export interface RootModalProps extends DrawerProps {
  onOk?: () => void
  loading?: boolean
}

const RootModal: React.FC<RootModalProps> = (props) => {
  const {
    placement = 'right',
    destroyOnClose = true,
    maskClosable = false,
    onClose,
    onOk,
    loading,
    children,
    ...newProps
  } = props
  return (
    <Drawer
      width={450}
      placement={placement}
      onClose={onClose}
      destroyOnClose={destroyOnClose}
      maskClosable={maskClosable}
      extra={
        <Space>
          <Button onClick={onClose}>取消</Button>
          <Button type="primary" loading={loading} onClick={onOk}>
            提交
          </Button>
        </Space>
      }
      {...newProps}
    >
      {children}
    </Drawer>
  )
}
export default RootModal
