/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-23 17:53:48
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-23 18:03:27
 * @FilePath: /ibook-apps/ibooks-admin/src/redux/features/couter/counterSlice.ts
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import {createSlice} from '@reduxjs/toolkit'
import type {PayloadAction} from '@reduxjs/toolkit'

export interface CounterState {
  value: number
}

const initState:CounterState = {
  value: 0
}

export const counterSlice = createSlice({
  name: 'counter',
  initialState: initState,
  reducers: {
    increment: (state) => {
      state.value += 1;
    }
  }
})
export const {increment} = counterSlice.actions
export default counterSlice.reducer