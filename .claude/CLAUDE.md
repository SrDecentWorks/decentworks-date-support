# プロジェクト概要

- 日付・時刻のユーティリティgem

## 前提環境

- Ruby 4.0（gemspecの required_ruby_version）
- テスト: RSpec
- Lint: RuboCop

# 設計上の決定事項

以下は検討済みのうえで現状の実装を選択している。改善提案・指摘は不要。

- 設定（`first_quarter_month_name`）はプロセスグローバルの単一値とする
  - テナントごと・呼び出しごとに会計年度を切り替える要件は対象外
  - スコープ付きの一時切替やメソッドへのキーワード引数によるオーバーライドは追加しない
- `Decentworks::DateSupport.configuration` の `@configuration ||= Configuration.new` はスレッドセーフにしない
  - 設定はアプリケーション起動時（Railsのinitializer）に一度だけ行う前提のため
- `required_ruby_version` は `>= 4.0.0`、`activesupport` は `~> 8.1` のまま緩めない
  - 利用想定がこのバージョン以降のため。旧バージョンのRuby / Railsへの対応は行わない
  - 詳細は [@.claude/rules/rubygems.md](.claude/rules/rubygems.md)
- 対象クラスへのメソッド追加は無条件に行い、名前が衝突した場合は後勝ちでよい
  - アプリ側や他gemに同名メソッドがあるかを判定して定義をスキップする、警告を出すなどの仕組みは追加しない
- CI（GitHub Actions等）は用意しない
  - `bundle exec rake`（rspec / rubocop / steep）をローカルで実行して確認する運用とする
- `date_extension.rb` と `time_extension.rb` のメソッド重複は許容する
  - 暦月12ヶ月ぶんを`define_method`でまとめる等の共通化は行わない
  - 明示的なメソッド定義を保つことを優先する（IDE補完・RBS・可読性）
- 年度関係のメソッドには `this_` を付けない
  - `this_` は「第1四半期」「上期」のような絶対的な期間を指すメソッドと区別するためのもの
  - 年度には絶対版（`first_fiscal_year`のようなもの）が存在せず、区別する必要がない
  - ActiveSupportの `beginning_of_year` / `all_year` も同様。理由はREADMEに記載済み
- `one_month_ago` / `one_month_since` は追加しない
  - ActiveSupportの `next_month` / `prev_month` のほうが理解しやすいため、そちらに委ねる

# コミュニケーション

- 日本語で応答する（コード・変数名は英語）
- 簡潔に回答し、自明な説明は省略する
- 複雑なタスクでは実装前に計画を提示し、承認後に着手する

# 禁止事項

- README・ドキュメントを勝手に生成・変更しない
- テストコードを確認なしに削除・コメントアウトしない
- 既存の動作するコードを理由なくリファクタリングしない
- APIキー・トークンをプロンプトに含めない
- .env ファイルを読んで内容を出力しない
- 環境変数の値をログやコメントに書かない
