class Saving < ApplicationRecord

    validate :error_check

    def error_check

        if income.blank? and pay.blank?
            errors[:base] << '収入と支出のどちらかを入力してください'
        end

        if (pay.present? and pay <= 0) or (income.present? and income <= 0)
            errors[:base] << 'マイナスと0は登録できません'
        end
    end

    def self.cal_balance(account_id)
        savings = Saving.where(account_id: account_id)

        total_pay = 0
        total_income = 0

        savings.each do |saving|
            if saving.pay
                total_pay = total_pay + saving.pay
            end
            
            if saving.income
                total_income = total_income + saving.income
            end
        end

        total_income - total_pay
    end

    def self.message_by_balance(balance)
        if balance < 10000
            "千里の道も一歩から"
        elsif balance < 100000
            "お、頑張り始めた"
        elsif balance < 200000
            "将来見据えて"
        elsif balance < 300000
            "絶対間に合うよ"
        elsif balance < 400000
            "未来を変えよう"
        elsif balance < 500000
            "時は止まらないからね"
        elsif balance < 600000
            "習慣化してきたかな？"
        elsif balance < 700000
            "まだまだできるよね？"
        elsif balance < 800000
            "もうすぐ一区切り"
        elsif balance < 900000
            "百里を行くものは九十を半ばとす、だよ"
        elsif balance < 1000000
            "続けるよね？"
        else
            "想像し、創造せよ"
        end
    end

end
