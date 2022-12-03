/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-03 15:17:53
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-03 15:20:47
 * @FilePath: /ibook-apps/ibooks-admin/src/components/spinLoader/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { Spin } from 'antd'
import React from 'react'

const SpinLoader = () => {
  return (
    <div
      style={{ display: 'flex', justifyContent: 'center', paddingTop: '40px' }}
    >
      <Spin size="large" />
    </div>
  )
}

export default SpinLoader
