/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-24 00:31:43
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-02 13:41:45
 * @FilePath: /ibook-apps/ibooks-admin/src/components/siderbar/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import React, { useCallback, useEffect, useMemo, useState } from 'react'
import { Layout, Menu } from 'antd'
import { baseRouteUrl } from '@/config/routes'
import { useLocation, useNavigate } from 'react-router-dom'
import { baseMenus, MenuConfig } from '@/config/base'
import { useDispatch, useSelector } from 'react-redux'
import { addTagView, TagItemProp } from '@/redux/features/users/usersSlice'
import { RootState } from '@/redux/store'

const { Sider } = Layout
interface SiderBarProps {
  collapsed?: boolean
}
const SiderBar: React.FC<SiderBarProps> = ({ collapsed }) => {
  const navigate = useNavigate()
  const navLocation = useLocation()
  const tagList: TagItemProp[] = useSelector(
    (state: RootState) => state.users.tagList
  )
  const getBaseOpenKeys = () => {
    return `/${navLocation.pathname.split('/')[1]}/${navLocation.pathname.split('/')[2]
      }`
  }
  const [openKeys, setopenKeys] = useState([getBaseOpenKeys()])
  const dispatch = useDispatch()

  useEffect(() => {
    dispatch(addTagView({ path: '/app/welcome', name: '首页' }))
  }, [])
  const onOpenChange = (keys: string[]) => {
    const latestOpenKey = keys.find((key) => openKeys.indexOf(key) === -1)
    if (
      items.findIndex((item: MenuConfig) => item.key === latestOpenKey) === -1
    ) {
      setopenKeys(keys)
    } else {
      setopenKeys(latestOpenKey ? [latestOpenKey] : [])
    }
  }
  const menuClick = useCallback(
    ({ key, item }: any) => {
      console.log(key)
      navigate(key)
      if (!tagList.find((item) => item.path === key)) {
        dispatch(addTagView({ name: item.props.title, path: key }))
      }
    },
    [navigate]
  )
  const loopMenu: any = (menus: MenuConfig[]) => {
    return menus.map((item: MenuConfig) => {
      if (item.children) {
        return {
          ...item,
          title: item.label,
          key: `${baseRouteUrl}${item.key}`,
          children: loopMenu(
            item.children.map((v) => ({
              ...v,
              title: v.label,
              key: `${baseRouteUrl}${item.key}${v.key}`,
            }))
          ),
        }
      } else {
        return { ...item, title: item.label }
      }
    })
  }
  const items = useMemo(() => {
    console.log(loopMenu(baseMenus))
    return loopMenu(baseMenus)
  }, [])
  const selectedKeys = useMemo(() => {
    return navLocation.pathname
  }, [navLocation.pathname])
  const defaultOpenKeys = useMemo(() => {
    console.log('-----open', navLocation.pathname.split('/').slice(1, 3))
    return navLocation.pathname.substring(
      0,
      navLocation.pathname.lastIndexOf('/')
    )
  }, [navLocation.pathname])
  return (
    <Sider collapsed={collapsed} collapsible trigger={null}>
      <div>logo</div>
      <Menu
        theme="dark"
        openKeys={openKeys}
        onOpenChange={onOpenChange}
        defaultOpenKeys={[defaultOpenKeys]}
        selectedKeys={[selectedKeys]}
        items={items}
        mode="inline"
        onClick={menuClick}
      />
    </Sider>
  )
}

export default SiderBar
