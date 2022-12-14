/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-27 10:35:41
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-04 17:10:14
 * @FilePath: /ibook-apps/ibooks-admin/src/redux/features/users/usersSlice.ts
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { MenuConfig } from '@/config/base'
import { userApi } from '@/services/user/userApi'
import { getFlatMenus } from '@/utils'
import { getToken, setToken } from '@/utils/token'
import { createSlice } from '@reduxjs/toolkit'

export type TagItemProp = {
  name: string
  path: string
}
export interface UsersState {
  token?: string
  tagList: TagItemProp[]
  colorPrimary: string
  flatMenus: MenuConfig[]
}

const initState: UsersState = {
  token: getToken(),
  tagList: [],
  colorPrimary: '#1677FF',
  flatMenus: [],
}
export const usersSlice = createSlice({
  name: 'users',
  initialState: initState,
  reducers: {
    setUserToken(state, payload) {
      state.token = payload.payload
      setToken(state.token)
    },
    // 设置主题色
    changePrimaryColor(state, { payload }) {
      state.colorPrimary = payload
    },
    // 扁平化菜单数组
    initFlatMenus(state, { payload = [] }) {
      state.flatMenus = getFlatMenus(payload)
    },
    // 新增一个路由tag
    addTagView(state, { payload }: { payload: TagItemProp }) {
      if (
        !state.tagList.find(
          (item) => item.name === payload.name && item.path === payload.path
        )
      ) {
        state.tagList = [...state.tagList, payload] as TagItemProp[]
      }
    },
    // 删除当前的路由tag
    deleteItemTagView(state, { payload }: { payload: TagItemProp }) {
      const idx = state.tagList.findIndex((item) => item.path === payload.path)
      state.tagList = [
        ...state.tagList.slice(0, idx),
        ...state.tagList.slice(idx + 1),
      ]
    },
    // 登出
    logout(state) {
      state.token = ''
    },
  },
  extraReducers: (builder) => {
    builder.addMatcher(
      userApi.endpoints.login.matchFulfilled,
      (state, { payload }) => {
        state.token = payload.accessToken as string
        setToken(state.token)
      }
    )
  },
})

export const {
  setUserToken,
  addTagView,
  deleteItemTagView,
  logout,
  changePrimaryColor,
  initFlatMenus,
} = usersSlice.actions
export default usersSlice.reducer
