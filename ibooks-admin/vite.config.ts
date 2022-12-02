/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-23 16:30:40
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-02 10:11:12
 * @FilePath: /ibook-apps/ibooks-admin/vite.config.ts
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { defineConfig } from 'vite'
import path from 'path'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  server: {
    open: true,
  },
  resolve: {
    alias: {
      '@': path.join(__dirname, 'src'),
    },
  },
  plugins: [react()],
})
