# Decentworks::Date::Support - 日付機能拡張ライブラリ

## 概要

Railsの`Date`、`ActiveSupport::TimeWithZone`に対する機能拡張を行います。

## 機能

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

## 使い方の例

```ruby
require 'decentworks_date_support'

using ::Decentworks::DateSupport

d = ::Date.new(2026, 8, 5)
d.all_this_week(:sunday) # => ::Date.new(2026, 8, 2)..::Date.new(2026, 8, 8)
```

```ruby
require 'decentworks_date_support'

using ::Decentworks::ActiveSupport::TimeWithZoneSupport

d = ::Time.zone.local(2026, 8, 5)
d.all_this_week(:sunday) # => ::Date.new(2026, 8, 2).beginning_of_day..::Date.new(2026, 8, 8).end_of_day
```
