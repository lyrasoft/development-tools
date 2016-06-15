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

### Step 4: 設定 `secret.yml`

```bash
cp etc/secret.dist.yml etc/secret.yml
EDITOR etc/secret.yml # Use your own editor to modify it
```

接著填入 database 資訊

### Step 5: 安裝套件

``` bash
composer install
```

> **注意** 不要使用 `composer update`

### Step 6: 匯入資料

建立資料表與測試資料

```bash
$ php windwalker migration migrate --seed
```

> 若不需要測資，可以省略 `--seed`

接下來打開 `http://{your_project}/www/dev.php` 即可

## 後台

使用 UserSeeder 內建立的帳號登入

## 佈景

- 後台佈景參考檔案在 theme/{admin_theme} 內。
- 前台佈景參考檔案在 theme/{front_theme} 內。

## LESS 編寫

建立或編輯 `less` 檔案，請使用 PhpStorm 的 [File Watcher](https://goo.gl/VwgGZb) 自動把 LESS 編成 CSS 檔案

> 只要有 `.less` 存在的檔案，請勿直接編輯 `.css` 檔

## Asset 壓縮

可以用

``` bash
php windwalker phoenix asset minify --dir={folder}
```

來壓縮整個 www/media/{folder} 底下的所有 CSS & JS

或安裝 PhpStorm 的 [Compression Plugin](https://plugins.jetbrains.com/plugin/6740)

## SMTP 測試帳號

Mailtrap: https://mailtrap.io

- Host: `mailtrap.io`
- Username: `**********`
- Password: `**********`
- Security: `tls`
- Post: `2525`

帳密請自行上 doc 查詢

## 測試機

網址: {Test Server URL}
