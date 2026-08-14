# [Unreleased]

- `::Date` の拡張方式を、クラスの直接再オープンから `Decentworks::DateSupport::DateExtension` モジュールのincludeに変更
  - `::Time` / `::DateTime` / `::ActiveSupport::TimeWithZone`（`TimeExtension`）と同じ構成に統一
  - `date_extension.rb`（モジュール定義）と `date.rb`（対象クラスへのinclude）に分割
  - `::Date.whole_months_elapsed` は `DateExtension::ClassMethods` 経由で提供
    （`expiration_date` は引き続き非公開クラスメソッド）
  - 公開APIの名前・戻り値・可視性に変更はなし
- **破壊的変更** 設定メソッドをリネーム
  - `Configuration#beginning_of_first_quarter` / `=` → `first_quarter_month_name` / `=`
  - `Configuration#beginning_of_first_quarter_month` → `first_quarter_month`
  - `::Decentworks::DateSupport` 側の委譲メソッドも同様にリネーム
  - `::Date#beginning_of_first_quarter`（期首の日付）と同名で戻り値が異なっていたことによる混同を解消するため
  - 旧名は残していないため、初期化ファイル（`config.beginning_of_first_quarter =`）の修正が必要
- gemに同梱するファイルの指定を除外方式からホワイトリスト方式に変更
  - `lib/` `sig/` `exe/` と `README.md` `CHANGELOG.md` `LICENSE` のみを配布
  - `.claude/` `.rubocop.yml` `.ruby-version` `.rspec` `Steepfile` `rbs_collection*.yaml`
    `CODE_OF_CONDUCT.md` などの開発用ファイルが同梱されていたため
- 重複していたライセンスファイルを `LICENSE` に統一（`LICENSE.txt` を削除）
  - 著作者表記が `yutaka.mizomoto` / `YutakaMizomoto` で不一致だったため、gemspecの`authors`に合わせて `decentworks` に統一
- gemspecの`email`を設定（未設定だったため`gem build`で警告が出ていた）
- gemspecに`rubygems_mfa_required`を追加（gem pushに多要素認証を必須にする）
- 次の期間・前の期間を取得するメソッドを追加
  - 四半期: `beginning_of_next_quarter` / `end_of_next_quarter` / `all_next_quarter` と `prev` 版
  - 上下期: `beginning_of_next_half` / `end_of_next_half` / `all_next_half` と `prev` 版
  - 年度: `next_fiscal_year` / `beginning_of_next_fiscal_year` / `end_of_next_fiscal_year` /
    `all_next_fiscal_year` と `prev` 版
- **破壊的変更** ActiveSupportの四半期メソッドを設定を反映した値を返すよう上書き
  - `quarter` / `beginning_of_quarter` / `end_of_quarter` / `all_quarter` は暦年基準ではなく
    `first_quarter_month_name` の設定に従う
  - `next_quarter` / `prev_quarter` は3ヶ月後・3ヶ月前の同日ではなく、次/前の四半期の期首を返す
  - ActiveSupportが`alias`で定義している `at_beginning_of_quarter` / `at_end_of_quarter` /
    `last_quarter` は本体の上書きに追従しないため、あわせてメソッド定義で上書き
- `TimeExtension` の型定義をgeneric module（`TimeExtension[T < TimeExtension[T]]`）に変更
  - 戻り値を `self` から型引数 `T` に変更し、`# steep:ignore MethodBodyTypeMismatch` 48箇所を削除
  - `self` 宣言では、モジュール内部のレシーバ省略呼び出しがモジュール自身の型に解決されるため
    型エラーになっていた。型引数であれば一致する
  - 型引数の上限をモジュール自身にすることで、`T` の値に対してモジュール自身のメソッドと
    自己型（`_DateTimeCalculations[T]`）由来のメソッドの両方を呼べる
  - `sig` の `include` は `TimeExtension[::Time]` のように具体的なクラスを渡す形になった
- `beginning_of_this_month` / `end_of_this_month` を追加
  - `all_this_month` のみ定義されており、`*_this_*` の命名に揃える方針と不整合だったため
  - ActiveSupportの`beginning_of_month` / `end_of_month`と同じ値を返す

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
