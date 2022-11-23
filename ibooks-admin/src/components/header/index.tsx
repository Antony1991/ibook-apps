/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-24 01:15:35
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-24 02:16:54
 * @FilePath: /ibook-apps/ibooks-admin/src/components/header/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import React from 'react'
import { Layout } from 'antd'
import { MenuFoldOutlined, MenuUnfoldOutlined } from '@ant-design/icons'
import styles from './index.module.less'
import HeaderUser from './header-user'

const { Header } = Layout
interface IHeadersProps {
  collapsed?: boolean
  onCollapseChange: () => void
}
const IHeaders: React.FC<IHeadersProps> = ({ onCollapseChange, collapsed }) => {
  return (
    <Header style={{ backgroundColor: '#FFFFFF', padding: 0 }}>
      <div className={styles.headerContent}>
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
        <div className={styles.headerRight}>
          <HeaderUser />
        </div>
      </div>
    </Header>
  )
}

export default IHeaders
