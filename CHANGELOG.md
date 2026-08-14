# [0.2.0]

- [refineを廃止する #11](https://github.com/SrDecentWorks/decentworks-date-support/issues/11)
  - refinementsをやめ、対象クラスの再オープンによる拡張に変更（`using`の記述が不要）
- `::Time` / `::DateTime` / `::ActiveSupport::TimeWithZone` の拡張を共通実装 `Decentworks::DateSupport::TimeExtension` に統一
- 満経過月数（`whole_months_elapsed`）の月末・閏日・逆順の扱いを修正
  - 民法第140条（初日不算入）・第143条第2項に従い、応当日ではなく満了日で判定するよう変更
    （`from`が月末日の場合、満了日も月の末日になる）
  - `::Time` / `::DateTime` / `::ActiveSupport::TimeWithZone` 版は日付単位で判定し、時刻を考慮しない
- 現在の日付が属する四半期・上下期・年度を取得するメソッドを追加
  - `this_quarter_number` / `beginning_of_this_quarter` / `end_of_this_quarter` / `all_this_quarter`
  - `this_half_number` / `beginning_of_this_half` / `end_of_this_half` / `all_this_half`
  - `fiscal_year` / `beginning_of_fiscal_year` / `end_of_fiscal_year` / `all_fiscal_year`
- 別名メソッドを`alias_method`からメソッド定義に変更（本体メソッドの差し替えに追従）
- Steepの設定を修正し、型検査が実際に機能する状態にした（`library "date"` / `library "activesupport"`）
- 開発依存から`rspec-rails`を除外（`railties`のみに変更）

# [0.1.1]

- [四半期、上下期の開始日を設定できるようにする #1](https://github.com/SrDecentWorks/decentworks-date-support/issues/1)
- [週の始まりの曜日の指定を引数から削除 #3](https://github.com/SrDecentWorks/decentworks-date-support/issues/3)
- Gem内のファイル構成をリファクタリング

# [0.1.0]

- 初期リリース
- gem開発実験中
