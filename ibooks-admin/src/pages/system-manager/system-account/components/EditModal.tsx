import FormFields from '@/components/formFields'
import RootModal, { RootModalProps } from '@/components/modal/root-modal'
import { Form, Input } from 'antd'
import React, { useState, useImperativeHandle, forwardRef, useCallback } from 'react'
export type SyAccountDrawerParam = {
  title: string
  formApi: Function // 提交的接口
  onUpdate(): void
}
export interface EditModalProp extends RootModalProps {
  ref?: any
}
const EditModal: React.FC<EditModalProp> = forwardRef(({ loading }, ref) => {
  const [visible, setvisible] = useState(false)
  const [drawerParam, setdrawerParam] = useState<Partial<SyAccountDrawerParam>>({})
  useImperativeHandle(
    ref,
    () => ({
      acceptDrawer
    }),
    [],
  )
  // 打开弹窗
  const acceptDrawer = (params: Partial<SyAccountDrawerParam>) => {
    setvisible(true)
    setdrawerParam(params)
  }
  // 关闭
  const handleClose = () => {
    setvisible(false)
  }
  const handleOk = useCallback(
    () => {
      form.validateFields().then(async (values) => {
        if (values) {
          const res = await drawerParam.formApi?.(values)
          setvisible(false)
          drawerParam.onUpdate?.()
        }
      })
    },
    [drawerParam],
  )
  const [form] = Form.useForm()
  return (
    <RootModal title={drawerParam.title} loading={loading} onClose={handleClose} open={visible} onOk={handleOk}>
      <FormFields
        form={form}
        fieldList={[
          {
            label: '账号',
            name: 'username',
            required: true,
            type: 'input',
            renderer: () => <Input />
          },
          {
            label: '角色名称',
            name: 'roleName',
            required: true,
            type: 'input',
            renderer: () => <Input />
          },
          {
            label: '登录密码',
            name: 'password',
            required: true,
            type: 'input',
            renderer: () => <Input.Password />
          }
        ]} />
    </RootModal>
  )
})

export default EditModal