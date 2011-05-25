class Oauth2::TokensController < ApplicationController
  before_filter :authenticate_user!

  def create
    @access_token = current_user.access_tokens.create! :client => Client.find_by_identifier(params[:client_id])
    render :json => @access_token.token_response
  end
end
