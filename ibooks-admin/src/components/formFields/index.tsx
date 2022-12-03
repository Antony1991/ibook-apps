/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-28 20:31:28
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-28 23:01:13
 * @FilePath: /ibook-apps/ibooks-admin/src/components/formFields/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { Form, FormItemProps, FormProps, Input } from 'antd'
import { Rule } from 'antd/es/form'
import React, { useCallback, useMemo } from 'react'

const typePlaceholder = {
  input: '请输入',
  select: '请选择',
}

export type FieldItemProp = {
  /**@name 字段 */
  name: string

  /**@name label */
  label: string

  /**@name 表单的类型 */
  type: 'input' | 'select'

  /**@name placeholder */
  placeholder?: string

  /**@name 必选时的提示语*/
  message?: string

  /**@name 渲染子组件 */
  renderer: () => React.ReactElement

  /**@name 是否是必填 */
  required?: boolean
} & Omit<FormItemProps, 'name' | 'label'>
export interface FormFieldsProps extends Omit<FormProps, 'fields'> {
  fieldList: FieldItemProp[]
}
const FormFields: React.FC<FormFieldsProps> = (props) => {
  const { fieldList, labelCol = { span: 5 }, ...newProps } = props
  const renderField = useCallback(
    ({
      renderer,
      type,
      label,
      required,
      message,
      placeholder,
      name,
      rules,
      ...rest
    }: FieldItemProp) => {
      // 判断验证form vilidate
      let validateRules: Rule[] = []
      if (rules?.length) {
        validateRules = rules
      } else {
        if (required) {
          if (message) {
            validateRules = [{ required: true, message }]
          } else {
            validateRules = [{ required: true, message: `${label}不能为空` }]
          }
        }
      }
      // 渲染表单的方法
      const renderNode = React.cloneElement(renderer(), {
        placeholder:
          placeholder || typePlaceholder[type]
            ? `${typePlaceholder[type]}${label}`
            : '',
      })
      return (
        <Form.Item
          key={name}
          name={name}
          label={label}
          rules={validateRules}
          labelCol={labelCol}
          {...rest}
        >
          {renderNode}
        </Form.Item>
      )
    },
    [labelCol]
  )

  return useMemo(() => {
    return (
      <Form {...newProps}>{fieldList.map((item) => renderField(item))}</Form>
    )
  }, [fieldList])
}
export default FormFields
