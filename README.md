# LYRASOFT Development Tools

## 工作平台入口

- Google Doc https://drive.google.com/drive/folders/0B0Nkd9Vr2d3eMjNxTWlDY1N0OFk
- Slack https://lyrasoft.slack.com/messages/general/
- Trello https://trello.com/megamount
- Mega https://mega.nz/#fm/VVNgiRpA
- Lyra Document http://docs.lyrasoft.net/

## CodeSniffer

The PHP_CodeSniffer Package for LYRASOFT Developer Team.

### Installation

[PhpStorm Installation](doc/PhpStormSetup.markdown)

## PHPUnit

### Guide

Not yet...

## PHPStorm

### File Template

特別編寫過的 Comment 模板幫助快速產生符合標準的區塊註解(請搭配 Code Style 使用)

![](http://cl.ly/T4w8/p-2013-12-23-2.jpg)

下載後匯入 setting (只包含 File Template 而已，其他不會覆蓋): [File-Templates.jar](Editor/PHPStorm/File-Templates.jar)

# get-pr

## Getting Started

Download this file.

``` bash
$ wget https://gist.githubusercontent.com/asika32764/5824bc66a6756dc3031e/raw/92f072b3c1737553bf08be2fa9695c094e607ae6/get-pr
```

Then `mv` to `/usr/local/bin` (Windows should put in a folder which in Environment Variable Path, I'm used to put in `C:\bin`)

``` bash
$ chmod +x get-pr
$ mv get-pr /usr/local/bin/get-pr
```

cd to your git project

Then execute：

``` bash
$ get-pr upstream 123
$ checkout pr-123
```

OK we will pull and checkout to this PR.

## Usage:

``` bash
$ get-pr {remote-name} {PR-ID}
```

It is convenience to review PR or contribute to others PR.

## Image

![img](https://cloud.githubusercontent.com/assets/1639206/4159871/ee88022a-34ab-11e4-8e86-43db332579ed.png)
