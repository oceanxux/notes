# dujiaokabot
独角发卡TG机器人商店

## 写在前面

- 基于**独角数卡**的机器人，如果你没有搭建这玩意儿。可以先去  <b><a href="https://github.com/assimon/dujiaoka">看看</a></b>
- 机器人. 与基本的 **epusdt** 支付对接，内置 **易支付** 接口，可根据需求填写。
- 本程序仅供学习交流使用，不得用于商业用途，如产生法律纠纷与本人无关。

## 搭建环境

- Java (1.8 或者 17)环境
- 提前配置好`config.properties`文件里面数据库（注意是填独角的数据库）
- 进人独角数据库插入`bot.sql`文件，[点击下载文件](https://github.com/admin8800/dujiaokabot/releases/download/bot618/bot.sql)

## 目前功能
- [x] 机器人自定义内网穿透
- [x] 自动检测SQL是否安装
- [x] 余额查询
- [x] 历史订单查询
- [x] 商品展示，购买
- [x] epusdt 支付对接
- [x] 易支付对接
- [x] 客服功能
- [x] 根据下单数量，判断发送格式（纯文本，xlsx, txt）


---

- [文档](https://github.com/liy-admin/dujiaoka-tgBot/wiki/%E5%AE%9D%E5%A1%94-%E2%80%90-%E6%90%AD%E5%BB%BA%E6%95%99%E7%A8%8B)
