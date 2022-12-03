/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-23 21:58:34
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-03 21:36:42
 * @FilePath: /ibook-apps/ibooks-admin/src/routes/root.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import Layouts from '@/components/layouts'
import { baseRouteUrl } from '@/config/routes'
import { createBrowserRouter, Navigate } from 'react-router-dom'
import React from 'react'
import WelcomePage from '@/pages/welcome/Welcome'
import LoginPage from '@/pages/login/Login'
import SpinLoader from '@/components/spinLoader'
const WaterLiquidPage = React.lazy(
  () => import('@/pages/charts-manager/water-liquid')
)
const WordCloudPage = React.lazy(
  () => import('@/pages/charts-manager/word-cloud')
)
const BackTopPage = React.lazy(
  () => import('@/pages/component-manager/back-top')
)
const CountToPage = React.lazy(
  () => import('@/pages/component-manager/count-to')
)
const RichTextPage = React.lazy(
  () => import('@/pages/component-manager/rich-text')
)
const Error403Page = React.lazy(() => import('@/pages/error-manager/error-403'))
const Error500Page = React.lazy(() => import('@/pages/error-manager/error-500'))

const MemberList = React.lazy(
  () => import('@/pages/member-manager/member-list')
)
const NotFoundPage = React.lazy(() => import('@/pages/not-found'))
const RolePrivige = React.lazy(
  () => import('@/pages/system-manager/role-privige')
)
const SystemAccount = React.lazy(
  () => import('@/pages/system-manager/system-account')
)

const DualAxesPage = React.lazy(() => import('@/pages/charts-manager/dualAxes'))

const lazyLoader = (Component: React.FC) => {
  return (
    <React.Suspense fallback={<SpinLoader />}>
      {React.createElement(Component)}
    </React.Suspense>
  )
}

const router = createBrowserRouter([
  {
    path: '/',
    errorElement: <NotFoundPage />,
    element: <Layouts />,
    children: [
      {
        path: '',
        element: <Navigate to={`${baseRouteUrl}/welcome`} />,
      },
      {
        path: `${baseRouteUrl}/welcome`,
        index: true,
        element: <WelcomePage />,
      },
      {
        path: `${baseRouteUrl}/member-manager/member-list`,
        element: lazyLoader(MemberList),
      },
      {
        path: `${baseRouteUrl}/system-manager/role-privige`,
        element: lazyLoader(RolePrivige),
      },
      {
        path: `${baseRouteUrl}/system-manager/system-account`,
        element: lazyLoader(SystemAccount),
      },
      {
        path: `${baseRouteUrl}/component-manager/rich-text`,
        element: lazyLoader(RichTextPage),
      },
      {
        path: `${baseRouteUrl}/component-manager/back-top`,
        element: lazyLoader(BackTopPage),
      },
      {
        path: `${baseRouteUrl}/component-manager/count-to`,
        element: lazyLoader(CountToPage),
      },
      {
        path: `${baseRouteUrl}/charts-manager/word-cloud`,
        element: lazyLoader(WordCloudPage),
      },
      {
        path: `${baseRouteUrl}/charts-manager/dualAxes`,
        element: lazyLoader(DualAxesPage),
      },
      {
        path: `${baseRouteUrl}/charts-manager/water-liquid`,
        element: lazyLoader(WaterLiquidPage),
      },
      {
        path: `${baseRouteUrl}/error-manager/403`,
        element: lazyLoader(Error403Page),
      },
      {
        path: `${baseRouteUrl}/error-manager/500`,
        element: lazyLoader(Error500Page),
      },
    ],
  },
  {
    path: '/login',
    element: <LoginPage />,
  },
])
export default router
