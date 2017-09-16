## Daybook 記帳本

一個簡單的網站，基於記錄日常的收入與支出，並產生圖表用來了解花費分配、每月花費，以對支出做更好的管理。

## 功能
  - 記帳本 - 基本增刪改查，及細部的篩選功能
  - 記帳類別 - 基本增篩改查
  - 資料圖表 - 包含圓餅圖、長條圖、年支出曲線圖

## 畫面
![](https://imgur.com/iRMoHtz.png)
![](https://imgur.com/KTn0AKQ.png)
![](https://imgur.com/5elD6QR.png)
![](https://imgur.com/ZUUNTBR.png)

## 安裝
1. 安裝Mysql資料庫、Grails
2. 於application.yml修改資料庫設定

修改username, password：

```
dataSource:
    pooled: true
    jmxExport: true
    driverClassName: com.mysql.jdbc.Driver
    dialect: org.hibernate.dialect.MySQL5InnoDBDialect
    username: root    # here
    password: 123456  # here
```

修改連線資訊，確認url指向正確的位置：

```
environments:
    development:
        dataSource:
            logSql: true
            dbCreate: none  # here
            url: jdbc:mysql://localhost:3306/daybook?useUnicode=true&characterEncoding=UTF-8  # here
```

PS. 第一次建立資料庫，需將dbCreate的`none`改為`create`，建畢後需改回`none`。

3. 建立測試資料 (選擇性)
於daybook/grails-app/init/daybook/BootStrap.groovy，將

```
        def createDefaultData = false
```

改為`true`。

4. 至專案目錄底下，執行

```
grails run-app
```

## 使用套件
| 名稱 | 連結 |
| ------ | ------ |
| Grails  3.2.9 | http://docs.grails.org/3.2.9/guide/single.html |
| Mysql 5.7 | https://dev.mysql.com/doc/relnotes/mysql/5.7/en |
| Materialize | http://materializecss.com/ |
| Chart.js | http://www.chartjs.org/ |