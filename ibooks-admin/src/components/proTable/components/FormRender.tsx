/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-25 15:48:22
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-25 23:29:23
 * @FilePath: /ibook-apps/ibooks-admin/src/components/proTable/components/FormRender.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { Button, Card, Col, Form, FormInstance, Row, Space } from 'antd'
import React, { useCallback, useMemo, useRef } from 'react'
import { ProTableProps, SearchForm, SearchFunc } from '../typing'
import InputRender from './inputRender'
import SelectRender from './selectRender'

const combineRender = {
  input: InputRender,
  select: SelectRender,
}
interface FormRenderProp
  extends Omit<ProTableProps, 'searchFields' | 'request'> {
  searchFields?: SearchForm[]
  fetch: SearchFunc
  reset: SearchFunc
  loading: boolean
}
const FormRender: React.FC<FormRenderProp> = (props) => {
  const formRef = useRef<FormInstance>(null)
  const { searchFields, fetch, loading, reset } = props
  // 渲染单个formItem
  const getFormItem = useCallback(
    (searchField: SearchForm) => {
      function renderCom() {
        if (searchField.render) {
          // 自定义的render方法
          return searchField.render({ ...searchField.payload })
        }
        if (searchField.type) {
          if (combineRender[searchField.type]) {
            return combineRender[searchField.type]({ ...searchField.payload })
          } else {
            console.warn('无效的render')
            return false
          }
        }
        return false
      }
      const forFields = searchFields?.filter(
        (item) => item.name === searchField.for
      )
      const { label, name, initValue, formItemProps = {} } = searchField
      return (
        <Row>
          <Form.Item
            label={label}
            name={name}
            initialValue={initValue}
            {...formItemProps}
          >
            {renderCom()}
          </Form.Item>
        </Row>
      )
    },
    [searchFields]
  )
  // 查询form数组
  const fields = useMemo(() => {
    const fors = searchFields?.map((it) => it.for).filter((it) => it)
    console.log('-----fors', fors)
    const items = searchFields?.map((field: SearchForm) => {
      return (
        <Col style={{ margin: '0 6px' }} {...field.fieldCol}>
          {getFormItem(field)}
        </Col>
      )
    })
    return items
  }, [getFormItem, searchFields])
  const onFinish = (values: object) => {
    console.log('------values', values)
    fetch(1, values, true)
  }
  const onReset = () => {
    if (formRef.current) {
      const values: object = formRef.current.getFieldsValue(true)
      console.log('-------allvalues', values)
      formRef.current.resetFields()
      reset(1, values, true)
    }
  }
  return useMemo(() => {
    return (
      <Card
        style={{ marginBottom: '20px' }}
        bodyStyle={{ padding: '24px 24px 0' }}
      >
        <Form onFinish={onFinish} ref={formRef}>
          <Row>
            {fields}
            <Col style={{ padding: '0 6px' }}>
              <Form.Item>
                <Space>
                  <Button loading={loading} type="primary" htmlType="submit">
                    查询
                  </Button>
                  <Button loading={loading} onClick={onReset}>
                    重置
                  </Button>
                </Space>
              </Form.Item>
            </Col>
          </Row>
        </Form>
      </Card>
    )
  }, [fields, loading, onFinish, onReset])
}
export default FormRender
