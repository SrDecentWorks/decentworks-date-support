# Decentworks::DateSupport - 日付機能拡張ライブラリ

> [!IMPORTANT]
> 本ライブラリは個人によって開発・保守されています。予告なく仕様変更または提供を終了する場合があります。ご利用にあたってはバージョンを固定のうえ、更新時は変更内容をご確認ください。

## 概要

`::Date` / `::Time` / `::DateTime` / `::ActiveSupport::TimeWithZone` に対して、四半期・上下期・年度・暦月などの日付操作メソッドを追加するRuby gemです。

第1四半期の開始月を設定できるため、1月始まり以外の会計年度（4月始まりなど）にも対応します。

## 特徴

- 四半期・上下期・年度の期首/期末/期間を取得（開始月は設定で変更可能）
- 次の四半期・前の年度など、隣接する期間の取得
- 暦月（1月〜12月）の月初/月末/期間の取得と判定
- Nヶ月前・Nヶ月後の取得メソッド
- ActiveSupportの四半期メソッド（`quarter` / `beginning_of_quarter` など）を設定を反映した値に上書き
- 民法（初日不算入・応当日前日満了）に従った満経過月数の計算
- `using` 不要（`require` した時点でアプリケーション全体に適用）
- RBS型定義同梱

## 要件

- Ruby >= 4.0.0
- ActiveSupport ~> 8.1

## インストール

Gemfileに追加します。

```ruby
gem 'decentworks-date-support'
```

```shell
bundle install
```

## 拡張方式

`::Date` / `::Time` / `::DateTime` / `::ActiveSupport::TimeWithZone` の各クラスを再オープン（reopen）し、拡張モジュールをincludeしてメソッドを追加します。`require` した時点でアプリケーション全体に適用されるため、`using` の記述は不要です。

| 対象クラス | 拡張モジュール |
| --- | --- |
| `::Date` | `Decentworks::DateSupport::DateExtension` |
| `::Time` / `::DateTime` / `::ActiveSupport::TimeWithZone` | `Decentworks::DateSupport::TimeExtension` |

`TimeExtension` をincludeする3クラスは、同じメソッドを同じ仕様で提供します。各メソッドはレシーバと同じクラスの値を返します（`::Time#beginning_of_january` は `::Time`、`::DateTime#beginning_of_january` は `::DateTime`）。

`::Date` は日付のみを扱うため、`::Date` のメソッドは `::Date` を返します。

### 判定メソッド（`?` 付き）の`::Date`と日時クラスの違い

`beginning_of_january?` / `end_of_january?` のような**期首・期末の判定メソッド**は、`::Date` と日時クラスで判定の粒度が異なります。

| レシーバ | 判定内容 | `2026-01-01 12:34:56` の場合 |
| --- | --- | --- |
| `::Date` | その日付ちょうどか（`self == beginning_of_january`） | ― |
| `::Time` / `::DateTime` / `::ActiveSupport::TimeWithZone` | その日のうちか（時刻は問わない） | `true` |

日時クラスで「`2026-01-01 00:00:00` ちょうどか」を判定したい場合は、`beginning_of_january == self` のように値そのものを比較してください。

期間の判定メソッド（`in_january?` / `in_first_quarter?` など）は、どのクラスでも期間に含まれるかを判定するため差はありません。

> [!WARNING]
> v0.2.0でrefinementsからクラス再オープンに変更しました。v0.1.1以前から移行する場合は、`using ::Decentworks::DateSupport` と `using ::Decentworks::ActiveSupport::TimeWithZoneSupport` の記述をすべて削除してください。

## 設定

第1四半期（上期）の開始月を指定します。初期値は `:january`（1月始まり）で、**設定を行わなくてもそのまま利用できます**。

```ruby
::Decentworks::DateSupport.configure do |config|
  config.first_quarter_month_name = :april # 4月始まり
end
```

指定可能な値は `:january` 〜 `:december` です。それ以外を指定した場合は `ArgumentError` が発生します。

