/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-23 16:30:40
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-24 00:05:02
 * @FilePath: /ibook-apps/ibooks-admin/src/main.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'
import { Provider } from 'react-redux'
import { store } from '@/redux/store'
import { ConfigProvider } from 'antd'
import zhCN from 'antd/locale/zh_CN'
import 'antd/dist/reset.css'
import { RouterProvider } from 'react-router-dom'
import router from '@/routes/root'
import './index.css'
const IbookApp = () => {
  return (
    <React.StrictMode>
      <Provider store={store}>
        <ConfigProvider locale={zhCN}>
          <RouterProvider router={router} />
        </ConfigProvider>
      </Provider>
    </React.StrictMode>
  )
}
const root = ReactDOM.createRoot(document.getElementById('root') as HTMLElement)
root.render(<IbookApp />)

store.subscribe(() => {
  root.render(<IbookApp />)
})
