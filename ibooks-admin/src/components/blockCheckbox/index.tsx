/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-04 12:15:12
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-04 12:49:11
 * @FilePath: /ibook-apps/ibooks-admin/src/components/blockCheckbox/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%A
 */
import { CheckOutlined } from '@ant-design/icons'
import { Tooltip } from 'antd'
import React, { useMemo } from 'react'
import styles from './index.module.less'
import clsx from 'clsx'
type ItemCheckboxProp = {
  key: string
  title: string
}
type BlockCheckboxProp = {
  value?: string
  onChange?: (key: string) => void
  list?: ItemCheckboxProp[]
}
const BlockCheckbox: React.FC<BlockCheckboxProp> = ({
  list,
  value,
  onChange,
}) => {
  const dom = useMemo(() => {
    return (list || []).map((item: ItemCheckboxProp) => {
      return (
        <Tooltip title={item.title} key={item.key}>
          <div
            className={clsx(styles.checkboxItem, styles[item.key])}
            onClick={() => onChange?.(item.key)}
          >
            <CheckOutlined
              className={styles.checkboxIconSelect}
              style={{
                display: value === item.key ? 'block' : 'none',
              }}
            />
          </div>
        </Tooltip>
      )
    })
  }, [list?.length, onChange, value])
  return <div className={styles.blockCheckbox}>{dom}</div>
}

export default BlockCheckbox
