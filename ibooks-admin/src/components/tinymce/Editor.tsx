/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-29 11:52:19
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-29 15:55:06
 * @FilePath: /ibook-apps/ibooks-admin/src/components/tinymce/Editor.tsx
 * @Description: 富文本编辑器
 */
import { Editor, IAllProps } from '@tinymce/tinymce-react'
const tinymceConfig: IAllProps['init'] = {
  id: 'tiny1',
  // language_url: '/tinymce/lang/zh-Hans.js',
  language: 'zh_CN',
  height: 500,
  menubar: false,
  // plugins: ['fullscreen', 'link', 'wordcount'],
  plugins: [
    'link',
    'autolink',
    'image',
    'fullscreen',
    'wordcount',
    'code',
    'codesample',
    'preview',
    'table',
  ],
  toolbar:
    'undo redo styles bold italic code codesample backcolor forecolor | table alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | wordcount preview fullscreen',
  content_style:
    'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }',
  placeholder: '请输入待分析文本',
  save_onsavecallback: function () {
    console.log('Saved')
  },
  // file_picker_callback: function (callback, value, meta) {
  //   //文件分类
  //   let filetype =
  //     '.pdf, .txt, .zip, .rar, .7z, .doc, .docx, .xls, .xlsx, .ppt, .pptx, .mp3, .mp4'
  //   let upurl = '/api/controller/'
  //   //为不同插件指定文件类型及后端地址
  //   switch (meta.filetype) {
  //     case 'image':
  //       filetype = '.jpg, .jpeg, .png, .gif'
  //       upurl += 'action1'
  //       break
  //     case 'media':
  //       filetype = '.mp3, .mp4'
  //       upurl += 'action2'
  //       break
  //     case 'file':
  //       break
  //   }
  //   //模拟出一个input用于添加本地文件
  //   const input = document.createElement('input')
  //   input.setAttribute('type', 'file')
  //   input.setAttribute('accept', filetype)
  //   input.click()
  //   input.onchange = function () {
  //     const file = this.files[0]
  //     let xhr, formData
  //     console.log(file.name)
  //     //TODO:这里写请求
  //   }
  // },
}
export interface TinymceEditorProps extends Omit<IAllProps, 'onChange'> {
  onChange?: (content: string) => void
}
const TinymceEditor: React.FC<TinymceEditorProps> = (props) => {
  const { onChange, ...newProps } = props
  // 文本变化时
  const handleChange = (content: string) => {
    console.log(content)
    onChange?.(content)
  }
  return (
    <Editor
      onEditorChange={handleChange}
      apiKey={'hmkndwpm48ji6a3l6plw36eqbnpzhbgk19jbqyexgzbln0k2'}
      init={tinymceConfig}
      {...newProps}
    />
  )
}

export default TinymceEditor
