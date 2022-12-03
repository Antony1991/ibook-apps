/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-03 14:08:10
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-03 19:30:43
 * @FilePath: /ibook-apps/ibooks-admin/src/pages/system-manager/system-account/components/EditModal.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import FormFields from '@/components/formFields'
import RootModal, { RootModalProps } from '@/components/modal/root-modal'
import { Form, Input } from 'antd'
import React, {
  useState,
  useImperativeHandle,
  forwardRef,
  useCallback,
} from 'react'
export type SyAccountDrawerParam = {
  title: string
  formApi: (params: any) => void // 提交的接口
  onUpdate(): void
}
export interface EditModalProp extends RootModalProps {
  ref?: any
  record?: any
}
const EditModal: React.FC<EditModalProp> = forwardRef((props, ref) => {
  const { record = {} } = props
  const [visible, setvisible] = useState(false)
  const [loading, setloading] = useState(false)
  const [drawerParam, setdrawerParam] = useState<Partial<SyAccountDrawerParam>>(
    {}
  )
  useImperativeHandle(
    ref,
    () => ({
      acceptDrawer,
    }),
    []
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
  const handleOk = useCallback(() => {
    form.validateFields().then(async (values) => {
      if (values) {
        setloading(true)
        const res = await drawerParam.formApi?.(
          record?.id ? { ...values, id: record.id } : values
        )
        setloading(false)
        setvisible(false)
        drawerParam.onUpdate?.()
      }
    })
  }, [drawerParam, record.id])
  const [form] = Form.useForm()
  return (
    <RootModal
      title={drawerParam.title}
      loading={loading}
      onClose={handleClose}
      open={visible}
      onOk={handleOk}
    >
      <FormFields
        form={form}
        preserve={false}
        fieldList={[
          {
            label: '账号',
            name: 'username',
            required: true,
            type: 'input',
            initialValue: record?.username,
            renderer: () => <Input />,
          },
          {
            label: '角色名称',
            name: 'roleName',
            required: true,
            type: 'input',
            initialValue: record?.role_name,
            renderer: () => <Input />,
          },
          {
            label: '登录密码',
            name: 'password',
            required: true,
            type: 'input',
            renderer: () => <Input.Password />,
          },
        ]}
      />
    </RootModal>
  )
})

export default EditModal
