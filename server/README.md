#### Sequelize 工具

#### 初始化 sequelize init
创建 `.sequelizerc` 文件，设置生成文件目录
```rc
'use strict';

const path = require('path');

module.exports = {
  config: path.join(__dirname, 'database/config.json'),
  'migrations-path': path.join(__dirname, 'database/migrations'),
  'seeders-path': path.join(__dirname, 'database/seeders'),
  'models-path': path.join(__dirname, 'app/model'),
};

```
初始化 sequelize模型
```sh
 npx sequelize-cli init
```

#### 创建migration

```sh
npx sequelize migration:generate --name=users
```

#### 通过命令映射数据库表到 数据库
```sh
npx sequelize db:migrate

npx sequelize-cli db:migrate:undo
```
