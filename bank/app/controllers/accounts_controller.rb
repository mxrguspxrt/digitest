class AccountsController < ApplicationController

  def index
    @accounts = current_user.accounts
    respond_with(@accounts)
  end

end
