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
cd .vaseman
yarn install
composer install
```

### Step 5: 編譯

``` bash
yarn build
```

## CSS JS 編寫

加入要增加的 scss js 檔案在 `fusionfile.js` 內，參考 [Windwalker Fusion](https://github.com/windwalker-io/core/tree/master/assets/fusion#readme)

執行 `yarn build` 或 `yarn watch` 來編譯 assets

或是另寫特殊 task 來用 `yarn build {task1} {task2}`

## 測試機

網址: {Test Server URL}
