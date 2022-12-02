/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-23 22:10:05
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-02 13:43:55
 * @FilePath: /ibook-apps/ibooks-admin/src/components/layouts/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import React, { useCallback, useMemo, useState } from 'react'
import { Navigate, Outlet, useLocation } from 'react-router-dom'
import { Layout } from 'antd'
import SiderBar from '@/components/siderbar'
import IHeaders from '../header'
import { TransitionGroup, CSSTransition } from 'react-transition-group'
import TagsView from '@/components/tagsView'
import { useSelector } from 'react-redux'
import { RootState } from '@/redux/store'
const { Content } = Layout
const Layouts: React.FC = () => {
  const transitionKey = useLocation()
  const [collapsed, setcollapsed] = useState(false)
  const token = useSelector((state: RootState) => state.users.token)
  const onCollapseChange = useCallback(() => {
    setcollapsed((collap) => !collap)
  }, [])

  return useMemo(() => {
    if (!token) {
      return <Navigate to="/login" />
    }
    return (
      <Layout hasSider style={{ minHeight: '100vh' }}>
        <SiderBar collapsed={collapsed} />
        <Layout>
          <IHeaders collapsed={collapsed} onCollapseChange={onCollapseChange} />
          <TagsView />
          <Content className="ibook-content">
            <Outlet />
            {/* <TransitionGroup component={null} className="router-wrapper">
                <CSSTransition
                  timeout={500}
                  key={transitionKey.pathname}
                  addEndListener={(node, done) =>
                    node.addEventListener('transitionend', done, false)
                  }
                  classNames="forward-from-right"
                  unmountOnExit
                >
                  
                </CSSTransition>
              </TransitionGroup> */}
          </Content>
        </Layout>
      </Layout>
    )
  }, [collapsed, token])
}
export default Layouts
