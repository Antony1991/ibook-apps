/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-25 14:04:55
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-25 17:29:48
 * @FilePath: /ibook-apps/ibooks-admin/src/components/proTable/components/inputRender/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { Input, InputProps } from 'antd'
import React, { useMemo } from 'react'
import { PayloadProp } from '../../typing'

const DatePickerRender: React.FC<InputProps> = (props) => {
  return useMemo(() => {
    return <Input {...props} />
  }, [props])
}

export default (payload?: PayloadProp) => {
  return <DatePickerRender {...(payload?.currentProps as InputProps)} />
}
