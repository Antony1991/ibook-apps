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
    createAccount: builder.mutation({
      query: (data = {}) => ({
        url: '/role/create',
        method: 'post',
        data
      })
    })
  }),
})

export const { useRoleAccountListMutation, useCreateAccountMutation } = rolesApi
