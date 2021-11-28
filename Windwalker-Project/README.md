# {專案名稱}

## 規格文件



## 專案初始化流程

### Step 1: 先 fork 一個自己的專案

![p-2016-06-06-002](https://cloud.githubusercontent.com/assets/1639206/15809412/3a984f0c-2bc3-11e6-815f-279e1346a9b7.jpg)

### Step 2: 將 fork 後的專案從 GitHub 上 clone 回來

```bash
git clone {Github URL}
```

### Step 3: Checkout to {branch} branch

```bash
git checkout {branch}
```

### Step 4: 安裝套件

安裝套件

``` bash
composer install
```

### Step 4: 設定 `.env` 與初始化

Run

```bash
composer run env
```

初始化系統設定 (會同時跑 yarn install 與 migration)

``` bash
php windwalker run preparedev
```

> **注意** 不要使用 `composer update`

### Step 6: 匯入資料

建立資料表與測試資料 (Step 5 跑 `preparedev` 時會自動執行)

```bash
php windwalker mig:reset -fs
```

> 若不需要測試資料，可以省略 `-s`

接下來打開 `http://{your_project}/www/dev.php` 即可

或執行 `php windwalker server:start`

### Step 7: 編譯 CSS, JS

```bash
yarn build
```

前面跑 preparedev 時也會提前編譯好

## 後台

使用 UserInit Migration 內建立的帳號登入

## 佈景

- 後台佈景參考檔案在 theme/{admin_theme} 內。
- 前台佈景參考檔案在 theme/{front_theme} 內。

## CSS JS 編寫

加入要增加的 scss js 檔案在 `fusionfile.js` 內，參考 [Windwalker Fusion](https://github.com/windwalker-io/core/tree/master/assets/fusion#readme)

執行 `yarn build` 或 `yarn watch` 來編譯 assets

或是另寫特殊 task 來用 `yarn build {task1} {task2}`

## 測試機

網址: {Test Server URL}
