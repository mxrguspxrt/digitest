# == Schema Information
#
# Table name: accounts
#
#  id            :integer          not null, primary key
#  balance_cents :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Account < ActiveRecord::Base
  belongs_to :user
  has_many :outgoing_transfers, class_name: "Transfer", foreign_key: :from_account
  has_many :incoming_transfers, class_name: "Transfer", foreign_key: :to_account

  def has_enough?(amount_cents)
    balance_cents.to_i >= amount_cents.to_i
  end

  def withdraw(amount_cents)
    self.balance_cents -= amount_cents
    save!
  end

  def deposit(amount_cents)
    self.balance_cents += amount_cents
    save!
  end

  def id_and_user_name_and_balance
    "##{id} #{user.name} (#{balance_cents} cents)"
  end

end
