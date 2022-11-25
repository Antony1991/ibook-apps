/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-24 01:02:27
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-24 10:42:07
 * @FilePath: /ibook-apps/ibooks-admin/src/config/routes.ts
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { UserOutlined } from '@ant-design/icons'
import React from 'react'
export const routesConfig = [
  {
    key: '/member-mamager',
    icon: React.createElement(UserOutlined),
    label: '会员管理',
    children: [
      {
        key: '/member-mamager/member-list',
        label: '会员列表',
      },
    ],
  },
  {
    key: '2',
    icon: React.createElement(UserOutlined),
    label: '运营管理',
  },
]
