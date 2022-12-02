/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-27 15:20:42
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-01 19:37:47
 * @FilePath: /ibook-apps/ibooks-admin/src/services/api/userApi.ts
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
// import request, { IResponseData } from '@/services/request'

// // 用户登录
// export function login<T>(params: object = {}): Promise<IResponseData<T>> {
//   return request.post('/users/login', params)
// }
import { baseApi } from '@/services/baseApi'

export const userApi = baseApi.injectEndpoints({
  endpoints: (builder) => ({
    login: builder.mutation({
      query: (credentials = {}) => {
        return {
          url: '/users/login',
          method: 'post',
          data: credentials,
        }
      },
    }),
  }),
})
export const { useLoginMutation } = userApi
