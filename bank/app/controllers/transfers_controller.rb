class TransfersController < ApplicationController

  def index
    account_ids = current_user.accounts.map(&:id)
    @transfers = Transfer.where(
      "from_account_id in(?) OR to_account_id in(?)",
      account_ids, account_ids
    )
    respond_with(@transfers)
  end

  def new
    @from_accounts = current_user.accounts
    @to_accounts = Account.all
    @transfer = Transfer.new(from_account: @from_accounts.first)
    respond_with(@transfer)
  end

  def create
    @from_accounts = current_user.accounts
    @to_accounts = Account.all

    @transfer = Transfer.new(transfer_params)
    if current_user.accounts.include?(@transfer.from_account)
      @transfer.transfer
    else
      @transfer.errors.add(:from_account, "does not belong to user")
    end
    respond_with(@transfer, location: transfers_path)
  end

  def transfer_params
    params.require(:transfer).permit(:id, :from_account_id, :to_account_id, :amount_cents)
  end

end
