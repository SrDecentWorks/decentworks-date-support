# Decentworks::Date::Support - 日付機能拡張ライブラリ

> [!IMPORTANT]
> 本ライブラリは個人によって開発・保守されています。予告なく仕様変更または提供を終了する場合があります。ご利用にあたってはバージョンを固定のうえ、更新時は変更内容をご確認ください。

## 概要

Railsの`Date`、`Time`、`DateTime`、`ActiveSupport::TimeWithZone`に対する機能拡張を行います。

## 拡張方式

`::Date`、`::Time`、`::DateTime`、`::ActiveSupport::TimeWithZone`のクラスを再オープン（reopen）してメソッドを追加します。

`require`した時点でアプリケーション全体に適用されるため、`using`の記述は不要です。

`::Time` / `::DateTime` / `::ActiveSupport::TimeWithZone`の3クラスは共通実装
`Decentworks::DateSupport::TimeExtension`をincludeしており、同じメソッドを同じ仕様で提供します。
各メソッドはレシーバと同じクラスの値を返します（`::Time#beginning_of_january`は`::Time`、
`::DateTime#beginning_of_january`は`::DateTime`）。

`::Date`は日付のみを扱うため、`::Date`のメソッドは`::Date`を返します。

> [!WARNING]
> v0.2.0でrefinementsからクラス再オープンに変更しました。v0.1.1以前から移行する場合は、`using ::Decentworks::DateSupport`と`using ::Decentworks::ActiveSupport::TimeWithZoneSupport`の記述をすべて削除してください。

## 機能

### 週関係

- 週の始まりの曜日（`::Date.beginning_of_week`）に従った日付・期間の取得

`beginning_of_this_week` / `end_of_this_week` / `all_this_week`、および月関係の`all_this_month`は、
ActiveSupportの`beginning_of_week` / `end_of_week` / `all_week` / `all_month`と同じ値を返します。
本ライブラリが追加する`*_this_*`という命名に揃えるために定義しているものであり、機能の追加ではありません。

### 月関係

- Nヶ月前、Nヶ月後の日付の取得メソッドの追加
- 暦月の日付・期間の取得メソッドの追加

### 四半期関係

- 第1四半期〜第4四半期の日付・期間の取得メソッドの追加
- 現在の日付が属する四半期の取得メソッド（`this_quarter_number` / `beginning_of_this_quarter` /
  `end_of_this_quarter` / `all_this_quarter`）の追加

> [!WARNING]
> ActiveSupportにも`quarter` / `beginning_of_quarter` / `end_of_quarter` / `all_quarter`がありますが、
> これらは**暦年基準（1月・4月・7月・10月始まり固定）**であり、本ライブラリの`beginning_of_first_quarter`設定を参照しません。
> 4月始まりに設定していても`::Date.new(2026, 1, 15).all_quarter`は`2026-01-01..2026-03-31`を返します。
> 設定を反映した四半期が必要な場合は、本ライブラリの`all_this_quarter`を使用してください。

### 上下期関係

- 上期〜下期の日付・期間の取得メソッドの追加
- 現在の日付が属する期の取得メソッド（`this_half_number` / `beginning_of_this_half` /
  `end_of_this_half` / `all_this_half`）の追加

### 年度関係

- 年度の取得メソッド（`fiscal_year` / `beginning_of_fiscal_year` / `end_of_fiscal_year` / `all_fiscal_year`）の追加
- 年度は`beginning_of_first_quarter`の設定に従い、期首の年を返します
  （4月始まりの場合、`::Date.new(2026, 3, 31).fiscal_year`は`2025`）

### その他

- 満経過月数の計算
  - 民法第140条（初日不算入）に従い`from`の翌日を起算日とし、民法第143条第2項に従い応当日の前日をもって満了とします（`2026-01-31` → `2026-02-28` は1ヶ月）。
  - 応当日が存在しない月は、同項ただし書に従いその月の末日をもって満了とします（`2026-01-30` → `2026-02-28` は1ヶ月）。
  - `from`が月末日の場合は起算日が月初となるため、満了日も月の末日になります（`2026-02-28` → `2026-03-30` は0ヶ月、`2026-03-31` で1ヶ月）。
  - `to`が`from`より前の場合は`ArgumentError`が発生します。
  - `::Time` / `::DateTime` / `ActiveSupport::TimeWithZone`版は日付単位で判定し、時刻は考慮しません。

## インストール

```ruby
gem 'decentworks-date-support'
```

## 設定

第1四半期（上期）の開始月を指定します。初期値は`:january`（1月始まり）で、**設定を行わなくてもそのまま利用できます**。

```ruby
::Decentworks::DateSupport.configure do |config|
  config.beginning_of_first_quarter = :april # 4月始まり
end
```

指定可能な値は`:january`〜`:december`です。それ以外を指定した場合は`ArgumentError`が発生します。

### 初期化ファイルの生成（Rails）

Railsから利用する場合は、以下のジェネレータで`config/initializers/decentworks_date_support.rb`を生成できます。

```shell
bin/rails generate decentworks:date_support:install
```

- 1月始まりのまま利用する場合、この初期化ファイルは不要です。
- その他の月に変更したい場合は、ファイルの内容を修正してください。

## 使い方の例

```ruby
require 'decentworks/date_support'

d = ::Date.new(2026, 8, 5)
d.all_this_week # => Mon, 03 Aug 2026..Sun, 09 Aug 2026
```

```ruby
require 'decentworks/date_support'

d = ::Time.zone.local(2026, 8, 5)
d.all_this_week # => 2026-08-03 00:00:00.000000000 JST +09:00..2026-08-09 23:59:59.999999999 JST +09:00
```

```ruby
require 'decentworks/date_support'

::Decentworks::DateSupport.configure do |config|
  config.beginning_of_first_quarter = :april
end

d = ::Date.new(2026, 1, 15)
d.fiscal_year          # => 2025
d.this_quarter_number  # => 4
d.all_this_quarter     # => Thu, 01 Jan 2026..Tue, 31 Mar 2026
d.this_half_number     # => 2
d.all_this_half        # => Wed, 01 Oct 2025..Tue, 31 Mar 2026
d.all_fiscal_year      # => Tue, 01 Apr 2025..Tue, 31 Mar 2026
```
