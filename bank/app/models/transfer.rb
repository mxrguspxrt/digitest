class Transfer < ActiveRecord::Base

  belongs_to :from_account, class_name: "Account"
  belongs_to :to_account, class_name: "Account"

  validates :from_account, presence: true
  validates :to_account, presence: true
  validates :amount_cents, presence: true

  validate :cant_trasfer_to_the_same_account
  validate :amount_cents_is_larger_than_0
  validate :from_account_has_enough_balance

  def cant_trasfer_to_the_same_account
    errors.add(:to_account, "can't be same as from account") if from_account && from_account == to_account
  end

  def amount_cents_is_larger_than_0
    errors.add(:amount_cents, "has to be more than 0") if amount_cents.to_i <= 0
  end

  def from_account_has_enough_balance
    errors.add(:from_account, "has not enough balance") if from_account && !from_account.has_enough?(amount_cents)
  end

  def transfer
    begin
      ActiveRecord::Base.transaction do
        save!
        from_account.withdraw(amount_cents)
        to_account.deposit(amount_cents)
      end
    rescue ActiveRecord::RecordInvalid
    end
  end

end