> [!WARNING]
> 設定メソッド名を `beginning_of_first_quarter` から `first_quarter_month_name` に変更しました。`::Date#beginning_of_first_quarter`（第1四半期の期首の**日付**）と同名でありながら戻り値が月名のシンボルで、混同を招いていたためです。旧名は残していないため、初期化ファイルの記述を修正してください。

| 設定値 | 第1四半期 | 第2四半期 | 第3四半期 | 第4四半期 | 上期 | 下期 |
| --- | --- | --- | --- | --- | --- | --- |
| `:january` | 1〜3月 | 4〜6月 | 7〜9月 | 10〜12月 | 1〜6月 | 7〜12月 |
| `:april` | 4〜6月 | 7〜9月 | 10〜12月 | 翌1〜3月 | 4〜9月 | 10〜翌3月 |
| `:july` | 7〜9月 | 10〜12月 | 翌1〜3月 | 翌4〜6月 | 7〜12月 | 翌1〜6月 |
| `:october` | 10〜12月 | 翌1〜3月 | 翌4〜6月 | 翌7〜9月 | 10〜翌3月 | 翌4〜9月 |

その他の設定用APIは以下のとおりです。

```ruby
::Decentworks::DateSupport.first_quarter_month_name   # => :april
::Decentworks::DateSupport.first_quarter_month        # => 4
::Decentworks::DateSupport.first_quarter_month_offset # => 3
::Decentworks::DateSupport.reset_configuration!       # 設定を初期値に戻す
```

### 初期化ファイルの生成（Rails）

Railsから利用する場合は、以下のジェネレータで `config/initializers/decentworks_date_support.rb` を生成できます。

```shell
bin/rails generate decentworks:date_support:install
```

- 1月始まりのまま利用する場合、この初期化ファイルは不要です。
- その他の月に変更したい場合は、ファイルの内容を修正してください。

## 使い方

```ruby
require 'decentworks/date_support'

d = ::Date.new(2026, 8, 5)
d.all_this_week # => Mon, 03 Aug 2026..Sun, 09 Aug 2026
```

```ruby
require 'decentworks/date_support'

t = ::Time.zone.local(2026, 8, 5)
t.all_this_week # => 2026-08-03 00:00:00.000000000 JST +09:00..2026-08-09 23:59:59.999999999 JST +09:00
```

```ruby
require 'decentworks/date_support'

::Decentworks::DateSupport.configure do |config|
  config.first_quarter_month_name = :april
end

d = ::Date.new(2026, 1, 15)
d.fiscal_year          # => 2025
d.this_quarter_number  # => 4
d.all_this_quarter     # => Thu, 01 Jan 2026..Tue, 31 Mar 2026
d.this_half_number     # => 2
d.all_this_half        # => Wed, 01 Oct 2025..Tue, 31 Mar 2026
d.all_fiscal_year      # => Tue, 01 Apr 2025..Tue, 31 Mar 2026
```

## メソッド一覧

以下のメソッドは `::Date` / `::Time` / `::DateTime` / `::ActiveSupport::TimeWithZone` の全クラスで利用できます。

### 週関係

| メソッド | 内容 |
| --- | --- |
| `beginning_of_this_week` | 週の始まりの日付 |
| `end_of_this_week` | 週の終わりの日付 |
| `all_this_week` | 今週の期間 |

週の始まりは `::Date.beginning_of_week` の設定に従います。

### 月関係

| メソッド | 内容 |
| --- | --- |
| `beginning_of_this_month` / `end_of_this_month` / `all_this_month` | 現在の日付が属する月の月初 / 月末 / 期間 |
| `two_months_ago` 〜 `eleven_months_ago` | Nヶ月前の日付（2〜11） |
| `two_months_since` 〜 `eleven_months_since` | Nヶ月後の日付（2〜11） |
| `half_year_ago` / `half_year_since` | 半年前 / 半年後の日付（`six_months_ago` / `six_months_since` の別名） |

1ヶ月前・1ヶ月後は定義していません。ActiveSupportの `prev_month` / `next_month` のほうが名前として分かりやすいため、そちらを使ってください。

暦月については、1月〜12月それぞれに以下のメソッドがあります（例は1月）。

