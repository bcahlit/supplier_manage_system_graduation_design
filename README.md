# pg配置
## 数据库
首先安装pg并使用pgadmin将db文件夹下的backup.backup文件导入到数据库
在config/database.yml里配置数据库的用户名与密码
## 后台
安装ruby运行环境，我是安装rvm与ruby2.7.0 可以在gemfile 文件里修改ruby版本
然后build 安装依赖
然后rails s 运行后端服务
## 前台
安装 node.js
cd 到frontend目录，然后使用cnpm install安装前端依赖的组件
然后 npm start启动前端服务 可以打开数据库

# 使用sqliter3的配置
## 数据库
使用git将项目恢复到使用pg之前的状态。
## 后台
安装ruby运行环境，我是安装rvm与ruby2.7.0 可以在gemfile 文件里修改ruby版本
然后build 安装依赖
然后rails s 运行后端服务
## 前台
安装 node.js
cd 到frontend目录，然后使用cnpm install安装前端依赖的组件
然后 npm start启动前端服务 可以打开数据库