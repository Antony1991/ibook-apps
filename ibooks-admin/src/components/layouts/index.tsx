/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-23 22:10:05
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-24 02:17:08
 * @FilePath: /ibook-apps/ibooks-admin/src/components/layouts/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import React, { useCallback, useMemo, useState } from 'react'
import { ProLayout, ProProvider } from '@ant-design/pro-components'
import { SmileFilled } from '@ant-design/icons'
import { Outlet } from 'react-router-dom'
import { Layout } from 'antd'
import SiderBar from '@/components/siderbar'
import IHeaders from '../header'
const { Content } = Layout
const Layouts: React.FC = () => {
  const [collapsed, setcollapsed] = useState(false)
  const onCollapseChange = useCallback(() => {
    setcollapsed((collap) => !collap)
  }, [])

  return useMemo(
    () => (
      <Layout hasSider>
        <SiderBar collapsed={collapsed} />
        <Layout>
          <IHeaders collapsed={collapsed} onCollapseChange={onCollapseChange} />
          <Content>
            <Outlet />
          </Content>
        </Layout>
      </Layout>
    ),
    [collapsed, onCollapseChange]
  )
}
export default Layouts
