## Getting Started

下載此檔案

``` bash
$ wget https://gist.githubusercontent.com/asika32764/5824bc66a6756dc3031e/raw/92f072b3c1737553bf08be2fa9695c094e607ae6/get-pr
```

接著 mv 至 `/usr/local/bin` (Windows 要自行放在環境變數支援的目錄，我習慣放在 `C:\bin`)

``` bash
$ chmod +x get-pr
$ mv get-pr /usr/local/bin/get-pr
```

cd 至 git 專案目錄

接著執行：

``` bash
$ get-pr upstream 123
$ checkout pr-123
```

就能拉下並 checkout 至指定 PR

## 用 Git Alias

```
git config --global alias.get-pr '!f() { git fetch $1 refs/pull/$2/head:pr-$2; }; f'
```

這樣也能夠全域使用此指令

## Usage:

``` bash
$ get-pr {remote-name} {PR-ID}
```

無論要 review 還是替另一個人寫 PR 都很方便

## 圖例

![img](https://cloud.githubusercontent.com/assets/1639206/4159871/ee88022a-34ab-11e4-8e86-43db332579ed.png)
