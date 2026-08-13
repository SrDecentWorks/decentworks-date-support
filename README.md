# Decentworks::Date::Support - 日付機能拡張ライブラリ

> [!IMPORTANT]
> 本ライブラリは個人によって開発・保守されています。予告なく仕様変更または提供を終了する場合があります。ご利用にあたってはバージョンを固定のうえ、更新時は変更内容をご確認ください。

## 概要

Railsの`Date`、`ActiveSupport::TimeWithZone`に対する機能拡張を行います。

## refinements

gemによる影響範囲を限定するため、refinementsを採用しています。  
利用する場合は、適切なスコープで`using`を利用してください。

## 機能

### Dateクラス拡張

#### using

```ruby
using ::Decentworks::DateSupport
```

### ActiveSupport::TimeWithZoneクラス拡張

#### using

```ruby
using ::Decentworks::ActiveSupport::TimeWithZoneSupport
```


### 週関係

- 週の始まりの曜日を指定しての日付・期間の取得

### 月関係

- Nヶ月前、Nヶ月後の日付の取得メソッドの追加
- 暦月の日付・期間の取得メソッドの追加

### 四半期関係

- 第1四半期〜第4四半期の日付・期間の取得メソッドの追加

### 上下期関係

- 上期〜下期の日付・期間の取得メソッドの追加

### その他

- 満経過月数の計算

## インストール

```ruby
gem 'decentworks-date-support'
```

### 初期化ファイルの生成（Rails）

Railsから利用する場合は、以下のジェネレータで`config/initializers/decentworks_date_support.rb`を生成できます。

```shell
bin/rails generate decentworks:date_support:install
```

- 初期値は1月始まりです。
- その他の月に変更したい場合は、ファイルの内容を修正してください。

## 使い方の例

```ruby
require 'decentworks/date_support'

using ::Decentworks::DateSupport

d = ::Date.new(2026, 8, 5)
d.all_this_week # => Mon, 03 Aug 2026..Sun, 09 Aug 2026
```

```ruby
require 'decentworks/date_support'

using ::Decentworks::ActiveSupport::TimeWithZoneSupport

d = ::Time.zone.local(2026, 8, 5)
d.all_this_week # => 2026-08-03 00:00:00.000000000 JST +09:00..2026-08-09 23:59:59.999999999 JST +09:00
```
