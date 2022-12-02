/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-29 11:58:54
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-29 20:05:43
 * @FilePath: /ibook-apps/ibooks-admin/src/pages/component-manager/rich-text/index.tsx
 * @Description: 富文本页面
 */
import TinymceEditor from '@/components/tinymce/Editor'
import { Alert, Card } from 'antd'
import React, { useEffect } from 'react'

const RichTextPage = () => {
  useEffect(() => {
    console.log('rich')
  }, [])

  return (
    <div>
      <Card>
        <Alert
          message={
            <span>
              富文本是管理后台一个核心的功能，但同时又是一个有很多坑的地方。在选择富文本的过程中我也走了不少的弯路，市面上常见的富文本都基本用过了，最终权衡了一下选择了
              <a target="_blank" href="https://www.tiny.cloud/docs/tinymce/6/">
                Tinymce
              </a>
              。更详细的富文本比较和介绍见 文档
            </span>
          }
          type="info"
          style={{ marginBottom: '20px' }}
        />
        <TinymceEditor />
      </Card>
    </div>
  )
}

export default RichTextPage
