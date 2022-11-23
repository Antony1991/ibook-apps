/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-24 00:31:43
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-24 01:46:33
 * @FilePath: /ibook-apps/ibooks-admin/src/components/siderbar/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import React from 'react'
import { Layout, Menu } from 'antd'
import { routesConfig } from '@/config/routes'

const { Sider } = Layout
interface SiderBarProps {
  collapsed?: boolean
}
const SiderBar: React.FC<SiderBarProps> = ({ collapsed }) => {
  return (
    <Sider collapsed={collapsed} collapsible>
      <div>logo</div>
      <Menu theme="dark" items={routesConfig} mode="inline" />
    </Sider>
  )
}

export default SiderBar
