/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-23 17:15:59
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-01 19:46:46
 * @FilePath: /ibook-apps/ibooks-admin/src/redux/store.ts
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { configureStore } from '@reduxjs/toolkit'
import counterReducer from '@/redux/features/couter/counterSlice'
import usersReducer from '@/redux/features/users/usersSlice'
import logger from 'redux-logger'
// import { userApi } from '@/services/user/userApi'
import rolesReducer from '@/redux/features/roles/rolesSlice'
import chartsReducer from '@/redux/features/charts/chartsSlice'
// import { chartsApi } from '@/services/charts/chartsApi'
import { baseApi } from '@/services/baseApi'

export const store = configureStore({
  reducer: {
    users: usersReducer,
    counter: counterReducer,
    roles: rolesReducer,
    charts: chartsReducer,
    [baseApi.reducerPath]: baseApi.reducer,
  },
  middleware: (middlewares) =>
    middlewares().concat(baseApi.middleware).concat(logger),
})

export type RootState = ReturnType<typeof store.getState>

export type AppDispatch = typeof store.dispatch
