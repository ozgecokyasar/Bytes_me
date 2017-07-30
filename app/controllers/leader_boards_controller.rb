class LeaderBoardsController < ApplicationController
  def index
    @users = User.order(score: :desc)
  end
end
