/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-24 10:39:28
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-03 18:53:57
 * @FilePath: /ibook-apps/ibooks-admin/src/components/proTable/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import React, {
  useCallback,
  useEffect,
  useMemo,
  useState,
  forwardRef,
  useImperativeHandle,
} from 'react'
import { Card, PaginationProps, Space, Table, TableProps } from 'antd'
import type {
  ProTableProps,
  RequestData,
  RowAction,
  SearchFunc,
} from './typing'
import styles from './index.module.less'
import FormRender from './components/FormRender'
import {
  FilterValue,
  SorterResult,
  TableCurrentDataSource,
} from 'antd/es/table/interface'
import { ColumnProps } from 'antd/es/table'

// <
// T extends Record<string, any>,
// U extends ParamsType,
// ValueType
// >
const BookProTable = forwardRef((props: ProTableProps, ref) => {
  const {
    columns,
    request,
    onChange,
    searchFields,
    toolBarRender,
    defaultPageSize = 10,
    pagination,
    manualRequest,
    size = 'small',
    rowActions,
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
    if (!manualRequest) {
      fetchData(paginationParam.current, result.currentValues, false)
    }
  }, [])

  /** request data */
  const fetchData: any = useCallback(
    async (current: number, values: object, clearPagination: boolean) => {
      console.log('-----------first')
      setloading(true)
      const response: RequestData<any> = await request({
        current,
        pageSize: paginationParam.pageSize,
        values,
        clearPagination,
      })
      setloading(false)
      setpaginationParam((r) => ({ ...r, current, total: response.total }))
      setresult((c) => ({ ...c, dataSource: response.data }))
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
  const handleChange = (
    pagination: PaginationProps,
    filters: Record<string, FilterValue | null>,
    sorter: SorterResult<any> | SorterResult<any>[],
    extra: TableCurrentDataSource<any>
  ) => {
    const pager = { ...paginationParam }
    // onChange
    onChange?.(pagination, filters, sorter, extra)
    if (
      pager.current !== pagination.current ||
      pager.pageSize !== pagination.pageSize
    ) {
      pager.current = pagination.current as number
      pager.pageSize = pagination.pageSize as number
      // setpaginationParam(pager)
      fetchData(pager.current, result.currentValues, false)
    }
  }
  // 渲染操作列
  const actionColumn = useMemo((): ColumnProps<any> | null => {
    // 判断操作列是否有内容
    if (rowActions && rowActions.length) {
      return {
        key: 'actions',
        title: '操作',
        dataIndex: '_actions',
        render: (_, record) => {
          // 过滤掉操作列中不显示的操作
          const showActions: RowAction[] = renderActionsController(
            rowActions,
            record
          )
          // 渲染操作列的内容，对于禁用的禁用
          const showActionsTemp = showActions.map((item: RowAction, i) => {
            const label =
              typeof item.label === 'function'
                ? item.label?.(record)
                : item.label
            const disabled = item.isDisabled && item.isDisabled(record)
            const onClick = () => {
              if (disabled) {
                return false
              }
              if (item.action) {
                item.action(record)
              }
            }
            return (
              <a
                key={i}
                style={
                  disabled
                    ? {
                        color: 'rgba(0, 0, 0, .25)',
                        cursor: 'default',
                      }
                    : {}
                }
                onClick={onClick}
              >
                {label}
              </a>
            )
          })
          return <Space>{showActionsTemp}</Space>
        },
      }
    }
    return null
  }, [rowActions])
  const initColumns = useMemo(() => {
    // 将所有列都设置align为center
    const proColumns = actionColumn
      ? [...(columns ?? []), actionColumn]
      : columns
    return (
      proColumns?.map((item) => ({
        ...item,
        align: item.align ?? 'center',
      })) ?? []
    )
  }, [actionColumn, columns])
  const renderActionsController = (actions: RowAction[], record: any) => {
    return actions.filter((action) => {
      // 默认不设置为true
      if (!action.renderController) {
        return true
      }
      return action.renderController(record)
    })
  }

  // 表格的基础配置
  const getTableProps = (): TableProps<any> => ({
    ...rest,
    size,
    columns: initColumns,
    dataSource: result.dataSource,
    pagination: propsPagination,
    loading,
    onChange: handleChange,
  })
  const tableDom = <Table {...getTableProps()} />
  /** 内置的查询工具栏 */
  const searchForm = () => {
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
  }
  const toolBar = useMemo(() => {
    if (toolBarRender && typeof toolBarRender === 'function') {
      return <div className={styles.toolBar}>{toolBarRender()}</div>
    }
    return null
  }, [toolBarRender])
  const renderTable = () => {
    return (
      <>
        {searchForm()}
        <Card>
          {toolBar}
          {tableDom}
        </Card>
      </>
    )
  }
  useImperativeHandle(
    ref,
    () => ({
      fetch: fetchData,
      reset: onReset,
    }),
    [fetchData, onReset]
  )
  return <div className={styles.proTable}>{renderTable()}</div>
})

export default BookProTable
