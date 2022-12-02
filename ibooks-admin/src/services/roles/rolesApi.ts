import { baseApi } from '@/services/baseApi'

export const rolesApi = baseApi.injectEndpoints({
  endpoints: (builder) => ({
    roleAccountList: builder.mutation({
      query: (credentials = {}) => ({
        url: '/role/list',
        method: 'post',
        data: credentials,
      }),
    }),
  }),
})

export const { useRoleAccountListMutation } = rolesApi
