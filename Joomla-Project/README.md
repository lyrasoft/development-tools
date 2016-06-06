# {專案名稱}

## 注意事項



## 專案初始化流程

### Step 1: 先 fork 一個自己的專案

![p-2016-06-06-002](https://cloud.githubusercontent.com/assets/1639206/15809412/3a984f0c-2bc3-11e6-815f-279e1346a9b7.jpg)

### Step 2: 將 fork 後的專案從 GitHub 上 clone 回來

```bash
$ git clone {Github URL}
```

### Step 3: Checkout to {branch} branch

```bash
$ git checkout {branch}
```

### Step 4: 設定 `configuration.php`

```bash
$ cp configuration.php.dist configuration.php
$ EDITOR configuration.php # Use your own editor to modify it
```

### Step 5: 複製 `htaccess.txt`

```bash
$ cp htaccess.txt .htaccess
```

### Step 6: 匯入資料

匯入新專案預設的資訊

```bash
$ php bin/windwalker sql import default -y
```

建立使用者

```bash
$ php bin/windwalker user create
```

## 後台

使用剛剛建立的 Super User 登入

## 測試機

網址: {Test Server URL}

## Schema Profile 描述

- `default`: 網站安裝的基本資訊
- `extension`: 額外安裝的套件與設定檔

## 元件資訊

### com_xxx

資料表

- #__xxx_items
