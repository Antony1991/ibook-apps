/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-02 13:00:58
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-03 21:14:27
 * @FilePath: /ibook-apps/ibooks-admin/src/utils/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { ExclamationCircleOutlined } from '@ant-design/icons'
import { Modal } from 'antd'
import { baseMenus, type MenuConfig } from '@/config/base'
import { baseRouteUrl } from '@/config/routes'

type ConfirmModalProp = {
  title?: string
  content?: string
  onOk?: () => void
}
/**
 * 确认弹窗
 * @param param0 ConfirmModalProp
 */
export function confirmModal({ title, content, onOk }: ConfirmModalProp) {
  Modal.confirm({
    okText: '确认',
    cancelText: '取消',
    icon: <ExclamationCircleOutlined />,
    title,
    content,
    onOk,
  })
}

/**
 * 扁平化菜单列表
 */
export function getFlatMenus(arr: any[]) {
  const list: MenuConfig[] = arr.reduce((pre, current: any) => {
    return pre.concat(
      { ...current, key: `${baseRouteUrl}${current.key}` },
      Array.isArray(current.children)
        ? getFlatMenus(
            current.children.map((item: MenuConfig) => ({
              ...item,
              key: `${current.key}${item.key}`,
            }))
          )
        : []
    )
  }, [])
  return list
}
