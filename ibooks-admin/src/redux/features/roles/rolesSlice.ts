/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-27 20:04:22
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-27 20:17:36
 * @FilePath: /ibook-apps/ibooks-admin/src/redux/features/roles/rolesSlice.ts
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { createSlice } from '@reduxjs/toolkit'
import { userAccessList } from './rolesConfig'

export interface RolesState {
  accessList: any[]
}
const initState: RolesState = {
  accessList: userAccessList,
}
export const rolesSlice = createSlice({
  name: 'roles',
  initialState: initState,
  reducers: {},
})

// export const {} = rolesSlice.actions
export default rolesSlice.reducer
