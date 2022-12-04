/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-04 11:08:16
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-04 16:09:05
 * @FilePath: /ibook-apps/ibooks-admin/src/components/drawerSettings/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { changePrimaryColor } from '@/redux/features/users/usersSlice'
import { RootState } from '@/redux/store'
import { CloseOutlined, SettingOutlined } from '@ant-design/icons'
import { Divider, Drawer } from 'antd'
import React, { useState } from 'react'
import { useDispatch, useSelector } from 'react-redux'
import BlockCheckbox from '../blockCheckbox'
import styles from './index.module.less'
import RegionalSetting from './regionalSetting'
import ThemeColor from './ThemeColor'

type BodyProps = {
  title: string
  children?: React.ReactNode
}
const Body: React.FC<BodyProps> = ({ children, title }) => {
  return (
    <div style={{ marginBlockEnd: 12 }}>
      <h3 className={styles.bodyTitle}>{title}</h3>
      {children}
    </div>
  )
}
const colorList = [
  { key: 'techBlue', color: '#1677FF' },
  { key: 'daybreak', color: '#1890ff' },
  { key: 'dust', color: '#F5222D' },
  { key: 'volcano', color: '#FA541C' },
  { key: 'sunset', color: '#FAAD14' },
  { key: 'cyan', color: '#13C2C2' },
  { key: 'green', color: '#52C41A' },
  { key: 'geekblue', color: '#2F54EB' },
  { key: 'purple', color: '#722ED1' },
]
const DrawerSettings: React.FC = () => {
  const [navTheme, setnavTheme] = useState('light')
  const [open, setopen] = useState(false)
  const dispatch = useDispatch()
  const colorPrimary = useSelector(
    (state: RootState) => state.users.colorPrimary
  )
  const changeSetting = (key: string) => {
    setnavTheme(key)
  }
  // 设置主题色
  const changeColor = (color: string) => {
    dispatch(changePrimaryColor(color))
  }
  return (
    <>
      <div
        id="drawer-setting-handle"
        className={styles['drawer-setting-handle']}
        style={{ backgroundColor: colorPrimary }}
        onClick={() => setopen(!open)}
      >
        {open ? (
          <CloseOutlined style={{ color: '#FFF', fontSize: 20 }} />
        ) : (
          <SettingOutlined style={{ color: '#FFF', fontSize: 20 }} />
        )}
      </div>
      <Drawer
        style={{ zIndex: 999 }}
        width={300}
        open={open}
        onClose={() => setopen(false)}
        placement="right"
      >
        <div className={styles.settingDrawer}>
          <Body title="整体风格设置">
            <BlockCheckbox
              value={navTheme}
              list={[
                {
                  key: 'light',
                  title: '亮色菜单风格',
                },
                {
                  key: 'realDark',
                  title: '暗色菜单风格',
                },
              ]}
              onChange={changeSetting}
            />
          </Body>
          <Body title="主题色">
            <ThemeColor
              value={colorPrimary}
              colorList={colorList}
              onChange={changeColor}
            />
          </Body>
          <Divider />
          <Body title="内容区域">
            <RegionalSetting />
          </Body>
        </div>
      </Drawer>
    </>
  )
}
export default DrawerSettings