| メソッド | 内容 |
| --- | --- |
| `beginning_of_january` | 1月の月初 |
| `end_of_january` | 1月の月末 |
| `all_january` | 1月の期間 |
| `beginning_of_january?` | 1月の月初か？ |
| `end_of_january?` | 1月の月末か？ |
| `in_january?` | 1月か？ |

### 四半期関係

| メソッド | 内容 |
| --- | --- |
| `this_quarter_number` | 現在の日付が属する四半期の番号（1〜4） |
| `beginning_of_this_quarter` / `end_of_this_quarter` / `all_this_quarter` | 現在の日付が属する四半期の期首 / 期末 / 期間 |
| `beginning_of_next_quarter` / `end_of_next_quarter` / `all_next_quarter` | 次の四半期の期首 / 期末 / 期間 |
| `beginning_of_prev_quarter` / `end_of_prev_quarter` / `all_prev_quarter` | 前の四半期の期首 / 期末 / 期間 |

第1〜第4四半期それぞれに以下のメソッドがあります（例は第1四半期）。

| メソッド | 内容 |
| --- | --- |
| `beginning_of_first_quarter` | 第1四半期の期首 |
| `end_of_first_quarter` | 第1四半期の期末 |
| `all_first_quarter` | 第1四半期の期間 |
| `beginning_of_first_quarter?` | 第1四半期の期首か？ |
| `end_of_first_quarter?` | 第1四半期の期末か？ |
| `in_first_quarter?` | 第1四半期か？ |

`first` を `second` / `third` / `fourth` に置き換えたメソッドが同様に定義されています。

#### ActiveSupportの四半期メソッドの上書き

ActiveSupportの四半期メソッドは**暦年基準（1月・4月・7月・10月始まり固定）**で、`first_quarter_month_name` の設定を参照しません。
本ライブラリはこれらを設定を反映した値を返すよう上書きします。

| メソッド | 上書き後の内容 |
| --- | --- |
| `quarter` | `this_quarter_number` と同じ |
| `beginning_of_quarter` / `at_beginning_of_quarter` | `beginning_of_this_quarter` と同じ |
| `end_of_quarter` / `at_end_of_quarter` | `end_of_this_quarter` と同じ |
| `all_quarter` | `all_this_quarter` と同じ |
| `next_quarter` | `beginning_of_next_quarter` と同じ |
| `prev_quarter` / `last_quarter` | `beginning_of_prev_quarter` と同じ |

`next_quarter` / `prev_quarter` / `last_quarter` は、ActiveSupportでは3ヶ月後・3ヶ月前の**同日**を返しますが、
本ライブラリでは期間ベースに揃えて**期首**を返します。

> [!WARNING]
> `at_beginning_of_quarter` / `at_end_of_quarter` / `last_quarter` はActiveSupportが `alias` で定義しているため、
> 本体を上書きしただけでは追従しません。値が食い違わないよう本ライブラリ側でメソッド定義として上書きしています。
>
> 暦年基準の四半期が必要な場合は、上書きの影響を受けない `beginning_of_year` からの算出など別の手段を使ってください。

### 上下期関係

| メソッド | 内容 |
| --- | --- |
| `this_half_number` | 現在の日付が属する期の番号（1〜2） |
| `beginning_of_this_half` / `end_of_this_half` / `all_this_half` | 現在の日付が属する期の期首 / 期末 / 期間 |
| `beginning_of_next_half` / `end_of_next_half` / `all_next_half` | 次の期の期首 / 期末 / 期間 |
| `beginning_of_prev_half` / `end_of_prev_half` / `all_prev_half` | 前の期の期首 / 期末 / 期間 |
| `beginning_of_first_half` / `end_of_first_half` / `all_first_half` | 上期の期首 / 期末 / 期間 |
| `beginning_of_first_half?` / `end_of_first_half?` / `in_first_half?` | 上期の期首か？ / 期末か？ / 上期か？ |
| `beginning_of_second_half` / `end_of_second_half` / `all_second_half` | 下期の期首 / 期末 / 期間 |
| `beginning_of_second_half?` / `end_of_second_half?` / `in_second_half?` | 下期の期首か？ / 期末か？ / 下期か？ |

