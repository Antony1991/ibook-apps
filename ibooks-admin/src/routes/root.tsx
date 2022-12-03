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
import { createBrowserRouter } from 'react-router-dom'
import React from 'react'
import WelcomePagee from '@/pages/welcome/Welcome'
import LoginPage from '@/pages/login/Login'
const WaterLiquidPage = React.lazy(() => import('@/pages/charts-manager/water-liquid'))
const WordCloudPage = React.lazy(() => import('@/pages/charts-manager/word-cloud'))
const BackTopPage = React.lazy(() => import('@/pages/component-manager/back-top'))
const CountToPage = React.lazy(() => import('@/pages/component-manager/count-to'))
const RichTextPage = React.lazy(() => import('@/pages/component-manager/rich-text'))
const Error403Page = React.lazy(() => import('@/pages/error-manager/error-403'))
const Error500Page = React.lazy(() => import('@/pages/error-manager/error-500'))

const MemberList = React.lazy(() => import('@/pages/member-manager/member-list'))
const NotFoundPage = React.lazy(() => import('@/pages/not-found'))
const RolePrivige = React.lazy(() => import('@/pages/system-manager/role-privige'))
const SystemAccount = React.lazy(() => import('@/pages/system-manager/system-account'))

const DualAxesPage = React.lazy(() => import('@/pages/charts-manager/dualAxes'))


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
        element: <React.Suspense> <MemberList /></React.Suspense>,
      },
      {
        path: `${baseRouteUrl}/system-manager/role-privige`,
        element: <RolePrivige />,
      },
      {
        path: `${baseRouteUrl}/system-manager/system-account`,
        element: <React.Suspense><SystemAccount /></React.Suspense>,
      },
      {
        path: `${baseRouteUrl}/component-manager/rich-text`,
        element: <React.Suspense><RichTextPage /></React.Suspense>,
      },
      {
        path: `${baseRouteUrl}/component-manager/back-top`,
        element: <React.Suspense><BackTopPage /></React.Suspense>,
      },
      {
        path: `${baseRouteUrl}/component-manager/count-to`,
        element: <React.Suspense><CountToPage /></React.Suspense>,
      },
      {
        path: `${baseRouteUrl}/charts-manager/word-cloud`,
        element: <React.Suspense><WordCloudPage /></React.Suspense>,
      },
      {
        path: `${baseRouteUrl}/charts-manager/dualAxes`,
        element: <React.Suspense><DualAxesPage /></React.Suspense>,
      },
      {
        path: `${baseRouteUrl}/charts-manager/water-liquid`,
        element: <React.Suspense><WaterLiquidPage /></React.Suspense>,
      },
      {
        path: `${baseRouteUrl}/error-manager/403`,
        element: <React.Suspense><Error403Page /></React.Suspense>,
      },
      {
        path: `${baseRouteUrl}/error-manager/500`,
        element: <React.Suspense><Error500Page /></React.Suspense>,
      },
    ],
  },
  {
    path: '/login',
    element: <LoginPage />,
  },
])
export default router
