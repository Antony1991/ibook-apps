/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-24 12:27:10
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-28 13:47:54
 * @FilePath: /ibook-apps/ibooks-admin/src/components/proTable/typing.ts
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import { ListToolBarProps } from '@ant-design/pro-components'
import {
  ColProps,
  DatePickerProps,
  FormItemProps,
  InputProps,
  SelectProps,
  TableProps,
} from 'antd'
import type {
  ColumnsType,
  ColumnType,
  SortOrder,
} from 'antd/es/table/interface'
import React from 'react'

export type ProColumnGroupType<RecordType, ValueType> = {
  children: ProColumns<RecordType>[]
} & ProColumnType<RecordType, ValueType>
export type ProColumnType<T = unknown, ValueType = 'text'> = {
  index?: number
  /**@name 是否缩略 */
  ellipsis?: ColumnType<T>['ellipsis']
  /**@name 是否拷贝 */
  copyable?: boolean
  /** 在查询表单中隐藏 */
  search?: false
  /**@name 在 table 中隐藏 */
  hideInTable?: boolean
  /**@name 在新建表单中删除 */
  hideInForm?: boolean
}
export type ProColumns<T = any, ValueType = 'text'> =
  | ProColumnGroupType<T, ValueType>
  | ProColumnType<T, ValueType>
export type RequestData<T> = {
  data: never[]
  total: number
} & Record<string, any>
export type PageInfo = {
  pageSize: number
  total: number
  current: number
}
/** 操作类型 */
// eslint-disable-next-line @typescript-eslint/ban-types
export type ProCoreActionType<T = {}> = {
  /** @name 刷新 */
  reload: (resetPageIndex?: boolean) => Promise<void>
  /** @name 刷新并清空，只清空页面，不包括表单 */
  reloadAndRest?: () => Promise<void>
  /** @name 重置任何输入项，包括表单 */
  reset?: () => void
  /** @name 清空选择 */
  clearSelected?: () => void
  /** @name p页面的信息都在里面 */
  pageInfo?: PageInfo
}
export type ActionType = ProCoreActionType & {
  fullScreen?: () => void
  setPageInfo?: (page: Partial<PageInfo>) => void
}
export type SearchParam = {
  current: number
  pageSize: number
  clearPagination: boolean
  values: object
}
/**
 * ProTable 的类型定义 继承自 antd 的 Table
 */
export type ProTableProps = {
  /**@name ListToolBar 的属性 */
  toolbar?: ListToolBarProps
  /**@name request 获取 dataSource的方法 */
  request<T>(searchParam: SearchParam): Promise<RequestData<T>>
  /**
   * @name 初始化的参数，可以操作 table
   *
   * @example 重置表格
   * actionRef.current?.reset()
   */
  actionRef?: React.Ref<ActionType | undefined>
  /**
   * @name 操作自带的 form
   */
  formRef?: any
  /**
   * @name 渲染操作栏
   */
  toolBarRender?: () => React.ReactNode

  /**@name 默认defaultPageSize */
  defaultPageSize?: number

  /** @name 是否手动触发请求 */
  manualRequest?: boolean
  /**
   * @name 数据加载完触发
   */
  onLoad?: (dataSource: any[]) => void
  /**
   * @name 数据加载失败时触发
   */
  onRequestError?: (e: Error) => void

  /**@name 查询form */
  searchFields?: SearchForm[] | (() => SearchForm[])

  /**@name 查询和重置 旁边支持新增等额外的按钮 */
  extraButtons?: () => React.ReactNode
} & TableProps<any>

export type ParamsType = Record<string, any>
export type PayloadProp = {
  options?: OptionProp[]
  /**@name 当前表单的属性 */
  currentProps?: any
}
export type OptionProp = {
  key: string
  label: string
  value: string | number | undefined
}
export type RenderType = 'input' | 'select'
export type SearchForm = {
  /**@name 对应formItem 的 name */
  name: string
  /**@name formItem 的label */
  label: string
  /**@name 初始化的值 */
  initValue?: any
  /**@name form表单包含的类型 */
  type: RenderType
  /**@name 合并多个field */
  for?: string
  /**@name formItem的布局 */
  fieldCol?: ColProps
  /**@name formItem的label的布局 */
  labelCol?: ColProps
  /**@name 当前表单的属性 */
  payload?: PayloadProp
  /**@name 自定义render方法 */
  render?: (payload?: PayloadProp) => React.ReactNode
  formItemProps?: FormItemProps
}

export type SearchFunc<T = void> = (
  curren: number,
  values: object,
  clearPagination: boolean
) => Promise<T>
