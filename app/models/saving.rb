class Saving < ApplicationRecord

    def self.cal_balance(account_id)
        savings = Saving.all # account_idはいったん保留

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
            "千里の道もなんとやら"
        elsif balance < 100000
            "頑張り始めた"
        elsif balance < 300000
            "将来見据えて"
        else
            "c"
        end
    end

end
