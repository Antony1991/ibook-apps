/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-29 21:49:17
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-30 10:47:25
 * @FilePath: /ibook-apps/ibooks-admin/src/components/backToTop/index.tsx
 * @Description: 返回顶部
 */
import { ToTopOutlined } from '@ant-design/icons'
import React, { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import styles from './index.module.less'

export interface BackToTopProps {
  backPosition?: number
  visibilityHeight?: number
}
const BackToTop: React.FC<BackToTopProps> = ({
  backPosition = 0,
  visibilityHeight = 400,
}) => {
  const isMoving = useRef(false)
  const currentInterval = useRef<any>(null)
  const [visible, setvisible] = useState(false)
  useEffect(() => {
    window.addEventListener('scroll', handleScroll)

    return () => {
      window.removeEventListener('scroll', handleScroll)
      if (currentInterval.current) {
        clearInterval(currentInterval.current)
        currentInterval.current = null
      }
    }
  }, [])

  // 监听滚动
  const handleScroll = () => {
    console.log(window.pageYOffset)
    setvisible(window.pageYOffset > visibilityHeight)
  }
  // 点击组件时
  const handleClick = useCallback(() => {
    if (isMoving.current) {
      return
    }
    isMoving.current = true
    const start = window.pageYOffset
    console.log('y轴到屏幕的距离', start)
    let i = 0
    currentInterval.current = setInterval(() => {
      // 每次移动的距离
      const next = Math.floor(easeInOutQuad(10 * i, start, -start, 200))
      if (next <= backPosition) {
        window.scrollTo(0, backPosition)
        clearInterval(currentInterval.current)
        isMoving.current = false
      } else {
        window.scrollTo(0, next)
      }
      i++
    }, 16.7)
  }, [backPosition])
  const easeInOutQuad = (t: number, b: number, c: number, d: number) => {
    if ((t /= d / 2) < 1) return (c / 2) * t * t + b
    return (-c / 2) * (--t * (t - 2) - 1) + b
  }

  return useMemo(() => {
    return visible ? (
      <div className={styles.backTop} onClick={handleClick}>
        <ToTopOutlined style={{ fontSize: '20px' }} />
      </div>
    ) : null
  }, [handleClick, visible])
}

export default BackToTop
