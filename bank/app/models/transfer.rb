class Transfer < ActiveRecord::Base

  belongs_to :from_account, presence: true
  belongs_to :to_account, presence: true
  validates :amount_cents, presence: true

end
