import {
  AppstoreOutlined,
  BarChartOutlined,
  ExclamationCircleOutlined,
  HomeOutlined,
  SettingOutlined,
  UserOutlined,
} from '@ant-design/icons'

/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-26 19:10:08
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-03 21:10:49
 * @FilePath: /ibook-apps/ibooks-admin/src/config/base.ts
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
export type MenuConfig = {
  label: string
  key: string
  path: string
  icon?: any
  children?: MenuConfig[]
}
export const baseMenus: MenuConfig[] = [
  {
    label: '首页',
    key: '/welcome',
    path: '/welcome',
    icon: <HomeOutlined />,
  },
  {
    label: '会员管理',
    key: '/member-manager',
    path: '/member-manager',
    icon: <UserOutlined />,
    children: [
      {
        label: '会员列表',
        key: '/member-list',
        path: '/member-list',
      },
      {
        label: '会员等级',
        key: '/member-grade',
        path: '/member-grade',
      },
    ],
  },
  {
    label: '组件管理',
    key: '/component-manager',
    path: '/component-manager',
    icon: <AppstoreOutlined />,
    children: [
      {
        label: '富文本',
        key: '/rich-text',
        path: '/rich-text',
      },
      {
        label: '返回顶部',
        key: '/back-top',
        path: '/back-top',
      },
      {
        label: 'count-to',
        key: '/count-to',
        path: '/count-to',
      },
    ],
  },
  {
    label: '图表管理',
    key: '/charts-manager',
    path: '/charts-manager',
    icon: <BarChartOutlined />,
    children: [
      {
        label: '词云图',
        key: '/word-cloud',
        path: '/word-cloud',
      },
      {
        label: '柱线混合图',
        key: '/dualAxes',
        path: '/dualAxes',
      },
      {
        label: '水波纹图',
        key: '/water-liquid',
        path: '/water-liquid',
      },
    ],
  },
  {
    label: '错误页面',
    key: '/error-manager',
    path: '/error-manager',
    icon: <ExclamationCircleOutlined />,
    children: [
      {
        label: '403',
        key: '/403',
        path: '/403',
      },
      {
        label: '500',
        key: '/500',
        path: '/500',
      },
    ],
  },
  {
    label: '系统管理',
    key: '/system-manager',
    path: '/system-manager',
    icon: <SettingOutlined />,
    children: [
      {
        label: '系统账号',
        key: '/system-account',
        path: '/system-account',
      },
      {
        label: '角色权限',
        key: '/role-privige',
        path: '/role-privige',
      },
    ],
  },
]
