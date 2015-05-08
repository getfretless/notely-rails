class API::APIController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_access_control_headers

  protected

  def authorize_api_key
    unless current_api_user.present?
      render nothing: true, status: :unauthorized
    end
  end

  private

  def current_api_user
    @current_api_user ||= User.find_by(api_key: params[:api_key]) if params[:api_key]
  end

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Header'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
