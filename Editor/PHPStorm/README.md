# PHPStorm 設定檔說明

## 匯入方式

請打開 PHPStorm 並點選 File -> Import Settings ，選擇對應的 jar 匯入即可。

## 內容說明

### CodeStyle.jar

含有我們的完整 Coding Style 設定，會與 [lyra/coding-standards](https://github.com/lyrasoft/coding-standards) 內的規範同步。

### Live-Templates.jar

含有適合我們開發工作的快速 Code Snippets

#### 我們的自訂 Snippets

- JS
    - `col` -> `console.log()`
- PHP
    - `sh` -> `show()`
    - `st` -> `static`
- HTML
    - `bif` -> `@if ()`
    - `bfore` -> `@foreach ()`
    - `belse` -> `@else`
    - `belseif` -> `@elseif ()`
    - `bfel` -> `@forelse ()`

#### 2016-5 更新

- JS & PHP 增加 `func` 來快速產生 `function () {}`
- PHP 增加 `funcu` 產生 `function () use () {}`
- PHP 增加 `e` -> `exit(' @Checkpoint')`

### File-Templates.jar

包含建立新檔案時的預設模板，還有各種 class, getter and setter 的自動產生與註解模板等等
