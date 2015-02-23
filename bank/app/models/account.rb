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
end
