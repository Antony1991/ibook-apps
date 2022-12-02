/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-30 11:14:18
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-30 19:50:50
 * @FilePath: /ibook-apps/ibooks-admin/src/pages/component-manager/count-to/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import {
  Alert,
  Button,
  Card,
  Checkbox,
  Col,
  Divider,
  Input,
  InputNumber,
  Row,
  Space,
} from 'antd'
import { useCountUp } from 'react-countup'
import { useCountUpProps } from 'react-countup/build/useCountUp'
import React, { useRef, useState } from 'react'
import { SwapOutlined } from '@ant-design/icons'
const InputWh = '160px'
const CountToPage = () => {
  const countUpRef = useRef(null)
  const [countUpParam, setcountUpParam] = useState<
    Omit<useCountUpProps, 'ref'>
  >({
    start: 0,
    end: 100000,
    delay: 0,
    duration: 2,
    separator: ',',
    decimal: '23',
    prefix: '',
    suffix: '',
    useEasing: true,
  })
  const { start, pauseResume, reset, update } = useCountUp({
    ...countUpParam,
    ref: countUpRef,
    startOnMount: false,
  })
  const setValues = (
    value: string | number | undefined | boolean,
    name: string
  ) => {
    setcountUpParam((param) => ({
      ...param,
      [name]: value,
    }))
  }
  // 转换
  const swapClick = () => {
    setValues(countUpParam.start as number, 'end')
    setValues(countUpParam.end as number, 'start')
  }
  return (
    <div>
      <Alert
        message={
          <span>
            这是一个数字滚动的组件，基于
            <a target="_blank" href="https://inorganik.github.io/countUp.js/">
              countup.js
            </a>
          </span>
        }
      ></Alert>
      <Card>
        <h2 ref={countUpRef} style={{ fontSize: '80px' }}>
          0
        </h2>
        <Row align="middle">
          <Col span={1}>
            <span>参数：</span>
          </Col>
          <Col span={22}>
            <Row>
              <Space>
                <Input
                  style={{ width: InputWh }}
                  value={countUpParam.start}
                  onChange={(e) => setValues(e.target.value, 'start')}
                  suffix={'开始'}
                />
                <Button
                  type="primary"
                  icon={<SwapOutlined />}
                  onClick={swapClick}
                />
                <Input
                  style={{ width: InputWh }}
                  value={countUpParam.end}
                  onChange={(e) => setValues(e.target.value, 'end')}
                  suffix={'结束'}
                />
                <InputNumber
                  style={{ width: InputWh, marginLeft: '20px' }}
                  value={countUpParam.decimal}
                  onChange={(value) => setValues(value!, 'decimal')}
                  addonAfter={'小数点位'}
                />
                <Input
                  style={{ width: InputWh }}
                  value={countUpParam.duration}
                  onChange={(e) => setValues(e.target.value, 'duration')}
                  suffix={'时间'}
                />
              </Space>
            </Row>
          </Col>
        </Row>
        <Divider />
        <Row align="middle">
          <Col span={1}>
            <span>选项：</span>
          </Col>
          <Col span={22}>
            <Row>
              <Space>
                <Checkbox
                  checked={countUpParam.useEasing}
                  onChange={(e) => setValues(e.target.checked, 'useEasing')}
                >
                  使用 easing
                </Checkbox>
                <Input
                  style={{ width: InputWh }}
                  suffix={'Separator'}
                  value={countUpParam.separator}
                  onChange={(e) => setValues(e.target.value, 'separator')}
                />
                <Input
                  style={{ width: InputWh }}
                  suffix={'Prefix'}
                  value={countUpParam.prefix}
                  onChange={(e) => setValues(e.target.value, 'prefix')}
                />
                <Input
                  style={{ width: InputWh }}
                  suffix={'Suffix'}
                  value={countUpParam.suffix}
                  onChange={(e) => setValues(e.target.value, 'suffix')}
                />
              </Space>
            </Row>
          </Col>
        </Row>
        <Divider />
        <Row align="middle">
          <Col span={1}>
            <span>方法：</span>
          </Col>
          <Col span={22}>
            <Row>
              <Space>
                <Button type="primary" onClick={start}>
                  开始
                </Button>
                <Button type="primary" onClick={pauseResume}>
                  暂停/重启
                </Button>
                <Button type="primary" onClick={reset}>
                  重置
                </Button>
                <Button type="primary" onClick={() => update(2000)}>
                  更新
                </Button>
              </Space>
            </Row>
          </Col>
        </Row>
        <Divider />
      </Card>
    </div>
  )
}
export default CountToPage
