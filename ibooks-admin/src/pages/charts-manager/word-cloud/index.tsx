/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-01 17:52:00
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-01 20:22:51
 * @FilePath: /ibook-apps/ibooks-admin/src/pages/charts-manager/word-cloud/index.tsx
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import React from 'react'
import { WordCloud, WordCloudConfig } from '@ant-design/plots'
import { useWordCloudsQuery } from '@/services/charts/chartsApi'
import { Alert, Card, Spin } from 'antd'
const WordCloudPage = () => {
  const { data, isLoading } = useWordCloudsQuery({})
  const config: WordCloudConfig = {
    data,
    wordField: 'name',
    weightField: 'value',
    colorField: 'name',
    wordStyle: {
      fontFamily: 'Verdana',
      fontSize: [12, 36],
      rotation: 0,
    },
    random: () => 0.5,
  }
  return (
    <div>
      <Card>
        <Alert message={'词云图'} />
      </Card>
      {isLoading ? <Spin /> : <WordCloud {...config} />}
    </div>
  )
}

export default WordCloudPage