### 年度関係

| メソッド | 内容 |
| --- | --- |
| `fiscal_year` | 現在の日付が属する年度（期首の年） |
| `beginning_of_fiscal_year` / `end_of_fiscal_year` / `all_fiscal_year` | 年度の期首 / 期末 / 期間 |
| `next_fiscal_year` / `prev_fiscal_year` | 次の年度 / 前の年度（期首の年） |
| `beginning_of_next_fiscal_year` / `end_of_next_fiscal_year` / `all_next_fiscal_year` | 次の年度の期首 / 期末 / 期間 |
| `beginning_of_prev_fiscal_year` / `end_of_prev_fiscal_year` / `all_prev_fiscal_year` | 前の年度の期首 / 期末 / 期間 |

年度は `first_quarter_month_name` の設定に従い、期首の年を返します（4月始まりの場合、`::Date.new(2026, 3, 31).fiscal_year` は `2025`）。

> [!NOTE]
> 四半期・上下期には `this_quarter_number` / `beginning_of_this_quarter` のように `this_` が付きますが、年度には付きません。
> `this_` は「第1四半期」「上期」といった**絶対的な期間を指すメソッドと区別するため**に付けているものです。
> 年度には `first_fiscal_year` のような絶対版が存在せず、`fiscal_year` / `beginning_of_fiscal_year` は常にレシーバが属する年度を指すため、区別する必要がありません。
> ActiveSupportの `beginning_of_year` / `end_of_year` / `all_year` も同じ理由で `this_` を付けていません。

### 満経過月数

各クラスのクラスメソッドとして定義されています。

```ruby
::Date.whole_months_elapsed(from: ::Date.new(2026, 1, 31), to: ::Date.new(2026, 2, 27)) # => 0
::Date.whole_months_elapsed(from: ::Date.new(2026, 1, 31), to: ::Date.new(2026, 2, 28)) # => 1
::Date.whole_months_elapsed(from: ::Date.new(2024, 2, 29), to: ::Date.new(2025, 2, 28)) # => 12
```

- 民法第140条（初日不算入）に従い `from` の翌日を起算日とし、民法第143条第2項に従い応当日の前日をもって満了とします（`2026-01-31` → `2026-02-28` は1ヶ月）。
- 応当日が存在しない月は、同項ただし書に従いその月の末日をもって満了とします（`2026-01-30` → `2026-02-28` は1ヶ月）。
- `from` が月末日の場合は起算日が月初となるため、満了日も月の末日になります（`2026-02-28` → `2026-03-30` は0ヶ月、`2026-03-31` で1ヶ月）。
- `to` が `from` より前の場合は `ArgumentError` が発生します。
- `::Time` / `::DateTime` / `::ActiveSupport::TimeWithZone` 版は日付単位で判定し、時刻は考慮しません。

### ActiveSupportと同名の値を返すメソッド

`beginning_of_this_week` / `end_of_this_week` / `all_this_week` / `beginning_of_this_month` / `end_of_this_month` / `all_this_month` は、ActiveSupportの `beginning_of_week` / `end_of_week` / `all_week` / `beginning_of_month` / `end_of_month` / `all_month` と同じ値を返します。本ライブラリが追加する `*_this_*` という命名に揃えるために定義しているものであり、機能の追加ではありません。

一方、ActiveSupportの**四半期**メソッドは同名のまま値を上書きしています。「ActiveSupportの四半期メソッドの上書き」を参照してください。

## 開発

```shell
bin/setup           # 依存関係のインストール
bundle exec rake    # spec / rubocop / steep をまとめて実行
```

個別に実行する場合は以下のとおりです。

```shell
bundle exec rake spec     # RSpec
bundle exec rake rubocop  # RuboCop
bundle exec rake steep    # Steep（RBSによる型検査）
```

## ライセンス

MIT License. 詳細は [LICENSE](LICENSE) を参照してください。

## 変更履歴

[CHANGELOG.md](CHANGELOG.md) を参照してください。
