# Bamahome iCRM 系統

## 注意事項



## 專案初始化流程

### Step 1: 先將專案從 GitHub 上 clone 回來

```bash
$ git clone {Github URL}
```

### Step 2: Checkout to staging branch

```bash
$ git checkout staging
```

### Step 3: 設定 `configuration.php`

```bash
$ cp configuration.php.dist configuration.php
$ EDITOR configuration.php
```

### Step 4: 複製 `htaccess.txt`

```bash
$ cp htaccess.txt .htaccess
```

### Step 5: 匯入資料

匯入新專案預設的資訊

```bash
$ php cli/console sql import default -y
```

## 後台

使用預設帳戶登入，帳密: **smstw / 高強度基隆**

## 測試機

網址: {Test Server URL}

## 元件資訊

### com_xxx

資料表

- #__xxx_items
