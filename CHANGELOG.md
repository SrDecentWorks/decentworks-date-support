# [0.2.0]

## 拡張方式

- [refineを廃止する #11](https://github.com/SrDecentWorks/decentworks-date-support/issues/11)
  - refinementsをやめ、対象クラスの再オープンと拡張モジュールのincludeによる拡張に変更（`using`の記述が不要）
  - `::Date` … `Decentworks::DateSupport::DateExtension`
  - `::Time` / `::DateTime` / `::ActiveSupport::TimeWithZone` … `Decentworks::DateSupport::TimeExtension`
  - モジュール定義（`date_extension.rb` / `time_extension.rb`）と対象クラスへのinclude
    （`date.rb` / `time.rb` / `date_time.rb` / `time_with_zone.rb`）にファイルを分割
  - `whole_months_elapsed` は各モジュールの `ClassMethods` 経由で提供
    （`expiration_date` は非公開クラスメソッド）

## 破壊的変更

- 設定メソッドをリネーム
  - `Configuration#beginning_of_first_quarter` / `=` → `first_quarter_month_name` / `=`
  - `Configuration#beginning_of_first_quarter_month` → `first_quarter_month`
  - `::Decentworks::DateSupport` 側の委譲メソッドも同様にリネーム
  - `::Date#beginning_of_first_quarter`（期首の日付）と同名で戻り値が異なっていたことによる混同を解消するため
  - 旧名は残していないため、初期化ファイル（`config.beginning_of_first_quarter =`）の修正が必要
- ActiveSupportの四半期メソッドを、設定を反映した値を返すよう上書き
  - `quarter` / `beginning_of_quarter` / `end_of_quarter` / `all_quarter` は暦年基準ではなく
    `first_quarter_month_name` の設定に従う
  - `next_quarter` / `prev_quarter` は3ヶ月後・3ヶ月前の同日ではなく、次/前の四半期の期首を返す
  - ActiveSupportが`alias`で定義している `at_beginning_of_quarter` / `at_end_of_quarter` /
    `last_quarter` は本体の上書きに追従しないため、あわせてメソッド定義で上書き

## 追加

- 現在の日付が属する四半期・上下期・年度を取得するメソッド
  - `this_quarter_number` / `beginning_of_this_quarter` / `end_of_this_quarter` / `all_this_quarter`
  - `this_half_number` / `beginning_of_this_half` / `end_of_this_half` / `all_this_half`
  - `fiscal_year` / `beginning_of_fiscal_year` / `end_of_fiscal_year` / `all_fiscal_year`
- 次の期間・前の期間を取得するメソッド
  - 四半期: `beginning_of_next_quarter` / `end_of_next_quarter` / `all_next_quarter` と `prev` 版
  - 上下期: `beginning_of_next_half` / `end_of_next_half` / `all_next_half` と `prev` 版
  - 年度: `next_fiscal_year` / `beginning_of_next_fiscal_year` / `end_of_next_fiscal_year` /
    `all_next_fiscal_year` と `prev` 版
- `beginning_of_this_month` / `end_of_this_month`
  - `all_this_month` のみ定義されており、`*_this_*` の命名に揃える方針と不整合だったため
  - ActiveSupportの `beginning_of_month` / `end_of_month` と同じ値を返す

## 修正

- 満経過月数（`whole_months_elapsed`）の月末・閏日・逆順の扱い
  - 民法第140条（初日不算入）・第143条第2項に従い、応当日ではなく満了日で判定するよう変更
    （`from`が月末日の場合、満了日も月の末日になる）
  - `::Time` / `::DateTime` / `::ActiveSupport::TimeWithZone` 版は日付単位で判定し、時刻を考慮しない
- 別名メソッドを`alias_method`からメソッド定義に変更（本体メソッドの差し替えに追従）

## 型定義・型検査

- Steepの設定を修正し、型検査が実際に機能する状態にした（`library "date"` / `library "activesupport"`）
- `TimeExtension` をgeneric module（`TimeExtension[T < TimeExtension[T]]`）として宣言
  - 戻り値を `self` ではなく型引数 `T` で表す。`self` ではモジュール内部のレシーバ省略呼び出しが
    モジュール自身の型に解決され `MethodBodyTypeMismatch` になるが、型引数であれば一致する
  - 型引数の上限をモジュール自身にすることで、`T` の値に対してモジュール自身のメソッドと
    自己型（`_DateTimeCalculations[T]`）由来のメソッドの両方を呼べる
  - `sig` の `include` は `TimeExtension[::Time]` のように具体的なクラスを渡す
  - `DateExtension` は `::Date` にのみincludeするため、自己型に `_DateCalculations`（戻り値は `::Date`）を指定
  - 結果として `# steep:ignore` は0件
- Railsジェネレータ（`lib/generators`）も型検査の対象に含めた
  - gem_rbs_collection の railties は `Rails::Generators::Base#template` がブロック必須で
    正しいコードが型エラーになるため使わず、実際に使うメソッドだけを自前で宣言
  - 第三者のクラスのスタブを配布物に含めないよう、`sig-external/` に置いて
    Steepfileの `signature` に追加（gemに同梱するのは `sig/` のみ）

## gemの配布

- 同梱するファイルの指定を除外方式からホワイトリスト方式に変更
  - `lib/` `sig/` `exe/` と `README.md` `CHANGELOG.md` `LICENSE` のみを配布
  - `.claude/` `.rubocop.yml` `.ruby-version` `.rspec` `Steepfile` `rbs_collection*.yaml`
    `CODE_OF_CONDUCT.md` などの開発用ファイルが同梱されていたため
- 重複していたライセンスファイルを `LICENSE` に統一（`LICENSE.txt` を削除）
  - 著作者表記が `yutaka.mizomoto` / `YutakaMizomoto` で不一致だったため、
    gemspecの`authors`に合わせて `decentworks` に統一
- gemspecの`email`を設定（未設定だったため`gem build`で警告が出ていた）
- gemspecに`rubygems_mfa_required`を追加（gem pushに多要素認証を必須にする）
- 開発依存から`rspec-rails`を除外（`railties`のみに変更）

# [0.1.1]

- [四半期、上下期の開始日を設定できるようにする #1](https://github.com/SrDecentWorks/decentworks-date-support/issues/1)
- [週の始まりの曜日の指定を引数から削除 #3](https://github.com/SrDecentWorks/decentworks-date-support/issues/3)
- Gem内のファイル構成をリファクタリング

# [0.1.0]

- 初期リリース
- gem開発実験中
