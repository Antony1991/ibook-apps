/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-04 18:04:12
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-04 19:03:39
 * @FilePath: /ibook-apps/ibooks-admin/urls.ts
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import type { Plugin, ViteDevServer } from 'vite'

const VITE_PLUGIN_NAME = 'vite_plugin_print_urls'

function PluginDecorator(): Plugin {
  const logger = (server: ViteDevServer) => {
    const { config } = server
    config.logger.info('current runing env', {
      clear: false,
      timestamp: true,
    })
  }
  return {
    name: VITE_PLUGIN_NAME,
    enforce: 'post',
    apply: 'serve',
    configureServer(server: ViteDevServer) {
      return () => {
        server.middlewares.use((req, res, next) => {
          next()
          logger(server)
        })
      }
    },
    handleHotUpdate(ctx) {
      logger(ctx.server)
    },
  }
}

export default PluginDecorator
