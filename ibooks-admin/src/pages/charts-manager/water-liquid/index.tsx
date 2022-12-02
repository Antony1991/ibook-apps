/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-01 21:01:35
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-01 21:17:12
 * @FilePath: /ibook-apps/ibooks-admin/src/pages/charts-manager/water-liquid/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { Alert, Card, Col, Row } from 'antd'
import React from 'react'
import { Liquid, LiquidConfig } from '@ant-design/plots'

const WaterLiquidPage = () => {
  const config1: LiquidConfig = {
    percent: 0.5,
    outline: {
      border: 2,
      distance: 8,
    },
    color: '#b37feb',
    wave: {
      count: 3,
      length: 128,
    },
  }
  const config2: LiquidConfig = {
    percent: 0.5,
    outline: {
      border: 2,
      distance: 8,
    },
    color: '#ff85c0',
    wave: {
      count: 3,
      length: 128,
    },
  }
  return (
    <div>
      <Card>
        <Alert message={'水波纹图'} />
      </Card>
      <Card>
        <Row>
          <Col span={12}>
            <Liquid {...config1} />
          </Col>
          <Col span={12}>
            <Liquid {...config2} />
          </Col>
        </Row>
      </Card>
    </div>
  )
}

export default WaterLiquidPage
