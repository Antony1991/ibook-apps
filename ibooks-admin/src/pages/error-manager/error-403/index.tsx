/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-02 11:19:01
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-02 12:30:11
 * @FilePath: /ibook-apps/ibooks-admin/src/pages/error-manager/error-401/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { Button, Result } from 'antd'
import React from 'react'
import { motion } from 'framer-motion'
import { useNavigate } from 'react-router-dom'

const Error403Page = () => {
  const navigate = useNavigate()
  const handleClick = () => {
    navigate('/app/welcome')
  }
  return (
    <motion.div
      initial={{ opacity: 0, translateY: 40 }}
      animate={{ opacity: 1, translateY: 0 }}
      transition={{ ease: 'easeInOut', duration: 0.3 }}
    >
      <Result
        status={'403'}
        title={'403'}
        subTitle="对不起，你没有访问此页面的权限"
        extra={
          <Button type="primary" onClick={handleClick}>
            返回首页
          </Button>
        }
      />
    </motion.div>
  )
}
export default Error403Page
