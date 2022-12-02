/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-27 10:30:14
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-27 10:39:31
 * @FilePath: /ibook-apps/ibooks-admin/src/utils/storage.ts
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import Cookie from 'js-cookie'
const TOKEN_KEY = 'Authorization'
export const setToken = (value: any) => {
  Cookie.set(TOKEN_KEY, value)
}

export const getToken = () => {
  return Cookie.get(TOKEN_KEY)
}

export const removeToken = () => {
  Cookie.remove(TOKEN_KEY)
}
