class AdminsController < ApplicationController
  def index
    redirect_to departments_path
  end
end
