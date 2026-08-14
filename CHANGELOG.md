# [0.2.0]

- [refineを廃止する #11](https://github.com/SrDecentWorks/decentworks-date-support/issues/11)
  - refinementsをやめ、対象クラスの再オープンによる拡張に変更（`using`の記述が不要）
- `::Time` / `::DateTime` / `::ActiveSupport::TimeWithZone` の拡張を共通実装 `Decentworks::DateSupport::TimeExtension` に統一
- 満経過月数（`whole_months_elapsed`）の月末・閏日・逆順の扱いを修正
  - `::Time` / `::DateTime` / `::ActiveSupport::TimeWithZone` 版は日付単位で判定し、時刻を考慮しない
- 別名メソッドを`alias_method`からメソッド定義に変更（本体メソッドの差し替えに追従）

# [0.1.1]

- [四半期、上下期の開始日を設定できるようにする #1](https://github.com/SrDecentWorks/decentworks-date-support/issues/1)
- [週の始まりの曜日の指定を引数から削除 #3](https://github.com/SrDecentWorks/decentworks-date-support/issues/3)
- Gem内のファイル構成をリファクタリング

# [0.1.0]

- 初期リリース
- gem開発実験中
