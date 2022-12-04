/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-04 13:50:58
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-04 16:27:58
 * @FilePath: /ibook-apps/ibooks-admin/src/components/drawerSettings/regionalSetting.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { List, Switch, Tooltip } from 'antd'
import React from 'react'

const RegionalSetting = () => {
  const regionals = [
    { title: '顶栏', key: 'header' },
    { title: '页脚', key: 'footer' },
    { title: '菜单', key: 'menu' },
    { title: '菜单头', key: 'menuHeader' },
  ]
  return (
    <List
      split={false}
      renderItem={({ title, action }) => (
        <Tooltip title={title} placement="left">
          <List.Item actions={[action]} style={{ padding: '12px 0' }}>
            <span>{title}</span>
          </List.Item>
        </Tooltip>
      )}
      dataSource={regionals.map((item) => {
        return {
          title: item.title,
          action: <Switch size="small" />,
        }
      })}
    />
  )
}
export default RegionalSetting
