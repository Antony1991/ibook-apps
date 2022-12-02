/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-27 12:48:06
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-27 17:37:34
 * @FilePath: /ibook-apps/ibooks-admin/src/services/request.ts
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { getToken } from '@/utils/token'
import axios, {
  AxiosInstance,
  AxiosRequestConfig,
  AxiosError,
  AxiosRequestHeaders,
  AxiosResponse,
} from 'axios'
import type { BaseQueryFn } from '@reduxjs/toolkit/query'

const instance: AxiosInstance = axios.create({
  baseURL: '/api/v1',
  timeout: 1000 * 50,
  headers: {
    'content-type': 'application/json',
  },
})
// 请求拦截
instance.interceptors.request.use(
  (config: AxiosRequestConfig) => {
    // 请求头token
    const token = getToken()
    if (token && !config.url?.startsWith('https')) {
      ; (config.headers as AxiosRequestHeaders)[
        'Authorization'
      ] = `Bearer ${token}`
    }
    return config
  },
  (err: AxiosError) => {
    console.log(err)
    return Promise.reject(err)
  }
)

// 响应拦截
instance.interceptors.response.use(
  (response: AxiosResponse) => {
    const data = response.data
    if (data.code === 10001) {
      // 登录过期
    }
    if (response.config.url?.startsWith('https:')) {
      return response
    }
    return response.data
  },
  (err: AxiosError) => {
    console.log(err)
    return Promise.reject(err)
  }
)
export interface IResponseData<T> {
  code: number
  message: string
  data: T
}
export const axiosBaseQuery = (): BaseQueryFn<
  {
    url: string
    method: AxiosRequestConfig['method']
    data?: AxiosRequestConfig['data']
    params?: AxiosRequestConfig['params']
  },
  unknown,
  unknown
> => {
  return ({ url, method, data, params }) => {
    return instance({ url, method, data, params })
  }
}
// export default {
//   get<T>(url: string, params?: object): Promise<IResponseData<T>> {
//     return instance.get(url, { params })
//   },
//   post<T>(url: string, params?: object): Promise<IResponseData<T>> {
//     return instance.post(url, params)
//   },
// }
