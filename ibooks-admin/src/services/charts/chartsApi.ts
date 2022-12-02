/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-01 17:33:06
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-01 19:38:09
 * @FilePath: /ibook-apps/ibooks-admin/src/services/charts/chartsApi.ts
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { baseApi } from '@/services/baseApi'

export const chartsApi = baseApi.injectEndpoints({
  endpoints: (builder) => ({
    wordClouds: builder.query({
      query: (credentials) => ({
        url: 'https://gw.alipayobjects.com/os/antvdemo/assets/data/antv-keywords.json',
        method: 'GET',
        body: credentials,
      }),
    }),
  }),
})

export const { useWordCloudsQuery } = chartsApi
