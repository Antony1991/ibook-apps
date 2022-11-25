/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-24 00:31:43
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-24 22:22:53
 * @FilePath: /ibook-apps/ibooks-admin/src/components/siderbar/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import React, { useCallback } from 'react'
import { Layout, Menu } from 'antd'
import { routesConfig } from '@/config/routes'
import { useNavigate } from 'react-router-dom'

const { Sider } = Layout
interface SiderBarProps {
  collapsed?: boolean
}
const SiderBar: React.FC<SiderBarProps> = ({ collapsed }) => {
  const navigate = useNavigate()
  const menuClick = useCallback(
    ({ item, key, keyPath }: any) => {
      console.log('----', item)
      console.log('----key', key)
      console.log('----keyPath', keyPath)
      navigate(key)
    },
    [navigate]
  )

  return (
    <Sider collapsed={collapsed} collapsible trigger={null}>
      <div>logo</div>
      <Menu
        theme="dark"
        items={routesConfig}
        mode="inline"
        onClick={menuClick}
      />
    </Sider>
  )
}

export default SiderBar
