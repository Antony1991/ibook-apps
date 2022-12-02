/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-29 21:53:51
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-29 22:47:54
 * @FilePath: /ibook-apps/ibooks-admin/src/pages/component-manager/back-top/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import BackToTop from '@/components/backToTop'
import { Alert, Card } from 'antd'
import React from 'react'

const BackTopPage = () => {
  return (
    <div>
      <Card>
        <Alert
          message={
            <>
              <p>页面滚动到指定位置会在右下角出现返回顶部按钮</p>
              <p>可自定义按钮的样式、show/hide、出现的高度、返回的位置</p>
            </>
          }
        />
      </Card>
      <div style={{ marginBottom: '20px' }}></div>
      <Card>
        {Array.from({ length: 50 }).map((_item, i) => (
          <p key={i}>placeholder</p>
        ))}
        <BackToTop />
      </Card>
    </div>
  )
}

export default BackTopPage
