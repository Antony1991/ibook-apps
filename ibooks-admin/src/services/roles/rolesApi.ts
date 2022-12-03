/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-03 14:08:10
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-03 19:10:20
 * @FilePath: /ibook-apps/ibooks-admin/src/services/roles/rolesApi.ts
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { baseApi } from '@/services/baseApi'

export const rolesApi = baseApi.injectEndpoints({
  endpoints: (builder) => ({
    // 获取角色账号列表
    roleAccountList: builder.mutation({
      query: (credentials = {}) => ({
        url: '/role/list',
        method: 'post',
        data: credentials,
      }),
    }),
    // 创建角色账号
    createAccount: builder.mutation({
      query: (data = {}) => ({
        url: '/role/create',
        method: 'post',
        data,
      }),
    }),
    // 更新角色账号
    updateAccount: builder.mutation({
      query: (data = {}) => ({
        url: '/role/update',
        method: 'post',
        data,
      }),
    }),
    // 删除单个角色账号
    deleteAccount: builder.mutation({
      query: (data = {}) => ({
        url: '/role/delete',
        method: 'post',
        data,
      }),
    }),
  }),
})

export const {
  useRoleAccountListMutation,
  useCreateAccountMutation,
  useUpdateAccountMutation,
  useDeleteAccountMutation,
} = rolesApi
