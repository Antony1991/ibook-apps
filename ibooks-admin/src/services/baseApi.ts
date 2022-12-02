/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-01 19:33:24
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-01 19:36:39
 * @FilePath: /ibook-apps/ibooks-admin/src/services/baseApi.ts
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { createApi } from '@reduxjs/toolkit/query/react'
import { axiosBaseQuery } from '@/services/request'

export const baseApi = createApi({
  baseQuery: axiosBaseQuery(),
  endpoints: () => ({}),
})
