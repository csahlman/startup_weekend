class Dashboard::BaseController < ApplicationController
  include SessionsHelper
  before_action :authenticate_user

  layout 'dashboard'

  private

    def authenticate_user
      render json: { status: :unauthorized } unless user_signed_in?
    end

end