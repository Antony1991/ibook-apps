/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-28 14:39:19
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-28 23:09:44
 * @FilePath: /ibook-apps/ibooks-admin/src/components/modal/root-modal.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import FormFields from '@/components/formFields'
import type { FieldItemProp } from '@/components/formFields'
import RootModal, { RootModalProps } from '@/components/modal/root-modal'
import { Form, Input, message, Select } from 'antd'
import React, {
  ForwardedRef,
  forwardRef,
  useImperativeHandle,
  useMemo,
  useState,
} from 'react'

type RootModalParam = {
  title: string // 标题
  formApi<T>(param: any): Promise<T> // form 提交api
  onUpdate: () => void // ok 更新
}
interface EditModalProps extends RootModalProps {
  ref?: ForwardedRef<any>
}
const EditModal: React.FC<EditModalProps> = forwardRef((props, ref) => {
  const [visible, setvisible] = useState(false)
  const [drawerParam, setdrawerParam] = useState<Partial<RootModalParam>>({})
  useImperativeHandle(ref, () => ({
    acceptDrawer,
  }))
  // 接收传过来的参数
  const acceptDrawer = (param: any) => {
    setvisible(true)
    setdrawerParam(param)
  }
  const onFinish = (values: object) => {
    console.log(values)
  }
  const handleOk = () => {
    form.validateFields().then((values) => {
      if (values) {
        message.success('open')
      }
    })
  }
  const handleClose = () => {
    setvisible(false)
  }
  const [form] = Form.useForm()
  const fieldList = useMemo(
    (): FieldItemProp[] => [
      {
        name: 'name',
        label: '用户名称',
        type: 'input',
        required: true,
        renderer: () => <Input />,
      },
      {
        name: 'password',
        label: '用户密码',
        type: 'input',
        required: true,
        renderer: () => <Input />,
      },
      {
        name: 'status',
        label: '状态',
        type: 'select',
        required: true,
        renderer: () => <Select />,
      },
    ],
    []
  )
  return (
    <RootModal
      onOk={handleOk}
      onClose={handleClose}
      title={drawerParam.title}
      open={visible}
      {...props}
    >
      <FormFields
        preserve={false}
        form={form}
        onFinish={onFinish}
        initialValues={{
          status: 0,
        }}
        fieldList={fieldList}
      />
    </RootModal>
  )
})
export default EditModal
