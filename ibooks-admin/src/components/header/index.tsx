/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-24 01:15:35
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-02 14:53:08
 * @FilePath: /ibook-apps/ibooks-admin/src/components/header/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import React, { useMemo } from 'react'
import { Breadcrumb, Layout } from 'antd'
import { MenuFoldOutlined, MenuUnfoldOutlined } from '@ant-design/icons'
import styles from './index.module.less'
import HeaderUser from './header-user'
import { baseMenus, MenuConfig } from '@/config/base'
import { baseRouteUrl } from '@/config/routes'
import { Link, useLocation } from 'react-router-dom'

const { Header } = Layout
interface IHeadersProps {
  collapsed?: boolean
  onCollapseChange: () => void
}
const IHeaders: React.FC<IHeadersProps> = ({ onCollapseChange, collapsed }) => {
  const location = useLocation()
  const extraBreadItems = useMemo(() => {
    const pathSnippets = location.pathname
      .split('/')
      .filter((i) => i)
      .filter((i) => i !== 'app')
    return pathSnippets.map((_, i) => {
      const url = `/${pathSnippets.slice(0, i + 1).join('/')}`
      return (
        <Breadcrumb.Item key={url}>
          <Link to={`/app/${url}`}>{url}</Link>
        </Breadcrumb.Item>
      )
    })
  }, [location.pathname])
  const breadItems = [
    <Breadcrumb.Item key="home">
      <Link to="/">首页</Link>
    </Breadcrumb.Item>,
  ].concat(extraBreadItems)
  return (
    <Header style={{ backgroundColor: '#FFFFFF', padding: 0 }}>
      <div className={styles.headerContent}>
        <div className={styles.headerLeft}>
          {collapsed ? (
            <MenuUnfoldOutlined
              className={styles.menuIcon}
              onClick={onCollapseChange}
            />
          ) : (
            <MenuFoldOutlined
              className={styles.menuIcon}
              onClick={onCollapseChange}
            />
          )}
          <Breadcrumb style={{ marginLeft: '10px' }}>{breadItems}</Breadcrumb>
        </div>
        <div className={styles.headerRight}>
          <HeaderUser />
        </div>
      </div>
    </Header>
  )
}

export default IHeaders
