/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-23 22:58:11
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-01 20:44:29
 * @FilePath: /ibook-apps/ibooks-admin/src/pages/welcome/Welcome.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { Card, Row } from 'antd'
import React from 'react'
import WelcomeImg from '@/assets/images/welcome01.png'
import styles from './index.module.less'

const WelcomePagee = () => {
  return (
    <Card className="y-full">
      <Row align="middle" justify="center">
        <img src={WelcomeImg} className={styles.welcomeImg} />
      </Row>
    </Card>
  )
}

export default WelcomePagee
