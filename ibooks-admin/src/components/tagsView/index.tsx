/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-30 20:56:16
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-01 20:46:44
 * @FilePath: /ibook-apps/ibooks-admin/src/components/tagsView/index.tsx
 * @Description: tagsview
 */
import React, { useRef } from 'react'
import styles from './index.module.less'
import { CloseCircleOutlined } from '@ant-design/icons'
import clsx from 'clsx'
import { useDispatch, useSelector } from 'react-redux'
import { RootState } from '@/redux/store'
import {
  deleteItemTagView,
  TagItemProp,
} from '@/redux/features/users/usersSlice'
import { useLocation, useNavigate } from 'react-router-dom'

const TagsView: React.FC = () => {
  const tagList: TagItemProp[] = useSelector(
    (state: RootState) => state.users.tagList
  )
  const cNav = useLocation()
  const navigate = useNavigate()
  const dispatch = useDispatch()
  const ref = useRef<HTMLUListElement>(null)

  const itemClick = (item: TagItemProp) => {
    if (item.path !== cNav.pathname) {
      navigate(item.path)
      if (ref.current) {
        const current = ref.current
        /// 元素的宽度
        const containerWidth = current.offsetWidth

        let firstTag = null
        let lastTag = null
        if (tagList.length > 0) {
          firstTag = tagList[0]
          lastTag = tagList[tagList.length - 1]
        }
        if (firstTag?.path === item.path) {
          current.scrollTo({
            left: 0,
            behavior: 'smooth',
          })
        } else if (lastTag?.path === item.path) {
          current.scrollTo({
            left: current.scrollWidth - containerWidth,
            behavior: 'smooth',
          })
        } else {
          const i = tagList.findIndex((tag) => tag.path === item.path)
          const prevTagIdx = i - 1
          const nextTagIdx = i + 1

          const nextTagEl: any = current.children[nextTagIdx]
          const prevTagEl: any = current.children[prevTagIdx]

          const afterNextTagOffsetLeft =
            nextTagEl.offsetLeft + nextTagEl.offsetWidth + 5
          const prevTagOffsetLeft = prevTagEl.offsetLeft - 5
          console.log('scrollLeft', current.scrollLeft)
          console.log('containerWidth', containerWidth)
          console.log('prevTagOffsetLeft', prevTagOffsetLeft)
          if (afterNextTagOffsetLeft > current.scrollLeft + containerWidth) {
            current.scrollTo({
              left: afterNextTagOffsetLeft - containerWidth,
              behavior: 'smooth',
            })
          } else if (prevTagOffsetLeft < current.scrollLeft) {
            current.scrollTo({
              left: prevTagOffsetLeft,
              behavior: 'smooth',
            })
          } else {
            current.scrollTo({
              left: prevTagOffsetLeft - containerWidth,
              behavior: 'smooth',
            })
          }
        }
      }
    }
  }
  // 关闭当前
  const itemClose = (item: TagItemProp) => {
    if (tagList.length > 1) {
      dispatch(deleteItemTagView(item))
      navigate(-1)
    }
  }
  return (
    <ul ref={ref} className={styles.tagsView}>
      {tagList.map((item: TagItemProp) => (
        <li
          key={item.path}
          onClick={() => itemClick(item)}
          className={clsx({ [styles.active]: cNav.pathname === item.path })}
        >
          {cNav.pathname === item.path && <i />}
          <span>{item.name}</span>
          {cNav.pathname === item.path && (
            <CloseCircleOutlined
              onClick={() => itemClose(item)}
              style={{ fontSize: '12px' }}
            />
          )}
        </li>
      ))}
    </ul>
  )
}

export default TagsView
