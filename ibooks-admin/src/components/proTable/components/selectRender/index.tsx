/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-25 14:05:25
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-25 18:02:01
 * @FilePath: /ibook-apps/ibooks-admin/src/components/proTable/components/selectRender/index.tsx
 * @Description: 渲染选择器组件
 */
import { Select, SelectProps } from 'antd'
import React, { useMemo } from 'react'
import { PayloadProp } from '../../typing'

interface SelectRenderProps extends PayloadProp {
  currentProps?: SelectProps
}
const SelectRender: React.FC<SelectRenderProps> = ({
  options,
  currentProps = {},
  ...newProps
}) => {
  return useMemo(() => {
    // 参数必须包含options
    if (!options) {
      console.warn('selectRender: 必须包含options参数')
      return null
    }
    return (
      <Select
        style={{ minWidth: 150 }}
        options={options}
        {...currentProps}
        {...newProps}
      />
    )
  }, [options, currentProps, newProps])
}

export default (props: SelectRenderProps) => <SelectRender {...props} />
