import { chartsApi } from '@/services/charts/chartsApi'
import { createSlice } from '@reduxjs/toolkit'

interface ChartsStateProp {
  wordClouds: any[] // 词云
}

const chartsState: ChartsStateProp = {
  wordClouds: [],
}

export const chartsSlice = createSlice({
  name: 'charts',
  initialState: chartsState,
  reducers: {},
  extraReducers: (builder) => {
    builder.addMatcher(
      chartsApi.endpoints.wordClouds.matchFulfilled,
      (state, { payload }) => {
        console.log('============', payload)
        state.wordClouds = payload
      }
    )
  },
})
export default chartsSlice.reducer
