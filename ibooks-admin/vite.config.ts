/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-23 16:30:40
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-02 10:11:12
 * @FilePath: /ibook-apps/ibooks-admin/vite.config.ts
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { defineConfig, type PluginOption } from 'vite'
import path from 'path'
import react from '@vitejs/plugin-react'
import { visualizer } from 'rollup-plugin-visualizer'

// https://vitejs.dev/config/
export default defineConfig(({ mode }) => {
  const plugins: PluginOption[] = [react()]
  console.log('-----------mode', mode)
  if (mode === 'production') {
    plugins.concat(...[visualizer({
      open: true,
      gzipSize: true,
      brotliSize: true
    })])
  }
  return {
    clearScreen: false,
    server: {
      open: true,
      cors: true,
      proxy: {
        '^/api/v1': {
          target: 'http://localhost:7001',
          changeOrigin: true,
        },
      },
    },
    resolve: {
      alias: {
        '@': path.join(__dirname, 'src'),
      },
    },
    plugins,
  }
})
