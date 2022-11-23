/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-23 21:58:34
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-23 22:59:10
 * @FilePath: /ibook-apps/ibooks-admin/src/routes/root.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import Layouts from '@/components/layouts'
import Welcome from '@/pages/welcome/Welcome'
import { createBrowserRouter } from 'react-router-dom'

const router = createBrowserRouter([
  {
    path: '/',
    element: <Layouts />,
    children: [
      {
        index: true,
        element: <Welcome />,
      },
    ],
  },
])
export default router
