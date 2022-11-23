/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-24 01:58:02
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-24 02:16:38
 * @FilePath: /ibook-apps/ibooks-admin/src/components/header/header-user.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import React, { useMemo } from 'react'
import { Avatar, Dropdown } from 'antd'
import styles from './index.module.less'
import { LogoutOutlined, SettingOutlined } from '@ant-design/icons'

const HeaderUser = () => {
  const items = [
    {
      key: '1',
      label: '个人设置',
      icon: <SettingOutlined />,
    },
    {
      key: '2',
      label: '退出登录',
      icon: <LogoutOutlined />,
    },
  ]
  return useMemo(
    () => (
      <Dropdown menu={{ items: items }}>
        <div className={styles.headerUser}>
          <Avatar />
          <span className={styles.userText}>Chenwen</span>
        </div>
      </Dropdown>
    ),
    []
  )
}

export default HeaderUser
