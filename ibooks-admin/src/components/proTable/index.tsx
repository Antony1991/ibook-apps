/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-24 10:39:28
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-25 23:41:49
 * @FilePath: /ibook-apps/ibooks-admin/src/components/proTable/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import React, { useCallback, useEffect, useMemo, useState } from 'react'
import { Card, PaginationProps, Table, TableProps } from 'antd'
import type { ProTableProps, RequestData, SearchFunc } from './typing'
import styles from './index.module.less'
import FormRender from './components/FormRender'

// <
// T extends Record<string, any>,
// U extends ParamsType,
// ValueType
// >
const BookProTable = (props: ProTableProps) => {
  const {
    columns,
    request,
    onChange,
    searchFields,
    toolBarRender,
    defaultPageSize = 10,
    pagination,
    manualRequest
    ...rest
  } = props
  const formSearch = {}
  // loading
  const [loading, setloading] = useState(false)
  const [result, setresult] = useState({
    dataSource: [],
    currentValues: {},
  })
  // 分页配置
  const [paginationParam, setpaginationParam] = useState({
    current: 1,
    pageSize: defaultPageSize,
    total: 0,
  })
  useEffect(() => {
    // 是否需要手动触发首次请求
    if(!manualRequest) {
      fetchData(paginationParam.current, result.currentValues, false)
    }
  }, [])
  useEffect(() => {

  }, [])
  

  /** request data */
  const fetchData: any = useCallback(
    async (current: number, values: object, clearPagination: boolean) => {
      setloading(true)
      const response: RequestData<any> = await request({
        current,
        pageSize: paginationParam.pageSize,
        values,
        clearPagination,
      })
      setTimeout(() => {
        setloading(false)
        setpaginationParam((r) => ({ ...r, current, total: response.total }))
        setresult((c) => ({ ...c, dataSource: response.data }))
      }, 2000)
      return Promise.resolve()
    },
    [request, paginationParam.pageSize]
  )
  const onReset: any = useCallback(
    (
      current = paginationParam.current,
      values: object,
      clearPagination: boolean
    ) => {
      fetchData(current, values, clearPagination)
    },
    [fetchData, paginationParam]
  )
  const propsPagination = useMemo((): PaginationProps => {
    if (!pagination) {
      return {
        ...paginationParam,
        showSizeChanger: true,
        pageSizeOptions: ['10', '20', '50', '100'],
        showTotal: (total: number) => `共 ${total} 条`,
      }
    }
    return pagination
  }, [pagination, paginationParam])
  // 分页，排序change
  const handleChange = (pagination: PaginationProps, ...rest) => {
    const pager = { ...paginationParam }
    // onChange
    onChange?.(pagination, ...rest)
    if (
      pager.current !== pagination.current ||
      pager.pageSize !== pagination.pageSize
    ) {
      pager.current = pagination.current as number
      pager.pageSize = pagination.pageSize as number
      setpaginationParam(pager)
    }
  }
  const getTableProps = (): TableProps<any> => ({
    ...rest,
    columns: columns,
    dataSource: result.dataSource,
    pagination: propsPagination,
    loading,
    onChange: handleChange,
  })
  const tableDom = <Table {...getTableProps()} />
  /** 内置的查询工具栏 */
  const searchForm = useMemo(() => {
    if (Array.isArray(searchFields)) {
      return (
        <FormRender
          loading={loading}
          searchFields={searchFields}
          fetch={fetchData}
          reset={onReset}
        />
      )
    }
    if (typeof searchFields === 'function') {
      return (
        <FormRender
          loading={loading}
          searchFields={searchFields()}
          fetch={fetchData}
          reset={onReset}
        />
      )
    }
    return null
  }, [fetchData, loading, onReset, searchFields])
  const renderTable = () => {
    return (
      <Card>
        {searchForm}
        {tableDom}
      </Card>
    )
  }
  return <div className={styles.proTable}>{renderTable()}</div>
}

export default BookProTable
