/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-28 09:55:19
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-28 13:09:41
 * @FilePath: /ibook-apps/ibooks-admin/src/utils/modalWrap.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import React from 'react'
import ReactDOM from 'react-dom/client'
let modalRoot: any
export const modalWrap = (component: any) => {
  // 销毁组件
  const destory = () => {
    // debugger
    // const unmountComponent = ReactDOM.unmountComponentAtNode(element)
    if (modalRoot) {
      setTimeout(() => {
        console.log('--modalRoot', modalRoot)
        // element.parentNode!.removeChild(element)
        modalRoot.unmount()
        // modalRoot = null
      }, 300)
    }
  }
  // 渲染组件
  const render = ({ element, component, config }: any) => {
    const instance = React.createElement(component, {
      ...config,
      close: () => {
        destory()
      },
      visible: true,
    })
    if (modalRoot && modalRoot._internalRoot) {
      modalRoot.render(instance)
    } else {
      modalRoot = ReactDOM.createRoot(element)
      modalRoot.render(instance)
    }
    // ReactDOM.createRoot(element).render(instance)
  }

  return (config: any) => {
    console.log('------render')
    const element = document.createElement('div')
    render({ element, component, config })
    // document.body.appendChild(element)
  }
}
