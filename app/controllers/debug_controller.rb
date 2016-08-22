class DebugController < ApplicationController
  before_action :authenticate_user, only: :api

  def hoge
  end

  def api
    render json: { "message": "success!" }
  end
end
