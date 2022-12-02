/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-23 21:58:34
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-02 12:48:36
 * @FilePath: /ibook-apps/ibooks-admin/src/routes/root.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import Layouts from '@/components/layouts'
import { baseRouteUrl } from '@/config/routes'
import DualAxesPage from '@/pages/charts-manager/dualAxes'
import WaterLiquidPage from '@/pages/charts-manager/water-liquid'
import WordCloudPage from '@/pages/charts-manager/word-cloud'
import BackTopPage from '@/pages/component-manager/back-top'
import CountToPage from '@/pages/component-manager/count-to'
import RichTextPage from '@/pages/component-manager/rich-text'
import Error403Page from '@/pages/error-manager/error-403'
import Error500Page from '@/pages/error-manager/error-500'
import LoginPage from '@/pages/login/Login'
import MemberList from '@/pages/member-manager/member-list'
import NotFoundPage from '@/pages/not-found'
import RolePrivige from '@/pages/system-manager/role-privige'
import SystemAccount from '@/pages/system-manager/system-account'
import WelcomePagee from '@/pages/welcome/Welcome'
import { createBrowserRouter } from 'react-router-dom'

const router = createBrowserRouter([
  {
    path: '/',
    errorElement: <NotFoundPage />,
    element: <Layouts />,
    children: [
      {
        path: `${baseRouteUrl}/welcome`,
        index: true,
        element: <WelcomePagee />,
      },
      {
        path: `${baseRouteUrl}/member-manager/member-list`,
        element: <MemberList />,
      },
      {
        path: `${baseRouteUrl}/system-manager/role-privige`,
        element: <RolePrivige />,
      },
      {
        path: `${baseRouteUrl}/system-manager/system-account`,
        element: <SystemAccount />,
      },
      {
        path: `${baseRouteUrl}/component-manager/rich-text`,
        element: <RichTextPage />,
      },
      {
        path: `${baseRouteUrl}/component-manager/back-top`,
        element: <BackTopPage />,
      },
      {
        path: `${baseRouteUrl}/component-manager/count-to`,
        element: <CountToPage />,
      },
      {
        path: `${baseRouteUrl}/charts-manager/word-cloud`,
        element: <WordCloudPage />,
      },
      {
        path: `${baseRouteUrl}/charts-manager/dualAxes`,
        element: <DualAxesPage />,
      },
      {
        path: `${baseRouteUrl}/charts-manager/water-liquid`,
        element: <WaterLiquidPage />,
      },
      {
        path: `${baseRouteUrl}/error-manager/403`,
        element: <Error403Page />,
      },
      {
        path: `${baseRouteUrl}/error-manager/500`,
        element: <Error500Page />,
      },
    ],
  },
  {
    path: '/login',
    element: <LoginPage />,
  },
])
export default router
