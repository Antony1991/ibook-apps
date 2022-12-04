/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-04 13:29:59
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-04 13:35:33
 * @FilePath: /ibook-apps/ibooks-admin/src/components/drawerSettings/ThemeColor.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { CheckOutlined } from '@ant-design/icons'
import { Tooltip } from 'antd'
import React from 'react'
import styles from './index.module.less'
export interface ThemeColorProps {
  colorList?: {
    key: string
    color: string
    title?: string
  }[]
  value: string
  onChange: (color: string) => void
}
const ThemeColor: React.FC<ThemeColorProps> = ({
  colorList,
  value,
  onChange,
}) => {
  return (
    <div className={styles.themeColor}>
      {colorList?.map((item) => {
        return (
          <Tooltip key={item.color} title={item.title}>
            <div
              className={styles.themeColorItem}
              onClick={() => onChange(item.color)}
              style={{ backgroundColor: item.color }}
            >
              {value === item.color ? <CheckOutlined /> : ''}
            </div>
          </Tooltip>
        )
      })}
    </div>
  )
}

export default ThemeColor
