/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-24 01:58:02
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-03 20:05:24
 * @FilePath: /ibook-apps/ibooks-admin/src/components/header/header-user.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import React, { useMemo } from 'react'
import { Avatar, Dropdown } from 'antd'
import styles from './index.module.less'
import AvatarImg from '@/assets/images/avatar.png'
import { LogoutOutlined, SettingOutlined } from '@ant-design/icons'
import { confirmModal } from '@/utils'
import { logout } from '@/redux/features/users/usersSlice'
import { useDispatch } from 'react-redux'
import { useNavigate } from 'react-router-dom'

const HeaderUser = () => {
  const dispatch = useDispatch()
  const navigate = useNavigate()
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
  const onClick = ({ key }: any) => {
    console.log(key)
    if (key === '2') {
      confirmModal({
        title: '退出登录',
        content: '您确定要退出登录吗？',
        onOk: async () => {
          await dispatch(logout())
          navigate('/', { replace: true })
        },
      })
    }
  }
  return useMemo(
    () => (
      <Dropdown menu={{ items: items, onClick }}>
        <div className={styles.headerUser}>
          <Avatar src={AvatarImg} />
          <span className={styles.userText}>Chenwen</span>
        </div>
      </Dropdown>
    ),
    []
  )
}

export default HeaderUser
