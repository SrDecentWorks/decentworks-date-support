# frozen_string_literal: true

# 別名メソッドが本体メソッドを遅延束縛していること
#
# alias_methodはメソッド実体を定義時点で掴むため、利用側がクラスを再オープンして
# 本体メソッドを差し替えても別名が追従しない。メソッド定義であれば呼び出し時に解決される。
#
# includeする側で `let(:time)` を定義すること。
RSpec.shared_examples "別名メソッドの遅延束縛" do
  let(:instance) { time.call(2026, 8, 5, 12, 34, 56) }

  {
    beginning_of_this_month:  :beginning_of_month,
    end_of_this_month:        :end_of_month,
    half_year_ago:            :six_months_ago,
    half_year_since:          :six_months_since,
    beginning_of_first_half:  :beginning_of_first_quarter,
    end_of_first_half:        :end_of_second_quarter,
    beginning_of_second_half: :beginning_of_third_quarter,
    end_of_second_half:       :end_of_fourth_quarter,
    beginning_of_fiscal_year: :beginning_of_first_quarter,
    end_of_fiscal_year:       :end_of_fourth_quarter,
    quarter:                  :this_quarter_number,
    beginning_of_quarter:     :beginning_of_this_quarter,
    at_beginning_of_quarter:  :beginning_of_quarter,
    end_of_quarter:           :end_of_this_quarter,
    at_end_of_quarter:        :end_of_quarter,
    all_quarter:              :all_this_quarter,
    next_quarter:             :beginning_of_next_quarter,
    prev_quarter:             :beginning_of_prev_quarter,
    last_quarter:             :prev_quarter
  }.each do |alias_name, original_name|
    describe "##{alias_name}" do
      subject { overridden.public_send(alias_name) }

      let(:override) do
        ::Module.new do
          define_method(original_name) { :overridden }
        end
      end
      let(:overridden) { instance.extend(override) }

      it "##{original_name}の差し替えに追従する" do
        expect(subject).to eq :overridden
      end

      it "差し替え前は本体メソッドと同じ値を返す" do
        expect(instance.public_send(alias_name)).to eq instance.public_send(original_name)
      end
    end
  end
end
