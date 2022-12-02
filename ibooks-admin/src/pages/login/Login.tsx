/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-26 14:12:12
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-02 11:09:43
 * @FilePath: /ibook-apps/ibooks-admin/src/pages/login/Login.tsx
 * @Description: 登录页
 */
import {
  EyeInvisibleOutlined,
  EyeTwoTone,
  LockOutlined,
  UserOutlined,
} from '@ant-design/icons'
import { Button, Card, Form, Input } from 'antd'
import React, { useCallback, useMemo } from 'react'
import reactLogo from '@/assets/react.svg'
import { useNavigate } from 'react-router-dom'
import { useLoginMutation } from '@/services/user/userApi'
const LoginPage = () => {
  const navigate = useNavigate()
  const [login, { isLoading }] = useLoginMutation()
  const onFinish = useCallback(async (values: any) => {
    const { data }: any = await login(values)
    if (data.accessToken) {
      navigate('/app/welcome', { replace: true })
    }
    // navigate('/app/member-manange/member-list')
  }, [])
  return useMemo(
    () => (
      <div className="login-page">
        <Card
          className="login-page__card"
          bodyStyle={{ padding: '40px 45px 25px' }}
          bordered={false}
        >
          <div className="login-page__title">
            <img src={reactLogo} />
            <h2>Hooks Admin</h2>
          </div>
          <div className="login-page__form">
            <Form onFinish={onFinish} size="large">
              <Form.Item
                name="username"
                rules={[{ required: true, message: '请输入用户名' }]}
              >
                <Input prefix={<UserOutlined />} placeholder="用户名：admin" />
              </Form.Item>
              <Form.Item
                name="password"
                rules={[{ required: true, message: '请输入密码' }]}
              >
                <Input.Password
                  prefix={<LockOutlined />}
                  type="password"
                  iconRender={(visible) =>
                    visible ? <EyeTwoTone /> : <EyeInvisibleOutlined />
                  }
                  placeholder="密码：123456"
                />
              </Form.Item>
              <Form.Item>
                <Button
                  htmlType="submit"
                  loading={isLoading}
                  type="primary"
                  style={{ width: '100%' }}
                >
                  登录
                </Button>
              </Form.Item>
            </Form>
          </div>
        </Card>
      </div>
    ),
    [isLoading]
  )
}

export default LoginPage
